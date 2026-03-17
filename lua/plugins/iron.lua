return {
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require 'iron.core'
      local view = require 'iron.view'
      iron.setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            R = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { 'R' },
            },
            r = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { 'R' },
            },
            quarto = {
              command = { 'R' },
            },
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = {
            view.split '35%',
          },
        },
        -- iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          toggle_repl = '<space>rr', -- toggles the repl open and closed.
          -- If repl_open_command is a table as above, then the following keymaps are
          -- available
          -- toggle_repl_with_cmd_1 = "<space>rv",
          -- toggle_repl_with_cmd_2 = "<space>rh",
          restart_repl = '<space>rR', -- calls `IronRestart` to restart the repl
          visual_send = '<space>rl',
          send_file = '<space>rf',
          send_line = '<space>rl',
          cr = '<space>r<cr>',
          interrupt = '<space>r<space>',
          exit = '<space>rQ',
          clear = '<space>rC',
        }, -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = false,
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }

      -- iron also has a list of commands, see :h iron-commands for all available commands
      vim.keymap.set('n', '<space>rS', '<cmd>IronRepl<cr>', { desc = '[R]EPL [S]tart' })
      vim.keymap.set('n', '<space>rR', '<cmd>IronRestart<cr>', { desc = '[R]EPL [R]estart' })
      vim.keymap.set('n', '<space>rF', '<cmd>IronFocus<cr>', { desc = '[R]EPL [F]ocus' })
      vim.keymap.set('n', '<space>rH', '<cmd>IronHide<cr>', { desc = '[R]EPL [H]ide' })
    end,
  },
}
