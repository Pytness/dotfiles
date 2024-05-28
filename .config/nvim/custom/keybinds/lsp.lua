local telescope_builtin = require 'telescope.builtin'

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>lK', vim.diagnostic.reset, { desc = 'Clear all diagnostics' })
vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>lR', telescope_builtin.lsp_references, { desc = '[R]eferences' })

vim.keymap.set('n', '<leader>lC', '<cmd>Copilot toggle<cr>', { desc = '[R]eferences' })

-- Rename the variable under your cursor
--  Most Language Servers support renaming across files, etc.
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = '[R]ename' })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

-- Opens a popup that displays documentation about the word under your cursor
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })

vim.keymap.set('n', '<leader>lh', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Show inlay [H]ints' })
