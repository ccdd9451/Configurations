shpos="$( cd "$( dirname "$0" )" && pwd )"
mkdir -p ~/.config
ln -s $shpos ~/.config/myconfig
export CONFIGPATH=$HOME/.config/myconfig
ln -s $CONFIGPATH/misc/gitconfig ~/.gitconfig
ln -s $CONFIGPATH/misc/ssh_config ~/.ssh/config
ln -s $CONFIGPATH/misc/ctags ~/.ctags


echo "source $CONFIGPATH/shellconfig/shellrc" >> ~/.zshrc
