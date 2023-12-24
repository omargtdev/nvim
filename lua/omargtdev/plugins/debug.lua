return {

  'mfussenegger/nvim-dap',

  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'netcoredbg'
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end

}


  -- config = function()
  --   local dap = require('dap')
  --
  --   local csAdapter = 'coreclr'
  --   dap.adapters[csAdapter] = {
  --     type = 'executable',
  --     command = '/usr/local/bin/netcoredbg/netcoredbg',
  --     args = { '--interpreter=vscode' }
  --   }
  --   dap.configurations.cs = {
  --     {
  --       type = csAdapter,
  --       name = 'Launch - netcoredbg',
  --       request = 'launch',
  --       program = function()
  --         return vim.fn.input('Path to dll -> ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
  --       end
  --     }
  --   }
  --
  --   local map = vim.keymap.set
  --   map("n", "<F5>", dap.continue, { silent = true })
  --   map("n", "<F10>", dap.step_over, { silent = true })
  --   map("n", "<F12>", dap.step_into, { silent = true })
  --   map("n", "<F12>", dap.step_out, { silent = true })
  --   map("n", "<leader>b", dap.toggle_breakpoint, { silent = true })
  --   -- map("n", "<leader>B", vim.cmd[[lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))]], { silent = true })
  --   -- map("n", "<leader>lp", vim.cmd[[lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))]], { silent = true })
  --   map("n", "<leader>dr", dap.repl.open, { silent = true })
  --   map("n", "<leader>dl", dap.run_last, { silent = true })
  -- end
