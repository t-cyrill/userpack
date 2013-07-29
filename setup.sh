#!/bin/sh -x

SCRIPT_DIR=$(cd $(dirname $0);pwd)

chsh -s /bin/zsh || exit

if [ -e "${HOME}/dotfiles" ]; then
    mv "${HOME}/dotfiles" "${HOME}/dotfiles.old"
fi

if [ -e "${HOME}/.zshenv" ]; then
    mv "${HOME}/.zshenv" "${HOME}/.zshenv.old"
fi

if [ -e "${HOME}/.vimrc" ]; then
    mv "${HOME}/.vimrc" "${HOME}/.vimrc.old"
fi

ln -s ${SCRIPT_DIR}/dotfiles ${HOME}
# sed -i -e "s|{HOME}|${HOME}|g" ~/dotfiles/.screen/log
git clone https://github.com/gmarik/vundle.git ${HOME}/dotfiles/.vim/bundle/vundle

ln -s ${HOME}/dotfiles/.shell/zsh/global/zshenv ${HOME}/.zshenv
ln -s ${HOME}/dotfiles/.vim/vimrc ${HOME}/.vimrc
ln -s ${HOME}/dotfiles/.screen/main ${HOME}/.screenrc

vim -c BundleInstall! -c ":q" -c ":q"
php ${HOME}/dotfiles/.vim/dic/builder.php > ${HOME}/dotfiles/.vim/dic/php.dict

cd ${HOME}/userpack/dotfiles/.vim/bundle/vimproc
make -f make_unix.mak

mkdir -p ${HOME}/dotfiles/.shell/zsh/functions/
mkdir -p ${HOME}/dotfiles/.shell/zsh/history/
mkdir -p ${HOME}/dotfiles/.shell/zsh/local/
mkdir -p ${HOME}/dotfiles/.vim/syntax/
mkdir -p ${HOME}/dotfiles/.vim/tags/

