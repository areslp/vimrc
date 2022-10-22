-- leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- local vars
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }
local keyset = vim.keymap.set

-- neovim
map("n", "<leader>s", ":tabnew|0r!rg -n  #<Left><Left>", opt)
-- nnoremap <key> :tabnew\|0r!grep -n  #<Left><Left>

-- fast saving
map("n", "<leader>w", ":w!<cr>", opt)
map("n", "<leader>q", ":q!<cr>", opt)

-- fast editing of the .vimrc
map("n", "<leader>ee", ":e! ~/.vimrc<cr>", opt)
-- fast editing of the init.vim
map("n", "<leader>nn", ":e! ~/.config/nvim<cr>", opt)

-- clean search highlight
map("n", "<leader><cr>", ":noh<cr>", opt)

-- window moving
map("n", "<C-left>", "<C-w><left>", opt)
map("n", "<C-right>", "<C-w><right>", opt)
map("n", "<C-up>", "<C-w><up>", opt)
map("n", "<C-down>", "<C-w><down>", opt)


-- bufferline
map("n", "<C-[>", ":BufferLineCyclePrev<cr>", opt)
map("n", "<C-]>", ":BufferLineCycleNext<cr>", opt)
-- delete tab
map("n", "<leader>x", ":bdelete!<cr>", opt)

-- telescope
map("n", "<C-p>", ":Telescope find_files<cr>", opt)
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", opt)
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", opt)
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", opt)
map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>", opt)

-- nvim-tree
map('n', '<leader>f', ':NvimTreeToggle<cr>', opt)

-- symbols-outline
map('n', '<leader>t', '::SymbolsOutline<cr>', opt)

-- coc
-- ref: https://github.com/neoclide/coc.nvim, Example lua configuration
-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
