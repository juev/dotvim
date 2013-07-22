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
    Bundle 'https://github.com/vim-scripts/L9'
    Bundle 'https://github.com/mileszs/ack.vim'
    Bundle 'https://github.com/tomtom/tlib_vim'
    Bundle 'https://github.com/garbas/vim-snipmate'
    Bundle 'https://github.com/honza/vim-snippets'
    Bundle 'https://github.com/tpope/vim-surround'
    Bundle 'https://github.com/MarcWeber/vim-addon-mw-utils.git'
    Bundle 'https://github.com/scrooloose/syntastic'
    Bundle 'https://github.com/tpope/vim-repeat'
    Bundle 'https://github.com/Lokaltog/vim-easymotion'
    Bundle 'https://github.com/kien/ctrlp.vim'
    Bundle 'https://github.com/Raimondi/delimitMate'
    Bundle 'https://github.com/tpope/vim-markdown'
    Bundle 'https://github.com/altercation/vim-colors-solarized'
    Bundle 'https://github.com/kchmck/vim-coffee-script.git'
    Bundle 'https://github.com/tpope/vim-commentary.git'
    Bundle 'https://github.com/tpope/vim-fugitive.git'
    Bundle 'https://github.com/shvechikov/vim-keymap-russian-jcukenmac'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end
