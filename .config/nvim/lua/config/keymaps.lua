local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<A-l>", ":bnext<CR>", opts)
keymap("n", "<A-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Buffer mappings
-- Goto buffer in position...
keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opts)
keymap("n", "<A-0>", ":BufferLast<CR>", opts)

--Close Buffer
keymap("n", "<A-c>", ":bdelete<CR>", opts)
