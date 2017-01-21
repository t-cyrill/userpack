#!/bin/sh -x

SCRIPT_DIR=$(cd $(dirname $0);pwd)

chsh -s /bin/zsh || exit

if [ -e "${HOME}/.zshenv" ]; then
    mv "${HOME}/.zshenv" "${HOME}/.zshenv.old"
fi

if [ -e "${HOME}/.vimrc" ]; then
    mv "${HOME}/.vimrc" "${HOME}/.vimrc.old"
fi

git clone https://github.com/gmarik/vundle.git ${HOME}/userpack/dotfiles/vim/bundle/vundle

ln -sf ${HOME}/userpack/dotfiles/.shell/zsh/global/zshenv ${HOME}/.zshenv
ln -sf ${HOME}/userpack/dotfiles/vim/vimrc ${HOME}/.vimrc
ln -sf ${HOME}/userpack/dotfiles/.screen/main ${HOME}/.screenrc

vim -c BundleInstall! -c ":q" -c ":q"
php ${HOME}/userpack/dotfiles/vim/dic/builder.php > ${HOME}/userpack/dotfiles/vim/dic/php.dict

cd ${HOME}/userpack/dotfiles/vim/bundle/vimproc
make -f make_unix.mak

mkdir -p ${HOME}/userpack/dotfiles/.shell/zsh/functions/
mkdir -p ${HOME}/userpack/dotfiles/.shell/zsh/history/
mkdir -p ${HOME}/userpack/dotfiles/.shell/zsh/local/
mkdir -p ${HOME}/userpack/dotfiles/vim/syntax/
mkdir -p ${HOME}/userpack/dotfiles/vim/tags/

