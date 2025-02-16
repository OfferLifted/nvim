local global = vim.g
local o = vim.opt

global.python3_host_prog = os.getenv("HOME") .. "/dev/nvim_python_env/.venv/bin/python3"
global.mapleader = " "
global.maplocalleader = " "

o.number = true
o.relativenumber = true

o.cursorline = true
o.termguicolors = true

o.clipboard = "unnamedplus"

o.autoindent = true
o.expandtab = true
o.smartindent = true
o.shiftwidth = 2
o.tabstop = 2

o.encoding = "UTF-8"

o.mouse = "a"

o.ttimeoutlen = 300

o.splitright = true
o.splitbelow = true

o.hlsearch = false
o.ignorecase = true
o.smartcase = true

o.undofile = true

o.cmdheight = 0

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
