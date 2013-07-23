" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    filetype plugin indent on
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    "Add your bundles here
    Bundle 'vim-scripts/L9'
    Bundle 'mileszs/ack.vim'
    Bundle 'tomtom/tlib_vim'
    Bundle 'garbas/vim-snipmate'
    Bundle 'honza/vim-snippets'
    Bundle 'tpope/vim-surround'
    Bundle 'MarcWeber/vim-addon-mw-utils.git'
    Bundle 'scrooloose/syntastic'
    Bundle 'tpope/vim-repeat'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'kien/ctrlp.vim'
    Bundle 'Raimondi/delimitMate'
    Bundle 'tpope/vim-markdown'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'kchmck/vim-coffee-script.git'
    Bundle 'tpope/vim-commentary.git'
    Bundle 'tpope/vim-fugitive.git'
    Bundle 'shvechikov/vim-keymap-russian-jcukenmac'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end
