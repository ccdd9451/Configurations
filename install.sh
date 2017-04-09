shpos="$( cd "$( dirname "$0" )" && pwd )"
echo $shpos
mkdir -p ~/.config

ln -s $shpos ~/.config/myconfig
echo 'source ~/.config/myconfig/shellconfig/shellrc' >> ~/.zshrc
