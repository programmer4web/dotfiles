scriptencoding utf-8

set number
set mouse=a
set cursorline
set noswapfile
set shortmess+=I
set hidden
set nowrap
set splitbelow
set splitright
set switchbuf=useopen,usetab
set complete=.,w,b,u,t,i,k
set completeopt=menuone
set omnifunc=syntaxcomplete#Complete
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
set hlsearch|nohlsearch
set sidescrolloff=5
set sidescroll=1
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set inccommand=nosplit
set updatetime=750
set clipboard^=unnamedplus,unnamed
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:>,precedes:<,nbsp:•
set statusline=%<\ %n:%f\ %r%h%w%y%m%=%4v\ %l/%L
