# MyRcs


This is a .git package to store my rc configurations file!

Installation
============
- Place this folder somewhere inside in your desktop

        cd $HOME && git clone https://github.com/fabienRobaux/MyRcs

- source the MyRcs/bash_aliases inside yours: add at **the begining** (so that your own alias override the ones in that package) of your bash_aliases
        
            
        export pathtoMyRcs=$HOME/MyRcs
        if [[ -f "$pathtoMyRcs/.bash_aliases" ]]; then
                  source $pathtoMyRcs/.bash_aliases
        else
            echo "warning $pathtoMyRcs/.bash_aliases does not exists"
        fi

- same thing **at the beggining** of your $HOME/.vimrc:

        try 
          source $pathtoMyRcs/.vimrc
        catch
            echom "problem could not load $pathtoMyRcs/.vimrc"
        endtry 


- for the bins 2 possibilities
    * No indepedent bin: ( if you don't have anything in $HOME/bin **or/and** you want to add your bins inside this package (to share with everybody eventually))
        
            ln -s $pathtoMyRcs/bin $HOME/bin

    * either you want to still have your own private script in a different folder and just have access to this inside this package
        
            ./addAllBins.sh

- for the completion after the command (and also the bins) => same process as for a .bash_aliases
        
        source $pathtoMyRcs/.bash_completion
    
    




        


bin
---

everything in ~/bin is local written functions,

most are common stuff I use, sorry, some are not commented

bin/GoBenoit, bin/SyncBenoit ... are function usefull with ssh


bash_completion
--------------

~/.bash_completion is usefull (need also bash-completion package installed (by default in ubuntu))

bashrc
------

~/.bashrc is not very different from the basic one

bash_aliases
------------

~/.bash_aliases is very different, a lot of home made function and alias, with completion activated

.ssh
----
only config which defines myBen and myJud

on more recent version of ssh (>=7.3)

you can replace the "ProxyCommand ..." with just

ProxyJump myJud


