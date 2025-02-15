local global = vim.g
local o = vim.opt

o.number = true
o.relativenumber = true

o.cursorline = true
o.termguicolors = true

o.clipboard = "unnamedplus"

o.autoindent = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2

o.encoding = "UTF-8"

o.mouse = "a"

o.ttimeoutlen = 300

o.splitright = true
o.splitbelow = true

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
