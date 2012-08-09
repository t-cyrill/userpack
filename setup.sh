chsh -s /bin/zsh
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp -R config/.bash_user config/.bashrc config/.screen config/.screenrc config/.vimrc config/.zsh_user config/.zshrc config/.aliases ~/
sed -i -e "s|{HOME}|${HOME}|g" config/.screen/log
vim -c BundleInstall! -c ":q" -c ":q"

