-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local is_something_shown = function()
  if vim.fn.argc() > 0 then
    return true
  end
  local listed_buffers = vim.tbl_filter(function(buf_id)
    return vim.fn.buflisted(buf_id) == 1
  end, vim.api.nvim_list_bufs())
  if #listed_buffers > 1 then
    return true
  end
  local n_lines = vim.api.nvim_buf_line_count(0)
  if n_lines > 1 then
    return true
  end
  local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]
  if string.len(first_line) > 0 then
    return true
  end

  return false
end

local augroup = vim.api.nvim_create_augroup('StarterPage', {})

local on_vimenter = function()
  if is_something_shown() then
    return
  end
  vim.cmd 'e ~/wiki/main.md'
end

-- vim.api.nvim_create_autocmd( "VimEnter" , { group = augroup, nested = true, once = true, callback = on_vimenter, desc = 'Open on VimEnter' })
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'term://*',
  callback = function()
    vim.cmd 'startinsert'
    vim.opt_local.number = false
  end,
})
vim.api.nvim_create_autocmd('TermEnter', {
  callback = function()
    vim.opt_local.number = false
  end,
})
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt_local.formatoptions = 'jnql'
  end,
})

local NS = { noremap = true, silent = true }
local win_config = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW',
    height = height,
    width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
    border = 'none',
  }
end

-- #############################################################################
-- #############################################################################
-- #############################################################################

