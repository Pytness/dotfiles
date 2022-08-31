set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search

set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed

set nofoldenable            " don't fold automatically
set foldlevel=99            " fix wierd folding behavior

" Use nvim_treesitter method to fold
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set number                  " add line numbers

set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style

filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard

filetype plugin on

set signcolumn=yes
" set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

" set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" Mappings
"
" Use , as a leader
let mapleader = ","
let g:mapleader = ","


" * delete not cut
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d
nnoremap <leader>dd "+dd

" * Use omnidirectional search
nmap s <Plug>Lightspeed_omni_s

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter',{'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'airblade/vim-gitgutter'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'github/copilot.vim'
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

" Theme

set background=dark
colorscheme palenight

if (has("termguicolors"))
  set termguicolors
endif 

" vim-gitgutter config
set updatetime=100
let g:gitgutter_diff_args = '--histogram'

" lightspeed config
let g:lightspeed_no_default_keymaps = 1

" Lua scripts
lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true }
}

require'lightspeed'.setup {
    ignore_case = true
}

require('lualine').setup {
    options = {
        theme = 'papercolor_light',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

require("nvim-tree").setup()

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
EOF
