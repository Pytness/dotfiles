local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/lvim/?.lua;" .. package.path


lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "palenight"
lvim.builtin.lualine.options.theme = "auto"
lvim.transparent_window = false
lvim.background = 'black'
vim.opt.whichwrap = "b,s"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>Q"] = ":q!<cr>"

vim.cmd("nnoremap x \"_x")
vim.cmd("nnoremap d \"_d")
vim.cmd("nnoremap D \"_D")
vim.cmd("vnoremap d \"_d")

vim.cmd("nnoremap ,x \"+x")
vim.cmd("nnoremap ,d \"+d")
vim.cmd("nnoremap ,D \"+D")
vim.cmd("vnoremap ,d \"+d")
vim.cmd("nnoremap ,dd \"+dd")

vim.cmd("set background=dark")
vim.cmd("set termguicolors")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=4")
vim.cmd("set cmdheight=1")

vim.opt.cursorline = true


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.highlight.enabled = true

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
local capabilities = require("lvim.lsp").common_capabilities()
capabilities.offsetEncoding = "utf-8"

local opts = {
    cmd = { "clangd", "--enable-config" },
    capabilities = capabilities,
}

require("lvim.lsp.manager").setup("clangd", opts)

vim.g.palenight_color_overrides = {
    --     -- black = { gui = '#000000', cterm = "0", cterm16 = "0" },
    --     blue = { gui = "#8cb8ff", cterm = "39", cterm16 = "4" },
    --     purple = { gui = "#d67cde", cterm = "170", cterm16 = "5" },
    --     blue_purple = { gui = "#8a87de", cterm = "39", cterm16 = "4" },
    --     cyan = { gui = "#96e1ff", cterm = "38", cterm16 = "6" },
    --     white = { gui = "#e6efff", cterm = "145", cterm16 = "7" },
    cursor_grey = { gui = "#3E4452", cterm = 236, cterm16 = "8" },
}
-- vim.g.palenight_termcolors = 16;
vim.g.palenight_terminal_italics = 1;

-- Additional Plugins
lvim.plugins = {
    { "lunarvim/colorschemes" },
    { "pytness/palenight.vim" },
    -- { "github/copilot.vim" },
    {
        "ggandor/lightspeed.nvim",
        event = "BufRead",
        config = function()
            require 'lightspeed'.setup {
                ignore_case = true
            }
        end
    },
    { "lukas-reineke/indent-blankline.nvim" },
    { "gen740/SmoothCursor.nvim",
        event = "WinScrolled",
        config = function()
            require('smoothcursor').setup {
                autostart = true,
                cursor = "", -- cursor shape (need nerd font)
                intervals = 35, -- tick interval
                linehl = nil, -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
                type = "exp", -- define cursor movement calculate function, "default" or "exp" (exponential).
                fancy = {
                    enable = true, -- enable fancy mode
                    head = { cursor = "", texthl = "SmoothCursor", linehl = nil },
                    body = {
                        { cursor = "", texthl = "SmoothCursorRed" },
                        { cursor = "", texthl = "SmoothCursorOrange" },
                        { cursor = "●", texthl = "SmoothCursorYellow" },
                        { cursor = "●", texthl = "SmoothCursorGreen" },
                        { cursor = "•", texthl = "SmoothCursorAqua" },
                        { cursor = ".", texthl = "SmoothCursorBlue" },
                        { cursor = ".", texthl = "SmoothCursorPurple" },
                    },
                    tail = { cursor = nil, texthl = "SmoothCursor" }
                },
                priority = 10, -- set marker priority
                speed = 25, -- max is 100 to stick to your current position
                texthl = "SmoothCursor", -- highlight group, default is { bg = nil, fg = "#FFD400" }
                threshold = 3,
                timeout = 3000,
            }
        end
    },
    { "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end
    },
    { "ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end,
    },
    { "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup {
                    plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
                    suggestion = {
                        auto_trigger = true,
                    },
                }
            end, 100)
        end,
    },
    { "chentoast/marks.nvim",
        event = "BufReadPre",
        config = function()
            require("marks").setup {}
        end,
    }
}

-- Disable autocompletion popup unless I press tab
local cmp = require 'cmp'
cmp.setup {
    completion = {
        autocomplete = false,
    }
}

vim.g.lightspeed_no_default_keymaps = 1
vim.cmd("nmap s <Plug>Lightspeed_omni_s")

require("telescope").setup({
    defaults = {
        preview = {
            mime_hook = function(filepath, bufnr, opts)
                local is_image = function(filepath)
                    local image_extensions = { 'png', 'jpg', 'jpeg' } -- Supported image formats
                    local split_path = vim.split(filepath:lower(), '.', { plain = true })
                    local extension = split_path[#split_path]
                    return vim.tbl_contains(image_extensions, extension)
                end
                if is_image(filepath) then
                    local term = vim.api.nvim_open_term(bufnr, {})
                    local function send_output(_, data, _)
                        for _, d in ipairs(data) do
                            vim.api.nvim_chan_send(term, d .. '\r\n')
                        end
                    end

                    vim.fn.jobstart(
                        {
                            'catimg', filepath -- Terminal image viewer command
                        },
                        { on_stdout = send_output, stdout_buffered = true })
                else
                    require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid,
                        "Binary cannot be previewed")
                end
            end
        },
    }
})

-- Get palenight colors

local colors = {
    red = "#ff5370",
    light_red = "#ff869a",
    dark_red = "#BE5046",
    green = "#C3E88D",
    yellow = "#ffcb6b",
    dark_yellow = "#F78C6C",
    blue = "#8cb8ff",
    purple = "#d67cde",
    blue_purple = "#8a87de",
    cyan = "#96e1ff",
    white = "#e6efff",
    black = "#292D3E",
    visual_black = "NONE",
    comment_grey = "#697098",
    gutter_fg_grey = "#4B5263",
    cursor_grey = "#2C323C",
    visual_grey = "#3E4452",
    menu_grey = "#3E4452",
    special_grey = "#3B4048",
    vertsplit = "#181A1F",
    white_mask_1 = "#333747",
    white_mask_3 = "#474b59",
    white_mask_11 = "#989aa2"
}


lvim.builtin.lualine.options.theme = {
    normal = {
        a = { fg = colors.white, bg = colors.white, gui = "bold" },
        b = { fg = colors.white, bg = colors.white_mask_3, gui = "bold" },
        c = { fg = colors.white, bg = colors.cursor_grey, gui = "bold" },
    },
    insert = {
        a = { fg = colors.white, bg = colors.blue, gui = "bold" },
        b = { fg = colors.blue, bg = colors.white_mask_3, gui = "bold" },
    },
    visual = {
        a = { fg = colors.white, bg = colors.purple, gui = "bold" },
        b = { fg = colors.purple, bg = colors.white_mask_3, gui = "bold" },
    },
    replace = {
        a = { fg = colors.white, bg = colors.green, gui = "bold" },
        b = { fg = colors.green, bg = colors.white_mask_3, gui = "bold" },
    },
    inactive = {
        a = { fg = colors.black, bg = colors.white_mask_3, gui = "bold" },
        -- b = { fg = colors.white_mask_3, bg = colors.white_mask_3, gui = "bold" },
    },
}

require "custom.dashboard"
