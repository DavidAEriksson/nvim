return {
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    opts = {
      terminal_cmd = '~/.claude/local/claude',
    },
    keys = {
      { '<leader>ai', nil, desc = 'AI/Claude Code' },
      { '<leader>aic', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
      { '<leader>aii', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
      { '<leader>air', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
      { '<leader>aiC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
      { '<leader>aim', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
      { '<leader>aib', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
      { '<leader>ais', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
      {
        '<leader>ais',
        '<cmd>ClaudeCodeTreeAdd<cr>',
        desc = 'Add file',
        ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
      },
      -- Diff management
      { '<leader>aia', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
      { '<leader>aid', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    },
  },
}
