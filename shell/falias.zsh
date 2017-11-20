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

# if [ `uname` = 'Darwin' ]
# then
#     alias rm='mv --backup=t -t /tmp '
# fi

# Depercated
# alias init_try(){
# cwd=`pwd`
# while [ `pwd` != '\' ] 
# do
#     if [ -f 'README.ini' ]
#     then
# 	source README.ini; cat README.ini
# 	break
#     fi
# done
# cd $cwd
# }

