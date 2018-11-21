git clone https://github.com/VundleVim/Vundle.vim.git $ENV:HOME/_vimfiles/bundle/Vundle.vim

Copy-Item .\configs\_vimrc $ENV:HOME\_vimrc

vim +PluginInstall +qall