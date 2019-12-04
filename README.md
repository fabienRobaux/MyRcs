# MyRcs


This is a .git package to store my rc configurations file!

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


