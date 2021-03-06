" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


"以下我的配置
set nocompatible
filetype off

"python设置，vim version中python/dyn的dyn代表可以动态加载python.dll
set pythonthreedll=python38.dll

"设置错误不响铃
set noerrorbells
"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"设置tab长度为4空格
set tabstop=4
"设置自动缩进长度为4空格
set shiftwidth=4
"设置行间距
set linespace=11

"插件管理
set rtp+=$VIM\vimfiles\bundle\Vundle.vim\
call vundle#begin('$VIM\vimfiles\bundle\')
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'jceb/vim-orgmode'
Plugin 'vim-scripts/utl.vim'
Plugin 'tpope/vim-repeat'
Plugin 'yegappan/taglist'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-speeddating'
Plugin 'chrisbra/NrrwRgn'
Plugin 'mattn/calendar-vim'
Plugin 'inkarkat/vim-SyntaxRange'
"my bundle plugin
 
call vundle#end()
filetype plugin indent on

let g:XkbSwitchEnabled = 1
iab xtime <c-r>=strftime("%Y-%m-%d  %H:%M:%S")
iab xdate <c-r>=strftime("%Y-%m-%d")

"按键映射
nnoremap ; :

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>



