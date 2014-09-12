#! /bin/sh

startingDir=${PWD}

## Config vim
#delete old configuration files
rm ${HOME}/.vimrc
rm -rf ${HOME}/.vim

#create symlinks to the configuration files
ln -s ${PWD}/vim/.vimrc ${HOME}/.vimrc
ln -s ${PWD}/vim/.vim ${HOME}/.vim

#install the software that manages the plugins for vim
mkdir ${HOME}/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

#install language spelling
mkdir ${HOME}/spell
for lang in fr en
do
  for ext in spl sug
  do
    wget -P ${HOME}/.vim/spell  http://ftp.vim.org/vim/runtime/spell/${lang}.utf-8.${ext}
    wget -P ${HOME}/.vim/spell  http://ftp.vim.org/vim/runtime/spell/${lang}.latin1.${ext}
  done
done

#install language assistance
mkdir ${HOME}/.vim/progExt
wget https://www.languagetool.org/download/LanguageTool-2.6.zip

# unzip -o : overwrites the unzipped files if it already exists
unzip -o LanguageTool-2.6.zip
mv LanguageTool-2.6 ${HOME}/.vim/progExt/
rm -rf LanguageTool-2.6*
vim +PluginInstall +qall

cd ${startingDir}

## Config zsh
#delete old configuration files
rm ${HOME}/.zshrc

#create symlinks to the configuration files
ln -s ${PWD}/zsh/.zshrc ${HOME}/.vimrc
sudo apt-get install zsh
sudo cp ${PWD}/zsh/config_admin/zshrc /etc/zsh/
sudo cp ${PWD}/zsh/config_admin/zshenv /etc/zsh/
sudo cp ${PWD}/zsh/config_admin/zlogin /etc/zsh/
sudo cp ${PWD}/zsh/config_admin/zlogout /etc/zsh/
sudo cp ${PWD}/zsh/config_admin/dir_colors /etc/

cd ${startingDir}
