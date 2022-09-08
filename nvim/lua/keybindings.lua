-- leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- local vars
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- neovim

-- fast saving
map("n", "<leader>w", ":w!<cr>", opt)
map("n", "<leader>q", ":q<cr>", opt)

-- fast editing of the .vimrc
map("n", "<leader>ee", ":e! ~/.vimrc<cr>", opt)
-- fast editing of the init.vim
map("n", "<leader>nn", ":e! ~/.config/nvim<cr>", opt)

-- clean search highlight
map("n", "<leader><cr>", ":noh<cr>", opt)


-- bufferline
map("n", "<C-[>", ":BufferLineCyclePrev<cr>", opt)
map("n", "<C-]>", ":BufferLineCycleNext<cr>", opt)
-- delete tab
map("n", "<leader>x", ":bdelete<cr>", opt)

-- telescope
map("n", "<C-p>", ":Telescope find_files<cr>", opt)
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", opt)
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", opt)
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", opt)
map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>", opt)

-- nvim-tree
map('n', '<leader>f', ':NvimTreeToggle<cr>', opt)
