#!/bin/sh

chsh -s /bin/zsh || exit
ln -s dotfiles {$HOME}
sed -i -e "s|{HOME}|${HOME}|g" ~/dotfiles/.screen/log
git clone https://github.com/gmarik/vundle.git ~/dotfiles/.vim/bundle/vundle

pushd ~
ln -s dotfiles/.shell/zsh/global/zshenv $HOME/.zshenv
ln -s dotfiles/.vim/vimrc $HOME/.vimrc
ln -s dotfiles/.screen/main $HOME/.screenrc
popd

vim -c BundleInstall! -c ":q" -c ":q"
php ~/dotfiles/.vim/dic/builder.php > ~/dotfiles/.vim/dic/php.dict

mkdir -p ~/dotfiles/.shell/zsh/functions/
mkdir -p ~/dotfiles/.shell/zsh/history/
mkdir -p ~/dotfiles/.shell/zsh/local/
mkdir -p ~/dotfiles/.vim/syntax/
mkdir -p ~/dotfiles/.vim/tags/

