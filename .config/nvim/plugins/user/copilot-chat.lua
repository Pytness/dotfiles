-- copilot chat
return {
  'CopilotC-Nvim/CopilotChat.nvim',
  -- lazy = true,
  branch = 'main',
  build = 'make tiktoken',
  dependencies = {
    { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
    { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  },

  module = 'CopilotChat',
  cmd = {
    'CopilotChatCommit',
    'CopilotChatCommitStaged',
    'CopilotChatDocs',
    'CopilotChatExplain',
    -- 'CopilotChatExplainAdvanced',
    'CopilotChatFix',
    'CopilotChatFixDiagnostic',
    -- 'CopilotChatImplement',
    -- 'CopilotChatImplementInline',
    'CopilotChatLeetTest',
    'CopilotChatModel',
    'CopilotChatModels',
    'CopilotChatOptimize',
    'CopilotChatReadable',
    -- 'CopilotChatRefactor',
    'CopilotChatReview',
    'CopilotChatTests',
    'CopilotChatToggle',
  },
  opts = {
    debug = false,
    clear_chat_on_new_prompt = false,
    -- model = 'claude-3.5-sonnet',
    prompts = {
      Explain = {
        prompt = '/COPILOT_EXPLAIN Write a detailed and technical explanation of the following code.',
      },
      Review = {
        prompt = '/COPILOT_REVIEW Review the selected code.',
      },
      Fix = {
        prompt = '/COPILOT_GENERATE There is an issue in this code. Rewrite the code to show it with the bug fixed.',
      },
      Optimize = {
        prompt = '/COPILOT_GENERATE Optimize the selected code to improve performance and readablilty.',
      },
      Docs = {
        prompt = '/COPILOT_GENERATE Add documentation and comments for the following code. Follow these rules:\n1) The comments should not duplicate the code.\n2) Explain unidiomatic code.',
      },
      Tests = {
        prompt = '/COPILOT_GENERATE Generate tests for my code.',
      },
      FixDiagnostic = {
        prompt = 'Please assist with the following diagnostic issue in file:',
      },
      Commit = {
        prompt = 'Write commit message for the change with commitizen convention.\nMake sure the title has maximum 50 characters and message is wrapped at 72 characters.\nWrap the whole message in code block with language gitcommit.',
      },
      CommitStaged = {
        prompt = 'Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.',
      },
    },
    mappings = {
      close = {
        normal = 'q',
        insert = '<C-c>',
      },
      reset = {
        normal = 'R',
        insert = '<C-R>',
      },
      submit_prompt = {
        normal = '<CR>',
        insert = '<C-m>',
      },
      accept_diff = {
        normal = '<C-y>',
        insert = '<C-y>',
      },
    },
  },
  -- See Commands section for default commands if you want to lazy load on them
}
