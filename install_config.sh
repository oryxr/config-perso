#! /bin/sh

ln -s vim/vimrc ~/.vimrc
mkdir ~/.vim/
ln -s vim/config/ ~/.vim/
mkdir ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://www.languagetool.org/download/LanguageTool-2.5.zip
mkdir ~/.vim/progExt
unzip LanguageTool-2.5.zip
mv LanguageTool-2.5/ ~/.vim/progExt/
rm -rf LanguageTool-2.5.zip
vim +PluginInstall +qall

ln -s zsh/zshrc ~/.zshrc
