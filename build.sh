TARGET=set_environment.sh
echo \#\!/bin/bash > $TARGET
test  -n "$http_proxy" && echo export http_proxy=$http_proxy >> $TARGET
test  -n "$https_proxy" && echo export https_proxy=$https_proxy >> $TARGET

#docker build --force-rm --rm -t switcher:0.2 -t switcher:latest .
echo Parameters: $*
docker build $* -t cfrein/switcher:0.2 -t cfrein/switcher:latest .
