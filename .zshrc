# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi


source ~/.zplug/init.zsh
zplug "nyquase/vi-mode"
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug load --verbose

# to load the widgets before vi-mode plugin
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search


# small aliases usefull
alias ll="ls -l --color=auto"
alias la="ll -a"
# sort by time 
alias lt='ll --sort=time -r' 
alias lsd='ll -d --sort=time -r' 
alias lld='ll -d --sort=time -r' 

#other shortcuts 
# du is the size here (h for human reading, so size is said in terms of Ko Mo and Go)
alias d='du -sch'
function sortSize(){ du -sch $@ | sort --human-numeric-sort --reverse;}
# df is the size of the current drive
alias df='df -h'

# rsync
alias cpv="rsync -ah --info=progress2"

# find a current pattern inside any file (here and subdirectories. ie "grepi function1" )
alias grepi='grep  -iIrRn --exclude=*~* --exclude=*bak*'

# find files with pattern (ie findn fileName1 ~location/ ) 
function findn () { find ./$2 -iname "*$1*";}

# use vim editing mode in the zsh terminal
#bindkey -v
#bindkey "\e[3~" delete-char


# open lecteurs par default 
alias mp4="totem" 
alias avi="mp4"   

function pdf()
{
    command okular "$@" > /dev/null 2>&1 &
} 

alias png="eog"
alias jpg="png"


# shortcut aliases for manjaro
alias yayinstall="yay -Syu"
alias yayremove="yay -Rns"
alias yayclean="yay -Yc"
alias yaystats="yay -Ps"

# use neovim by default
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias oldvim="\oldvim"
export VISUAL=nvim
export EDITOR="$VISUAL"

# vimsplit
alias vimsplit='vi -O'

# trashes
alias rmt="trash"
alias trm="trash"
alias listtrash='echo   | restore-trash | sort -k2,3'
alias rm="echo nothing to do, use \rm if you really want"


#latex tlmgr is buggy, I(fabien) had to modify a line thanks to the archlinux info 
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"

alias zshconfig="vi $HOME/.zshrc"
alias sourcezsh="source $HOME/.zshrc"

# to open new tab in the same loc
source /etc/profile.d/vte.sh

# To load the bins created locally 
export PATH="$PATH:$HOME/bin"


