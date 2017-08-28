# Dependencies checking

# for zsh

if [ "$1" != "--bash" ]; then
    hash zsh 2>/dev/null || { echo  >&2 'zsh not exist'; exit 1; }
fi

# for k-vim
hash ctags 2>/dev/null || {
echo 'Need Dependencies installed
for ubuntu run

sudo apt-get install ctags
sudo apt-get install build-essential cmake python-dev
sudo apt-get install silversearcher-ag

for mac run

brew install ctags the_silver_searcher

and install python utils if you need them

pip install pyflakes pylint pep8

'; exit 1; }

# Set up config
shpos="$( cd "$( dirname "$0" )" && pwd )"
mkdir -p $HOME/.config
ln -sfF $shpos $HOME/.config/myconfig
export CONFIGPATH=$HOME/.config/myconfig

# Link files
ln -sf $CONFIGPATH/misc/gitconfig $HOME/.gitconfig
ln -sf $CONFIGPATH/misc/sshconfig $HOME/.ssh/config
ln -sf $CONFIGPATH/misc/ctags $HOME/.ctags
ln -sf $CONFIGPATH/misc/tmux $HOME/.tmux.conf
ln -sf $CONFIGPATH/misc/irbrc $HOME/.irbrc

# Install ZSH configurations
CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
    touch $HOME/.bashrc
    echo "source $CONFIGPATH/shell/shellrc" >> $HOME/.bashrc
else
    touch $HOME/.zshrc
    echo "source $CONFIGPATH/zsh/zshrc" >> $HOME/.zshrc

    # If this user's login shell is not already "zsh", attempt to switch.
    TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
    if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    # If this platform provides a "chsh" command (not Cygwin), do it, man!
        if hash chsh >/dev/null 2>&1; then
            printf "Time to change your default shell to zsh!\n"
            chsh -s $(grep /zsh$ /etc/shells | tail -1)
        # Else, suggest the user do so manually.
        else
        printf "I can't change your shell automatically because this system does not have chsh.\n"
        printf "Please manually change your default shell to zsh!\n"
        fi
    fi
fi
unset CHECK_ZSH_INSTALLED

# Install vim configurations
cd vim && yes | ./install.sh
