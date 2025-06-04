vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true

vim.o.clipboard = ''
vim.o.joinspaces = false
vim.o.number = false
vim.opt.autoindent = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.cmdheight = 0
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.numberwidth = 4
vim.opt.pumheight = 13
vim.opt.relativenumber = false
vim.opt.shiftwidth = 4
vim.opt.shortmess:append 'c'
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.writebackup = false

-- code folding
vim.o.foldenable = false -- turn off by default (turn on by filetype)
vim.o.foldmethod = 'manual'
vim.o.foldcolumn = '0' -- set to 1 to show the foldcolumn

-- netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0

-- default win border (vim 0.11+)
--vim.opt.winborder = 'rounded' -- commenting out for now due to telescope issues

-- this helps to reduce flickering from treesitter syntax redraws while typing
vim.g._ts_force_sync_parsing = true

-- Auto commands by filetype
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'vim' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
    vim.o.foldenable = true
    vim.o.foldmethod = 'marker'
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.volt', '*.phtml', '*.blade.php' },
  callback = function()
    vim.o.filetype = 'html'
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'html', 'coffee' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
    vim.o.foldenable = false
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'php',
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
    vim.opt_local.autoindent = true
    vim.opt_local.smartindent = true
    vim.opt_local.cindent = true
    vim.opt_local.indentexpr = ''
    vim.o.kp = ':help'
    vim.o.foldenable = true
    vim.o.foldmethod = 'expr'
    -- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.bo.commentstring = '// %s'
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'py',
  callback = function()
    vim.o.foldenable = true
    vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.opt.foldmethod = 'expr'
  end,
})
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Auto select virtualenv Nvim open',
  pattern = 'py',
  callback = function()
    local venv = vim.fn.findfile('.venv', vim.fn.getcwd() .. ';')
    if venv ~= '' then
      require('venv-selector').retrieve_from_cache()
    end
  end,
  once = true,
})

-- Show cursor line on active window only
local cursorGrp = vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  pattern = '*',
  command = 'set cursorline',
  group = cursorGrp,
})
vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
  pattern = '*',
  command = 'set nocursorline',
  group = cursorGrp,
})

-- Function to update last modified date
function LastMod()
  local save_cursor = vim.fn.getpos '.'
  local l
  if vim.fn.line '$' > 20 then
    l = 20
  else
    l = vim.fn.line '$'
  end
  vim.fn.cursor(1, 1)
  if vim.fn.search('@modified', 'W', l) > 0 then
    vim.cmd('1,' .. l .. 'g/@modified /s/@modified .*/@modified ' .. os.date '%d-%b-%Y')
  end
  vim.fn.setpos('.', save_cursor)
end
vim.cmd [[
  autocmd BufWrite * :lua LastMod()
]]
vim.api.nvim_set_keymap('n', '<leader>mod', ':lua LastMod()<CR>', { noremap = true, silent = true })
