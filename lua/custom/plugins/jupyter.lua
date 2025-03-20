return {
  {
    'godlygeek/tabular', -- align stuff (:Tabularize \|)
  },
  { 'yssl/TWcmd.vim' },
  {
    'Vonr/align.nvim',
    branch = 'v2',
    lazy = true,
    init = function()
      -- vim.keymap.set( 'x', 'aa', function() require'align'.align_to_char({ length = 1, }) end, NS)
      vim.keymap.set('x', 'aa', function()
        require('align').align_to_string { preview = true, regex = false }
      end, NS)
    end,
  },

  -- ###########################################################################

  {
    'MunifTanjim/nui.nvim',
  },

  -- ###########################################################################

  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        timeout = 2000,
      }
    end,
  },

  -- ###########################################################################

  {
    'stevearc/aerial.nvim',
    opts = {},
  },

  -- ###########################################################################

  {
    'yssl/TWcmd.vim',
    version = false,
  },

  -- ###########################################################################

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup()
    end,
  },

  -- ###########################################################################

  {
    'samjwill/nvim-unception',
  },

  -- ###########################################################################

  {
    'williamboman/mason.nvim',
    init = function()
      require('mason').setup()
    end,
  },

  -- ###########################################################################

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    init = function()
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = { 'clangd', 'lua_ls', 'pylsp', 'fortls' },
        automatic_installation = true,
      }
    end,
  },

  -- ###########################################################################

  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = { 'williamboman/mason.nvim', 'nvim-neotest/nvim-nio' },
    init = function()
      require('mason-nvim-dap').setup {
        ensure_installed = { 'cppdbg' },
        automatic_installation = true,
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
          cppdbg = function(config)
            config.configurations = {
              {
                name = 'launch with CLI args',
                type = 'cppdbg',
                request = 'launch',
                program = function() -- Ask the user which executable to debug
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/bin/', 'file')
                end,
                args = function() -- Ask the user for CLI arguments
                  return { vim.fn.input('CLI arguments (optional): ', '', 'file') }
                end,
                cwd = '${workspaceFolder}',
                runInTerminal = false,
                stopOnEntry = true,
              },
            }

            require('mason-nvim-dap').default_setup(config)
          end,
        },
      }
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
  },

  -- ###########################################################################

  {
    'stevearc/dressing.nvim',
  },
  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'Nerdy',
  },
  {
    'mfussenegger/nvim-dap',
    enabled = vim.fn.has 'win32' == 0,
    event = 'User BaseFile',
    dependencies = {
      'jay-babu/mason-nvim-dap.nvim',
      'hrsh7th/nvim-cmp',
      'rcarriga/cmp-dap',
    },
  },

  -- ###########################################################################

  { 'hrsh7th/cmp-nvim-lsp' },

  {
    'rcarriga/nvim-dap-ui', -- debug UI
    opts = {
      floating = { border = 'rounded' },
      mappings = {
        open = '<CR>',
        expand = ' ',
      },
    },
    config = function(_, opts)
      local dap, dapui = require 'dap', require 'dapui'

      local sign = vim.fn.sign_define

      sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
      sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })
      sign('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        -- dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        -- dapui.close()
      end
      dapui.setup(opts)
    end,
  },

  {
    'preservim/vim-markdown', -- conceal markdown links
  },

  -- ###########################################################################

  {
    'tadmccorkle/markdown.nvim', -- follow links (C-Enter)
    ft = 'markdown',
    opts = {
      mappings = { link_follow = '<C-Enter>' },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    dependencies = { '3rd/image.nvim' },
    build = ':UpdateRemotePlugins',
    init = function()
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_auto_init_behavior = 'init'
      vim.g.molten_enter_output_behavior = 'open_and_enter'
      vim.g.molten_auto_image_popup = false
      vim.g.molten_auto_open_output = false
      vim.g.molten_output_crop_border = false
      vim.g.molten_output_virt_lines = true
      vim.g.molten_output_win_max_height = 50
      vim.g.molten_output_win_style = 'minimal'
      vim.g.molten_output_win_hide_on_leave = false
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_virt_text_max_lines = 10000
      vim.g.molten_cover_empty_lines = false
      vim.g.molten_copy_output = true
      vim.g.molten_output_show_exec_time = false
    end,
  },
  {
    '3rd/image.nvim',
    opts = {
      -- image nvim options table. Pass to `require('image').setup`
      {
        backend = 'kitty',
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
          },
        },
        max_width = 500,
        max_height = 500,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'noice', '' },
      },
    },
  },
  --[[
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'quarto', 'markdown' },
    lspFeatures = {
      -- NOTE: put whatever languages you want here:
      languages = { 'r', 'python', 'rust' },
      chunks = 'all',
      diagnostics = {
        enabled = true,
        triggers = { 'BufWritePost' },
      },
      completion = {
        enabled = true,
      },
    },
    keymap = {
      -- NOTE: setup your own keymaps:
      hover = 'H',
      definition = 'gd',
      rename = '<leader>rn',
      references = 'gr',
      format = '<leader>gf',
    },
    codeRunner = {
      enabled = true,
      default_method = 'molten',
    },
    init = function()
      local runner = require 'quarto.runner'
      vim.keymap.set('n', '<localleader>rc', runner.run_cell, { desc = 'run cell', silent = true })
      vim.keymap.set('n', '<localleader>ra', runner.run_above, { desc = 'run cell and above', silent = true })
      vim.keymap.set('n', '<localleader>rA', runner.run_all, { desc = 'run all cells', silent = true })
      vim.keymap.set('n', '<localleader>rl', runner.run_line, { desc = 'run line', silent = true })
      vim.keymap.set('v', '<localleader>r', runner.run_range, { desc = 'run visual range', silent = true })
      vim.keymap.set('n', '<localleader>RA', function()
        runner.run_all(true)
      end, { desc = 'run all cells of all languages', silent = true })
    end,
  },
  ]]
  --
  {
    'chrisgrieser/nvim-various-textobjs', -- additional text objects
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
  {
    'GCBallesteros/jupytext.nvim',
    opts = {
      style = 'markdown',
      output_extension = 'md',
      force_ft = 'markdown',
    },
  },
  {
    'NStefan002/screenkey.nvim', -- show keys pressed (:Screenkey)
    cmd = 'Screenkey',
    config = true,
  },

  -- ###########################################################################

  {
    'airblade/vim-rooter', -- autochdir to git project
    init = function()
      vim.g.rooter_patterns = { '.git', '.stfolder' }
      -- vim.g.rooter_patterns = {'.git'}
      vim.g.rooter_change_directory_for_non_project_files = 'current'
      vim.g.rooter_silent_chdir = 1
    end,
  },

  -- ###########################################################################

  {
    'azabiong/vim-highlighter', -- highlight selections
    init = function() end,
  },

  -- ###########################################################################

  {
    'stevearc/oil.nvim', -- file manager (C-f)
    opts = {},
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  },

  -- ###########################################################################

  {
    'uga-rosa/ccc.nvim', -- color picker (:CccPick)
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },

  -- ###########################################################################

  {
    'dosimple/workspace.vim', -- treat tabs as virtual workspaces
    init = function() end,
  },
  {
    'catppuccin/nvim', -- color theme
    name = 'catppuccin',
    priority = 1000,
    init = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = {
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 1.80,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
      }
    end,
  },
}
