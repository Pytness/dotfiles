local fzf = require 'fzf-lua'

local function toggle_hints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

return {
  -- Diagnostic keymaps
  { 'n', '<leader>f', 'za', { desc = 'Toggle Fold' } },
  { 'n', '<leader>lk', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' } },
  { 'n', '<leader>lK', vim.diagnostic.reset, { desc = 'Clear all diagnostics' } },
  { 'n', '<leader>lj', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' } },

  { 'n', '<leader>le', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' } },
  { 'n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' } },
  { 'n', '<leader>lR', fzf.lsp_references, { desc = 'Show references' } },
  { 'n', '<leader>gi', fzf.lsp_implementations, { desc = 'Show implementations' } },

  { 'n', '<leader>lC', '<cmd>Copilot toggle<cr>', { desc = '[R]eferences' } },

  -- Rename the variable under your cursor
  --  Most Language Servers support renaming across files, etc.
  { 'n', '<leader>lr', vim.lsp.buf.rename, { desc = '[R]ename' } },

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  { 'n', '<leader>la', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' } },

  -- Opens a popup that displays documentation about the word under your cursor
  { 'n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' } },

  { 'n', '<leader>ld', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' } },
  { 'n', '<leader>lD', vim.lsp.buf.definition, { desc = '[G]oto [D]eclaration' } },
  { 'n', '<leader>lt', vim.lsp.buf.type_definition, { desc = 'Type definition' } },
  { 'n', '<leader>lh', toggle_hints, { desc = 'Show inlay [H]ints' } },
}
