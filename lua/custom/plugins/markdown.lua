return {
  'echasnovski/mini.nvim',
  version = '*',
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  -- Install markdown preview, use npx if available.
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function(plugin)
    if vim.fn.executable 'npx' then
      vim.cmd('!cd ' .. plugin.dir .. ' && cd app && npx --yes yarn install')
    else
      vim.cmd [[Lazy load markdown-preview.nvim]]
      vim.fn['mkdp#util#install']()
    end
  end,
  init = function()
    if vim.fn.executable 'npx' then
      vim.g.mkdp_filetypes = { 'markdown' }
    end
  end,
}

-- SOLUTION - From https://github.com/iamcco/markdown-preview.nvim/issues/148#issuecomment-1587879262
--[[
return {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    init = function()
        local g = vim.g
        g.mkdp_auto_start = 0
        g.mkdp_auto_close = 1
        g.mkdp_refresh_slow = 0
        g.mkdp_command_for_global = 0
        g.mkdp_open_to_the_world = 0
        g.mkdp_open_ip = ''
        g.mkdp_browser = 'chrome'
        g.mkdp_echo_preview_url = 0
        g.mkdp_browserfunc = ''
        g.mkdp_theme = 'dark'
        g.mkdp_filetypes = { "markdown" }
        g.mkdp_page_title = "${name}.md"
        g.mkdp_preview_options = {
            disable_sync_scroll = 0,
            disable_filename = 1
        }
    end,
}
]]
--