vim.keymap.set({ 'n' }, ';', ':', NS)
vim.keymap.set({ 'n' }, '<Return>', 'ciw', NS)
vim.keymap.set({ 't' }, '<M-Esc>', '<C-\\><C-n>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<C-q>', '<cmd>qa!<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-c>', '<cmd>q!<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-h>', '<cmd>TWcmd wcm h<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-j>', '<cmd>TWcmd wcm j<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-k>', '<cmd>TWcmd wcm k<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-l>', '<cmd>TWcmd wcm l<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-C-h>', '<cmd>TWcmd wmv h<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-C-j>', '<cmd>TWcmd wmv j<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-C-k>', '<cmd>TWcmd wmv k<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-C-l>', '<cmd>TWcmd wmv l<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-j>', '<cmd>horizontal resize -1<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-h>', '<cmd>vertical resize -1<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-l>', '<cmd>vertical resize +1<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-k>', '<cmd>horizontal resize +1<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-Left>', '<cmd>TWcmd wcm h<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-Down>', '<cmd>TWcmd wcm j<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-Up>', '<cmd>TWcmd wcm k<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-Right>', '<cmd>TWcmd wcm l<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-C-Left>', '<cmd>TWcmd wmv h<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-C-Down>', '<cmd>TWcmd wmv j<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-C-Up>', '<cmd>TWcmd wmv k<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-C-Right>', '<cmd>TWcmd wmv l<cr>', NS)
vim.keymap.set({ 'n', 'i' }, '<M-Enter>', '<cmd>terminal!<cr>', NS)
vim.keymap.set({ 't' }, '<M-Enter>', '<cmd>enew!<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-f>', '<cmd>lua MiniPick.builtin.files(    )<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-g>', '<cmd>lua MiniPick.builtin.grep_live()<cr>', NS)
vim.keymap.set({ 'n', 't' }, '<M-v>', '<cmd>new<cr><cmd>terminal<cr>', NS)
vim.keymap.set({ 'i' }, '<M-v>', '<Esc><cmd>new<cr><cmd>terminal<cr>', NS)
vim.keymap.set({ 'n' }, '<M-b>', ':vnew<cr>:terminal<cr>', NS)
vim.keymap.set({ 't' }, '<M-b>', '<C-\\><C-n>:vnew<cr>:terminal<cr>', NS)
vim.keymap.set({ 'i' }, '<M-b>', '<Esc><cmd>vnew<cr><cmd>terminal<cr>', NS)
vim.keymap.set({ 'n', 'i' }, '<C-l>', '<cmd>nohl<cr>', NS)
-- vim.keymap.set({"n", "i", "t"}, "<M-Space>"  , "<cmd>e! ~/wiki/main.md<cr>"                , NS)
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>ClangdSwitchSourceHeader<cr>', NS)
vim.keymap.set({ 'n', 'i' }, '<leader>db', '<cmd>DapToggleBreakpoint<cr>', NS)
vim.keymap.set({ 'n', 'i' }, '<leader>dc', '<cmd>DapContinue<cr>', NS)
vim.keymap.set({ 'v' }, 'gt', ":!column -t -s '|' -o '|'<cr>", NS)
vim.keymap.set({ 'n' }, '{', '<cmd>AerialPrev<cr>', NS)
vim.keymap.set({ 'n' }, '}', '<cmd>AerialNext<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<C-f>', '<cmd>Oil<cr>', NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-p>', 'ProjectMgr', NS)
vim.keymap.set({ 'x' }, '<S-Enter>', ':<C-u>MoltenEvaluateVisual<cr>gv', NS)
vim.keymap.set({ 'n' }, '<C-S-h>', '<cmd>MoltenHideOutput<cr>', NS)
vim.keymap.set({ 'n' }, '<C-S-s>', '<cmd>noautocmd MoltenEnterOutput<cr>', NS)
vim.keymap.set({ 'n' }, '<C-S-r>', '<cmd>MoltenReevaluateAll<cr>', NS)
vim.keymap.set({ 'n' }, '<C-S-j>', '<cmd>MoltenNext<cr>', NS)
vim.keymap.set({ 'n' }, '<C-S-k>', '<cmd>MoltenPrev<cr>', NS)
vim.keymap.set({ 'n' }, '<Tab>', '/\\(```.\\|](\\)<cr>:nohl<cr>', NS)
vim.keymap.set({ 'n' }, '<S-Tab>', '?\\(```.\\|](\\)<cr>:nohl<cr>', NS)
vim.keymap.set({ 'n' }, 'K', function()
  require('dapui').eval()
end, NS)
vim.keymap.set({ 'n', 'i' }, '<C-n>', function()
  vim.diagnostic.goto_next()
end, NS)
vim.keymap.set({ 'n', 'i' }, '<C-p>', function()
  vim.diagnostic.goto_prev()
end, NS)
vim.keymap.set({ 'n', 'i' }, '<C-d>', function()
  vim.lsp.buf.declaration()
end, NS)
vim.keymap.set({ 'n', 'i' }, '<C-t>', function()
  vim.lsp.buf.type_definition()
end, NS)

vim.keymap.set({ 'n', 'i', 't' }, '<M-p>', function()
  vim.cmd 'WS 10<cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-q>', function()
  vim.cmd 'WS 1 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-w>', function()
  vim.cmd 'WS 2 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-e>', function()
  vim.cmd 'WS 3 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-r>', function()
  vim.cmd 'WS 4 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-t>', function()
  vim.cmd 'WS 5 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-y>', function()
  vim.cmd 'WS 6 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-u>', function()
  vim.cmd 'WS 7 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-i>', function()
  vim.cmd 'WS 8 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-o>', function()
  vim.cmd 'WS 9 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-p>', function()
  vim.cmd 'WS 10<cr>'
  on_vimenter()
end, NS)

vim.keymap.set({ 'n', 'i', 't' }, '<M-S-q>', function()
  vim.cmd 'WSbmv 1 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-w>', function()
  vim.cmd 'WSbmv 2 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-e>', function()
  vim.cmd 'WSbmv 3 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-r>', function()
  vim.cmd 'WSbmv 4 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-t>', function()
  vim.cmd 'WSbmv 5 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-y>', function()
  vim.cmd 'WSbmv 6 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-u>', function()
  vim.cmd 'WSbmv 7 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-i>', function()
  vim.cmd 'WSbmv 8 <cr>'
  on_vimenter()
end, NS)
vim.keymap.set({ 'n', 'i', 't' }, '<M-S-o>', function()
  vim.cmd 'WSbmv 9 <cr>'
  on_vimenter()
end, NS)

vim.keymap.set({ 'n' }, '<S-Enter>', function()
  require('various-textobjs').mdFencedCodeBlock 'inner'
  vim.cmd 'MoltenEvaluateOperator'
end, NS)
vim.keymap.set({ 'i' }, '<S-Enter>', function()
  vim.cmd 'stopinsert'
  require('various-textobjs').mdFencedCodeBlock 'inner'
  vim.cmd 'MoltenEvaluateOperator'
end, NS)

-- Cosmetic stuff
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'None' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#3b3754' })
vim.api.nvim_set_hl(0, 'MiniStatuslineModeOther', { link = 'IncSearch' })

-- vim: ts=2 sts=2 sw=2 et
--
