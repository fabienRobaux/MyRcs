# vimrc
contains my vimrc config file

note that  in ~/ 
there is a link

.vimrc => .vim/vimrc

to create it

cd ~ && ln -s .vim/vimrc .vimrc


packages:
---------
-pathogen to manage the packages. (pathogen lines in my vimrc)
     after, to install , you just need to
     * go in ~/.vim/bundle/
     * git clone github/thepackageIwantToAdd
      *done

- Align (small one to align auto to "=" or to ";")

- YouCompleteMe (wonderfull, syntax highlights, goto commands, for mainly for C C++)

- YCM-Generator (generate automatically the coloring and indexes, where are everything and stuff for YouCompleteMe to works well) -> Good for BIG projects

- c-support

- color_coded ( In order to colorize functions defined in the current projet C C++)

- delimitMate (small one, to add a close ) when you open one ( , and other stuffs like that)

- diffchar.vim (small one, ameliorate the difference tool of vim - you can highlight only words that differs or characters. Default vim is only lines)

- nerdcommenter (REALLY COOL, you select ten lines, you press <leader>cc => commenter, with <leader>ci every comment is inverted)

- nerdtree (Big one, but really cool, allows you to have a tree of the dir and subdirs)

- fuzzyfinder (so cool, goal is to search for opened buffers)

- vim-latex (Very important if you want to use vim for latex)

- vim-airline (small one, just give you a bar at the bottom of vim and gives you the state)
