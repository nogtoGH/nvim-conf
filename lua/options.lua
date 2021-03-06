local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local o = vim.o 
vim.cmd [[colorscheme moonfly]]
opt.autowriteall = true
opt.backup = false
opt.cindent = true
opt.colorcolumn = { 80, 100, 120 }
opt.complete:remove('t')
opt.completeopt = { 'menuone' }
opt.confirm = true
opt.copyindent = true
opt.dictionary = '/usr/share/dict/words'
opt.diffopt = { 'internal', 'filler', 'closeoff', 'vertical' }
opt.expandtab = true
opt.fileencodings = { 'utf8', 'nobomb' }
opt.fileformats = { 'unix', 'mac' }
opt.foldenable = false
opt.foldmethod = 'manual'
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.infercase = true
opt.list = true
opt.listchars:append({ precedes = '<', extends = '>' })
opt.mouse = 'a'
opt.number = true
opt.numberwidth = 5
opt.relativenumber = true
opt.secure = true
opt.sessionoptions = { 'winpos', 'tabpages', 'help' }
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess = 'actToOFI'
opt.showmatch = true
opt.showmode = false
opt.showtabline = 2
opt.signcolumn = 'no'
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.spell = false
opt.spelllang = 'en'
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.swapfile = false
opt.switchbuf = { 'useopen', 'usetab', 'split' }
opt.tabstop = 2
opt.tags = ''
opt.textwidth = 100
opt.title = true
opt.titlestring = "%{substitute(expand('%:p'), $HOME, '$HOME', '')}"
opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 10000
opt.virtualedit = 'block'
opt.wildignorecase = true
opt.wrap = false
opt.writebackup = false

if vim.env.ITERM_PROFILE == 'light' then
  opt.background = 'light'
else
  opt.background =  'dark'
end

-- Space as map leader
g.mapleader = ' '

-- Disable standard plugins
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1

g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1

--   A list of file patterns to ignore when performing expansion and completion.
o.wildignore       = o.wildignore .. '*.so,/min/*'
o.wildignore       = o.wildignore .. '.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*'
o.wildignore       = o.wildignore .. '*.jpg,*.jpeg,*.png,*.gif,*.log,**/tmp/**'
o.wildignore       = o.wildignore .. '**/node_modules/**,**/bower_modules/**,*/.sass-cache/*'
o.wildignore       = o.wildignore .. '__pycache__,*.egg-info'
o.wildignore       = o.wildignore .. '*.out,*.obj,*.gem,*.pyc,*DS_Store*'
o.wildignore       = o.wildignore .. '*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz'
o.wildignore       = o.wildignore .. '*.swp,*~,._*,*/vendor/cache/*'  

