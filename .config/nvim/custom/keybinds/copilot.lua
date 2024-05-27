local chat = require 'CopilotChat'
local select = require 'CopilotChat.select'

local function selection(source)
  return select.visual(source) or select.buffer
end
local function chat_refactor()
  chat.reset()
  chat.open()

  chat.ask 'Refactor the following code. Extract code into functions, methods, or classes as needed.'
end

vim.api.nvim_create_user_command('CopilotChatRefactor', function()
  chat.ask('Refactor the following code. Extract code into functions, methods, or classes as needed.', { selection = selection })
end, { nargs = '*', range = true })
local mappings = {
  { '<leader>aa', '<cmd>CopilotChatToggle<cr>', { desc = 'CopilotChat: Open chat' } },
  { '<leader>al', '<cmd>CopilotChatReset<cr>', { desc = 'CopilotChat: Reset chat' } },
  { '<leader>ac', '<cmd>CopilotChatCommit<cr>', { desc = 'CopilotChat: Commit' } },
  { '<leader>aC', '<cmd>CopilotChatCommitStaged<cr>', { desc = 'CopilotChat: CommitStaged' } },
  { '<leader>ar', '<cmd>CopilotChatReview<cr>', { desc = 'CopilotChat: Review' } },
  { '<leader>af', '<cmd>CopilotChatFix<cr>', { desc = 'CopilotChat: Fix' } },
  { '<leader>aF', '<cmd>CopilotChatFixDiagnostic<cr>', { desc = 'CopilotChat: FixDiagnostic' } },
  { '<leader>ao', '<cmd>CopilotChatOptimize<cr>', { desc = 'CopilotChat: Optimize' } },
  { '<leader>ad', '<cmd>CopilotChatDocs<cr>', { desc = 'CopilotChat: Docs' } },
  { '<leader>at', '<cmd>CopilotChatTests<cr>', { desc = 'CopilotChat: Tests' } },
  { '<leader>ae', '<cmd>CopilotChatExplain<cr>', { desc = 'CopilotChat: Explain' } },
  { '<leader>aR', '<cmd>CopilotChatRefactor<cr>', { desc = 'CopilotChat: Refactor' } },
}

for _, keymap in ipairs(mappings) do
  vim.keymap.set('n', keymap[1], keymap[2], keymap[3])
  vim.keymap.set('v', keymap[1], keymap[2], keymap[3])
end

-- :CopilotChatExplain - Write an explanation for the active selection as paragraphs of text
-- :CopilotChatReview - Review the selected code
-- :CopilotChatFix - There is a problem in this code. Rewrite the code to show it with the bug fixed
-- :CopilotChatOptimize - Optimize the selected code to improve performance and readablilty
-- :CopilotChatDocs - Please add documentation comment for the selection
-- :CopilotChatTests - Please generate tests for my code
-- :CopilotChatFixDiagnostic - Please assist with the following diagnostic issue in file
-- :CopilotChatCommit - Write commit message for the change with commitizen convention
-- :CopilotChatCommitStaged - Write commit message for the change with commitizen convention
