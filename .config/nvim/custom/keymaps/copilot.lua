local function selection(source)
  local select = require 'CopilotChat.select'

  return select.visual(source) or select.buffer
end

vim.api.nvim_create_user_command('CopilotChatLeetTest', function()
  local chat = require 'CopilotChat'

  chat.reset()
  chat.ask '@buffer Generate tests for this problem, do not implement the solution.'
end, { nargs = '*', range = true })

vim.api.nvim_create_user_command('CopilotChatRefactor', function()
  local chat = require 'CopilotChat'
  chat.ask('Refactor the following code. Extract code into functions, methods, or classes as needed.', { selection = selection })
end, { nargs = '*', range = true })

vim.api.nvim_create_user_command('CopilotChatExplainAdvanced', function()
  local chat = require 'CopilotChat'
  chat.ask(
    '/COPILOT_EXPLAIN Write a detailed and technical explanation of the following code. Assume the user is a senior programmer and is extremelly knowledgeable of programming topics',
    { selection = selection }
  )
end, { nargs = '*', range = true })

vim.api.nvim_create_user_command('CopilotChatImplement', function()
  local chat = require 'CopilotChat'
  chat.ask(
    [[
    @buffers

    Write the missing implementations of the following code.
    The user will use your code and `git patch` it into their codebase.
    ]],
    { selection = selection }
  )
end, { nargs = '*', range = true })

vim.api.nvim_create_user_command('CopilotChatImplementInline', function()
  local chat = require 'CopilotChat'
  chat.ask(
    [[
    @buffers

    Write the missing implementations of the selected code.
    The user will use your code and `git patch` it into their codebase.
    Only write the implementations.
    ]],
    {
      selection = selection,
      callback = function(response, source)
        -- get code inside ```<lang>\n<code>\n```

        local code = response:match '```%w+\n(.-)\n```'

        if not code then
          return
        end

        -- chat.close()

        -- replace the current selection with the code
        local bufnr = source.bufnr

        local start_line = vim.api.nvim_buf_get_mark(bufnr, '<')[1]
        local end_line = vim.api.nvim_buf_get_mark(bufnr, '>')[1]

        local lines = vim.split(code, '\n', { plain = true })

        vim.api.nvim_buf_set_lines(bufnr, start_line - 1, end_line, false, lines)

        chat.close()

        -- focus the buffer
        vim.api.nvim_set_current_buf(bufnr)

        -- move the cursor to the first line of the code
        vim.api.nvim_win_set_cursor(0, { start_line, 1 })

        -- enter Visual mode
        vim.api.nvim_feedkeys('V', 'n', true)

        -- move n lines down
        vim.api.nvim_feedkeys(tostring(#lines - 1) .. 'j', 'n', true)

        -- auto indent
        vim.api.nvim_feedkeys('=', 'n', true)
      end,
    }
  )
end, { nargs = '*', range = true })

vim.api.nvim_create_user_command('CopilotChatReadable', function()
  local chat = require 'CopilotChat'
  chat.ask(
    [[
    @buffers

    Make the following code more readable. Follow common conventions and best practices.
    Rename variables, functions, and classes as needed using meaningful names.
    ]],
    { selection = selection }
  )
end, { nargs = '*', range = true })

-- :CopilotChatExplain - Write an explanation for the active selection as paragraphs of text
-- :CopilotChatReview - Review the selected code
-- :CopilotChatFix - There is a problem in this code. Rewrite the code to show it with the bug fixed
-- :CopilotChatOptimize - Optimize the selected code to improve performance and readablilty
-- :CopilotChatDocs - Please add documentation comment for the selection
-- :CopilotChatTests - Please generate tests for my code
-- :CopilotChatFixDiagnostic - Please assist with the following diagnostic issue in file
-- :CopilotChatCommit - Write commit message for the change with commitizen convention
-- :CopilotChatCommitStaged - Write commit message for the change with commitizen convention
local modes = { 'n', 'v' }

return {
  { modes, '<leader>aa', '<cmd>CopilotChatToggle<cr>', { desc = 'CopilotChat: Open chat' } },
  { modes, '<leader>ac', '<cmd>CopilotChatCommit<cr>', { desc = 'CopilotChat: Commit' } },
  { modes, '<leader>aC', '<cmd>CopilotChatCommitStaged<cr>', { desc = 'CopilotChat: CommitStaged' } },
  { modes, '<leader>ar', '<cmd>CopilotChatReview<cr>', { desc = 'CopilotChat: Review' } },
  { modes, '<leader>af', '<cmd>CopilotChatFix<cr>', { desc = 'CopilotChat: Fix' } },
  { modes, '<leader>aF', '<cmd>CopilotChatFixDiagnostic<cr>', { desc = 'CopilotChat: FixDiagnostic' } },
  { modes, '<leader>ao', '<cmd>CopilotChatOptimize<cr>', { desc = 'CopilotChat: Optimize' } },
  { modes, '<leader>ad', '<cmd>CopilotChatDocs<cr>', { desc = 'CopilotChat: Docs' } },
  { modes, '<leader>at', '<cmd>CopilotChatTests<cr>', { desc = 'CopilotChat: Tests' } },
  { modes, '<leader>ae', '<cmd>CopilotChatExplain<cr>', { desc = 'CopilotChat: Explain' } },
  { modes, '<leader>aE', '<cmd>CopilotChatExplainAdvanced<cr>', { desc = 'CopilotChat: Advanced Explain' } },
  { modes, '<leader>aR', '<cmd>CopilotChatRefactor<cr>', { desc = 'CopilotChat: Refactor' } },
  { modes, '<leader>al', '<cmd>CopilotChatReadable<cr>', { desc = 'CopilotChat: Readable' } },
  { modes, '<leader>ai', '<cmd>CopilotChatImplement<cr>', { desc = 'CopilotChat: Implement' } },
  { modes, '<leader>aI', '<cmd>CopilotChatImplementInline<cr>', { desc = 'CopilotChat: Implement inline' } },

  { modes, '<leader>aT', '<cmd>CopilotChatLeetTest<cr>', { desc = 'CopilotChat: Implement leet code test' } },
}

-- for _, keymap in ipairs(mappings) do
--   vim.keymap.set('n', keymap[1], keymap[2], keymap[3])
--   vim.keymap.set('v', keymap[1], keymap[2], keymap[3])
-- end
