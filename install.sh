# Set up config
shpos="$( cd "$( dirname "$0" )" && pwd )"
mkdir -p $HOME/.config
ln -sfFh $shpos $HOME/.config/myconfig
export CONFIGPATH=$HOME/.config/myconfig

# Link files
ln -sf $CONFIGPATH/misc/gitconfig $HOME/.gitconfig
ln -sf $CONFIGPATH/misc/sshconfig $HOME/.ssh/config
ln -sf $CONFIGPATH/misc/ctags $HOME/.ctags

# Install ZSH configurations
touch $HOME/.zshrc
echo "source $CONFIGPATH/zsh/shellrc" >> $HOME/.zshrc

# Install vim configurations
cd vim && yes | ./install.sh
