#! /bin/sh

startingDir=${PWD}

sudo apt update
## Config vim
sudo apt install -y vim
#delete old configuration files
rm ${HOME}/.vimrc
rm -rf ${HOME}/.vim

#create symlinks to the configuration files
cp ${PWD}/vim/.vimrc ${HOME}/.vimrc
cp -r ${PWD}/vim/.vim ${HOME}/.vim

#install the software that manages the plugins for vim
mkdir ${HOME}/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

#install language spelling
# mkdir ${HOME}/spell
# for lang in fr en
# do
#   for ext in spl sug
#   do
#     wget -P ${HOME}/.vim/spell  http://ftp.vim.org/vim/runtime/spell/${lang}.utf-8.${ext}
#     wget -P ${HOME}/.vim/spell  http://ftp.vim.org/vim/runtime/spell/${lang}.latin1.${ext}
#   done
# done

#install language assistance
# mkdir ${HOME}/.vim/progExt
# wget https://www.languagetool.org/download/LanguageTool-2.6.zip

# unzip -o : overwrites the unzipped files if it already exists
# unzip -o LanguageTool-2.6.zip
# mv LanguageTool-2.6 ${HOME}/.vim/progExt/
# rm -rf LanguageTool-2.6*
vim +PluginInstall +qall

sudo cp -r ${HOME}/.vim /root/.vim
sudo cp ${HOME}/.vimrc /root/.vimrc

cd ${startingDir}

## Config zsh
#delete old configuration files
rm ${HOME}/.zshrc

#create symlinks to the configuration files
ln -s ${PWD}/zsh/.zshrc ${HOME}/.zshrc
sudo git clone https://github.com/olivierverdier/zsh-git-prompt.git /opt/zsh-git-prompt
sudo apt install -y zsh
sudo cp ${PWD}/zsh/config_admin/zshrc /etc/zsh/
sudo cp ${PWD}/zsh/config_admin/zshenv /etc/zsh/
sudo cp ${PWD}/zsh/config_admin/zlogin /etc/zsh/
sudo cp ${PWD}/zsh/config_admin/zlogout /etc/zsh/
sudo cp ${PWD}/zsh/config_admin/dir_colors /etc/

sudo cp ${HOME}/.zshrc /root/.zshrc

chsh -s /bin/zsh ${USER}
chsh -s /bin/zsh root

cd ${startingDir}

## Config screen
sudo apt install -y screen
rm ${HOME}/.screenrc
cp ${PWD}/screen/.screenrc ${HOME}/.screenrc
sudo cp ${HOME}/.screenrc /root/.screenrc

cd ${startingDir}

#sudo cp script/rmate.sh /usr/local/bin/rsub
#sudo chmod +x /usr/local/bin/rsub

## Install fail2ban
cd ${startingDir}
sudo apt install fail2ban
sudo cp ${PWD}/fail2ban/jail.local /etc/fail2ban/jail.local
sudo service fail2ban restart

#cd ${startingDir}
