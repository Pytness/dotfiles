-- LSP Configuration & Plugins
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
  dependencies = {

    -- Automatically install LSPs and related tools to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'saghen/blink.cmp',

    -- Useful status updates for LSP.
    { 'j-hui/fidget.nvim', opts = {} },
  },

  opts = {

    border = {
      { '╭', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '╮', 'FloatBorder' },
      { '│', 'FloatBorder' },
      { '╯', 'FloatBorder' },
      { '─', 'FloatBorder' },
      { '╰', 'FloatBorder' },
      { '│', 'FloatBorder' },
    },
    servers = {
      -- clangd = {},
      -- gopls = {},
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pyls_black = { enabled = true },
              isort = { enabled = true },
            },
          },
        },
      },
      rust_analyzer = {
        -- cmd = { home_dir .. '/.cargo/bin/ra-multiplex' },
        settings = {
          ['rust-analyzer'] = {

            checkOnSave = {
              allFeatures = true,
              command = 'clippy',
              extraArgs = {
                '--',
                '--no-deps',
              },
            },

            imports = {
              granularity = {
                group = 'module',
              },
              prefix = 'self',
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
            diagnostics = {
              disabled = { 'unresolved-prov-macro' },
              experimental = {
                enable = true,
              },
            },
            inlayHints = {
              bindingModeHints = {
                enable = false,
              },
              chainingHints = {
                enable = true,
              },
              closingBraceHints = {
                enable = true,
                minLines = 25,
              },
              closureReturnTypeHints = {
                enable = 'never',
              },
              lifetimeElisionHints = {
                enable = 'never',
                useParameterNames = false,
              },
              maxLength = 25,
              parameterHints = {
                enable = true,
              },
              reborrowHints = {
                enable = 'never',
              },
              renderColons = true,
              typeHints = {
                enable = true,
                hideClosureInitialization = false,
                hideNamedConstructor = false,
              },
            },
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded
              -- for your neovim configuration.
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
              -- If lua_ls is really slow on your computer, you can try this instead:
              -- library = { vim.env.VIMRUNTIME },
            },
            completion = {
              callSnippet = 'Replace',
            },
            hint = { enable = true },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    },
  },

  config = function(_, opts)
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local border = {
          -- ╭─╮
          -- │ │
          -- ╰─╯
          { '╭', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '╮', 'FloatBorder' },
          { '│', 'FloatBorder' },
          { '╯', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '╰', 'FloatBorder' },
          { '│', 'FloatBorder' },
        }

        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

        ---@diagnostic disable-next-line: duplicate-set-field
        vim.lsp.util.open_floating_preview = function(contents, syntax, _opts, ...)
          _opts = _opts or {}
          _opts.border = _opts.border or border
          return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    require('lspconfig').gdscript.setup { capabilities = capabilities }

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(opts.servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format lua code
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = true,

      handlers = {
        function(server_name)
          local server = opts.servers[server_name] or {}

          server.capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
