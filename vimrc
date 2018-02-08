set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-endwise'
Plugin 'evansalter/vim-checklist'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>
nmap \e :NERDTreeToggle<CR>
nmap \t :Files<CR>
nmap \r :Tags<CR>
nmap \x :ChecklistToggleCheckbox<CR>
nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" trip trailing whitespace EXCEPT for markdown files
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType markdown let b:noStripWhitespace=1

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --follow --color "always"
  \ -g "*.{sql,R,rs,java,jbuilder,js,jsx,json,php,ctp,css,scss,md,styl,jade,html,config,py,cpp,c,go,hs,rb,erb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

let ruby_no_expensive=1

" OPTIONS
set re=1
set ai
set expandtab
set autoread
set autowrite
set backspace=indent,eol,start
set directory-=.
set encoding=utf8
set fileformats=unix,dos,mac
set history=200
set ignorecase
set incsearch
set infercase
set laststatus=2
set linebreak
set number

set shiftwidth=2
set softtabstop=2
set tabstop=2

set timeoutlen=1000
set ttimeoutlen=0

