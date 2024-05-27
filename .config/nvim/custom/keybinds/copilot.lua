local mappings = {
  { '<leader>mcc', '<cmd>CopilotChatCommit<cr>', { desc = 'CopilotChatCommit' } },
  { '<leader>mcC', '<cmd>CopilotChatCommitStaged<cr>', { desc = 'CopilotChatCommitStaged' } },
  { '<leader>mcr', '<cmd>CopilotChatReview<cr>', { desc = 'CopilotChatReview' } },
  { '<leader>mcf', '<cmd>CopilotChatFix<cr>', { desc = 'CopilotChatFix' } },
  { '<leader>mcF', '<cmd>CopilotChatFixDiagnostic<cr>', { desc = 'CopilotChatFixDiagnostic' } },
  { '<leader>mco', '<cmd>CopilotChatOptimize<cr>', { desc = 'CopilotChatOptimize' } },
  { '<leader>mcd', '<cmd>CopilotChatDocs<cr>', { desc = 'CopilotChatDocs' } },
  { '<leader>mct', '<cmd>CopilotChatTests<cr>', { desc = 'CopilotChatTests' } },
  { '<leader>mct', '<cmd>CopilotChatTests<cr>', { desc = 'CopilotChatTests' } },
  { '<leader>mce', '<cmd>CopilotChatExplain<cr>', { desc = 'CopilotChatExplain' } },
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
