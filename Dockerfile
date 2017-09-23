FROM ubuntu:latest

RUN set -ex; \
    apt-get update; \
    apt-get -y install zsh vim curl git ctags\
       build-essential cmake\
       python-dev silversearcher-ag;\
    git clone https://github.com/ccdd9451/sysConfigs.git .sys;\
    cd .sys;\
    sh install.sh
