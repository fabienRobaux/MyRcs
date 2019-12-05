#!/bin/sh
mkdir -p $HOME/bin
for i in `ls $pathtoMyRcs/bin/*`; do 
    echo $i
    ln -s $i   $HOME/bin/$(basename $i)
done
