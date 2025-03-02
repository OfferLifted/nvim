local global = vim.g

global.mapleader = " "
global.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }

-- Toggle insert/normal mode
-- vim.keymap.set("i", "jj", "<Esc>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))

-- Save file
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", vim.tbl_extend("force", opts, { desc = "Save file" }))

-- Quit file
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", vim.tbl_extend("force", opts, { desc = "Quit file" }))

-- Save file without auto-formatting
vim.keymap.set(
  "n",
  "<leader>sn",
  "<cmd>noautocmd w<CR>",
  vim.tbl_extend("force", opts, { desc = "Save (no autocommand)" })
)

-- Move line with 'J' and 'K' in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move line down" }))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move line up" }))

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', vim.tbl_extend("force", opts, { desc = "Delete char (no yank)" }))

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Page down & center" }))
vim.keymap.set("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Page up & center" }))

-- Find and center search results
vim.keymap.set("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Next search result" }))
vim.keymap.set("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Previous search result" }))

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -1<CR>", vim.tbl_extend("force", opts, { desc = "Decrease height" }))
vim.keymap.set("n", "<C-Down>", ":resize +1<CR>", vim.tbl_extend("force", opts, { desc = "Increase height" }))
vim.keymap.set("n", "<C-Left>", ":vertical resize +1<CR>", vim.tbl_extend("force", opts, { desc = "Increase width" }))
vim.keymap.set("n", "<C-Right>", ":vertical resize -1<CR>", vim.tbl_extend("force", opts, { desc = "Decrease width" }))

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Next buffer" }))
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous buffer" }))
vim.keymap.set("n", "<leader>x", ":bd!<CR>", vim.tbl_extend("force", opts, { desc = "Close buffer" }))
vim.keymap.set("n", "<leader>b", "<cmd>enew<CR>", vim.tbl_extend("force", opts, { desc = "New buffer" }))

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", vim.tbl_extend("force", opts, { desc = "Vertical split" }))
vim.keymap.set("n", "<leader>h", "<C-w>s", vim.tbl_extend("force", opts, { desc = "Horizontal split" }))
vim.keymap.set("n", "<leader>se", "<C-w>=", vim.tbl_extend("force", opts, { desc = "Equalize splits" }))
vim.keymap.set("n", "<leader>sx", ":close<CR>", vim.tbl_extend("force", opts, { desc = "Close split" }))

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", vim.tbl_extend("force", opts, { desc = "Move to top split" }))
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", vim.tbl_extend("force", opts, { desc = "Move to bottom split" }))
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", vim.tbl_extend("force", opts, { desc = "Move to left split" }))
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", vim.tbl_extend("force", opts, { desc = "Move to right split" }))

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", vim.tbl_extend("force", opts, { desc = "New tab" }))
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Close tab" }))
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", vim.tbl_extend("force", opts, { desc = "Next tab" }))
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", vim.tbl_extend("force", opts, { desc = "Previous tab" }))

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", vim.tbl_extend("force", opts, { desc = "Toggle wrap" }))

-- Stay in indent mode in visual mode
vim.keymap.set("v", "<", "<gv", vim.tbl_extend("force", opts, { desc = "Indent left" }))
vim.keymap.set("v", ">", ">gv", vim.tbl_extend("force", opts, { desc = "Indent right" }))

-- Keep last yanked when pasting in visual mode
vim.keymap.set("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste (no yank)" }))

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diag float" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diag list" })
