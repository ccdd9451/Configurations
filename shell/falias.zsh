#! $SHELL


# Environment related commands
alias init='source setup.ini'
alias sa='source activate'
alias sd='source deactivate'
alias l="ls -lh"

# Misc
alias pickle='python -m pickle'
alias vpeek='vim -Mn'

# for Ubuntu
if [ `uname` = 'Linux' ]
then
    alias rm='mv --backup=t -t /tmp '
fi

# open_command
alias open='open_command'

function gi() { curl -L -s https://www.gitignore.io/api/\$@ ;}

