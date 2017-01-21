#!/bin/sh -x

# requires: curl vim zsh make gcc php screen ...

SCRIPT_DIR=$(cd $(dirname $0);pwd)

chsh -s /bin/zsh || exit

if [ -e "${HOME}/.zshenv" ]; then
    mv "${HOME}/.zshenv" "${HOME}/.zshenv.old"
fi

if [ -e "${HOME}/.vimrc" ]; then
    mv "${HOME}/.vimrc" "${HOME}/.vimrc.old"
fi

# install vim-plug
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -sf ${HOME}/userpack/dotfiles/shell/zsh/global/zshenv ${HOME}/.zshenv
ln -sf ${HOME}/userpack/dotfiles/vim/vimrc ${HOME}/.vimrc
ln -sf ${HOME}/userpack/dotfiles/.screen/main ${HOME}/.screenrc

vim -c ":PlugInstall" -c ":q" -c ":q"
#php ${HOME}/userpack/dotfiles/vim/dic/builder.php > ${HOME}/userpack/dotfiles/vim/dic/php.dict

# FIXME:
#cd ${HOME}/userpack/dotfiles/vim/bundle/vimproc
#make -f make_unix.mak

mkdir -p ${HOME}/userpack/dotfiles/shell/zsh/functions/
mkdir -p ${HOME}/userpack/dotfiles/shell/zsh/history/
mkdir -p ${HOME}/userpack/dotfiles/shell/zsh/local/
mkdir -p ${HOME}/userpack/dotfiles/vim/syntax/
mkdir -p ${HOME}/userpack/dotfiles/vim/tags/

