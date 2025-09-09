-- keymaps.lua
-- ==========================
-- General Neovim settings
-- ==========================
local opt = vim.opt
local g = vim.g

-- Leader key
g.mapleader = " "
g.maplocalleader = " "

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Wrapping
opt.wrap = false

-- Cursor & scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Clipboard
opt.clipboard = "unnamedplus"

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- ==========================
-- Keymaps
-- ==========================
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal mode
keymap("n", "<leader>nh", ":nohlsearch<CR>", opts)       -- clear search highlights
keymap("n", "<leader>w", ":w<CR>", opts)                 -- save
keymap("n", "<leader>q", ":q<CR>", opts)                 -- quit
keymap("n", "<leader>x", ":x<CR>", opts)                 -- save & quit
keymap("n", "<C-s>", ":w<CR>", opts)                     -- Ctrl-s save
keymap("n", "<C-q>", ":q<CR>", opts)                     -- Ctrl-q quit

-- Easy window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bd<CR>", opts)              -- delete buffer

-- Visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Yank to system clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)

-- Paste from system clipboard
keymap("n", "<leader>p", '"+p', opts)
keymap("v", "<leader>p", '"+p', opts)

-- Terminal mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- Quickfix navigation
keymap("n", "<leader>cn", ":cnext<CR>", opts)
keymap("n", "<leader>cp", ":cprev<CR>", opts)
keymap("n", "<leader>co", ":copen<CR>", opts)
keymap("n", "<leader>cc", ":cclose<CR>", opts)

-- Easy indent
keymap("n", "<Tab>", ">>", opts)
keymap("n", "<S-Tab>", "<<", opts)

