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
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    touch $HOME/.bashrc
    echo "source $CONFIGPATH/shell/shellrc" >> $HOME/.bashrc
else
    touch $HOME/.zshrc
    echo "source $CONFIGPATH/zsh/zshrc" >> $HOME/.zshrc
fi
unset CHECK_ZSH_INSTALLED

# Install vim configurations
# cd vim && yes | ./install.sh
