bashCompFile=~/.bash_completion
if ! [[  -f  "$bashCompFile" ]]; then
    echo -e "\e[31m\e[1m$bashCompFile does not exists \e[0m"
    echo "maybe try to apt install bash-completion" 
    echo "complete alias is also needed. "
    echo "https://github.com/cykerway/complete-alias"
    echo "in that repo, you need the bash_completion file"
    echo "cat bash_completion.sh >> ~/.bash_completion"
else
    source $bashCompFile
fi

# 
shopt -s expand_aliases


# enable color support of ls and also add handy aliases
# This comes from .bashrc, I've put them there to allow for vim to use it with !{command}
# When is .bashrc I don't know why but it doesn't work
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ll='ls -lhvF'
alias la='ll -A'
alias l='ls -CF'


# source the completion file
source /etc/bash_completion
#PATH GLOBAL where I store my generic bash functions
localBin=$HOME/bin

if [[ -d $localBin ]]; then
    export localBin
    export PATH=$PATH:$localBin
    source $localBin/completion.bash
    source $localBin/sshFunctions
else
    echo -e "\e[31m\e[1m$localBin does not exists \e[0m"
    echo maybe you dont want any, but this is the directory inwich I store my homemade functions
fi

localgripBin=$HOME/.local/bin
if [[ -d $localgripBin ]]; then
    export PATH=$PATH:$localgripBin
fi


# TO avoid comma and points problem
export LC_NUMERIC=C

# open lecteurs par default 
alias mp4="totem" && complete -F _complete_alias mp4
alias avi="mp4"&& complete -F _complete_alias avi


function pdf()
{
    command okular "$@" > /dev/null 2>&1 &
} 

alias png="eog"&& complete -F _complete_alias png
alias jpg="png"&& complete -F _complete_alias jpg

#shortcuts sudo apt-get because it is too log to write sudo apt update (sudap is better) 
# mostly use only sudall (update then upgrade then clean the udpate again)
export appapt='aptitude' 
alias suda="sudo $appapt" && complete -F _complete_alias suda
alias sudap="sudo $appapt update" 
alias sudai="sudo $appapt install"
alias sudag="sudo $appapt upgrade" 
alias sudaclean="sudo apt autoremove; sudo $appapt autoclean" 
alias sudall="sudap && sudag && sudaclean && sudap" 


# sort by time 
alias lt='ll --sort=time -r' && complete -F _complete_alias lt
alias lsd='ll -d --sort=time -r' && complete -F _complete_alias lsd
alias lld='ll -d --sort=time -r' && complete -F _complete_alias lld


#other shortcuts 

	
# du is the size here (h for human reading, so size is said in terms of Ko Mo and Go)
alias d='du -sch'
# df is the size of the current drive
alias df='df -h'
# cd 
alias ..="cd  .."
alias ...="cd ../.."
# recurcive copy and suppress
alias rmr="rm -r" 
alias cpr="cp -r"

# alias for counting lines  (for example test@test:~/$ cat .bash_aliases | wl )
alias wl="wc -l"

# find a current pattern inside any file (here and subdirectories. ie "grepi function1" )
alias grepi='grep  -iIrRn --exclude=*~* --exclude=*bak*'

# find files with pattern (ie findn fileName1 ~location/ ) 
function findn () { find ./$2 -iname "*$1*";}
# easy command to go where my article dir is
alias cdarticle='cd ~/These/Presentation/articles/2018_09_article'
# tail prints the end of a file with -f option it follows it 
#when the file is updated (follow a logfile). tail -150 means 150 lines)
alias tailf='tail -f '
alias taill='tail -150 '

#shortcuts envoie de mail auto avec the thunderbird id4 (for me its ens-cachan.fr)
alias sendmail='thunderbird -compose "preselectid=id4"' 
#wants to send a .pdf with thunderbird and you are in terminal. senddoc test.pdf. 
# id4 is the 4th id on thunderbird (ens-cachan for me)

function senddoc () { 
	echo attaching "$@" to a mail;
	att="attachment='"
    echo "$@"
	for i in "$@";do
        fil=$(realpath "$i")
        echo $fil
        att=$att$fil,
	done
	att=${att::-1}"'"

    ch="preselectid=id1,$att"; 
	echo 'Executing: thunderbird -compose "'$ch'"'; 
	thunderbird -compose "$ch"; 
}

#shudown computer 
alias shn="shutdown now"


# how the prompt line begins (robaux@robaux-dell:~/These/blabla$ )
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}: ${PWD}\007"' 



# Alias rm
#alias rm='trash' #"echo use trash 'rmt/trash' or use the full path i.e. '/bin/rm'" need the package trash-cli sent to trash
# instead of suppressing 
alias rmt="trash"
alias trm="trash"
alias listtrash='echo   | restore-trash | sort -k2,3'

# if the touchpad is activated, try to detect when its the palm of the hand so as not to click always anywhere
# does not work well
synclient PalmDetect=1

## git function
#function git_diff() {
  #git diff --no-ext-diff -w "$@" | vim -R –
#} && complete -F _complete_alias git_diff


##### vim shortcut uses which to find the position of a command, and opens it
function vwhich()
{
     vi $(which $1)
} && complete -c which vwhich

function gvwhich()
{
     gvim $(which $1)
} && complete -c which gvwhich






export THESE_DIR=$HOME/These

# Alias These
alias cdthese="cd $THESE_DIR"






# everythin containing $HOME can be commented as it is mine (on vim, just type :%g/\$HOME/s/^/#/g it will add a comment # )
# also possible to comment everything bellow 
# I let them here as example
#PATH to where I store my generic toolbox in python
export PYTHONPATH=$PYTHONPATH:$HOME/These/PythonUtils

#paraview
#export PATH=$PATH:$HOME/ParaView-5.6.0-MPI-Linux-64bit/bin

# set Salome env
function salomeenv () { $HOME/SALOME-7.8.0-OPENSOURCE-UB16.04/salome context; }
function salome () { $HOME/SALOME-7.8.0-OPENSOURCE-UB16.04/salome; }
export salome_dir='$HOME/SALOME-7.8.0-OPENSOURCE-UB16.04/'


# set Environnements (openFoam for example)
export OpenF="$HOME/OpenFOAM"
alias srcof300='source $HOME/These/OpenFOAM/OpenFOAM-3.0.0/etc/bashrc WM_LABEL_SIZE=64'
function srcof1712(){
    source $HOME/These/OpenFOAM/v1712/OpenFOAM-v1712/etc/bashrc 
    source $WM_PROJECT_USER_DIR/etc/bashrc
}
function srcof1712Debug(){
    source $HOME/These/OpenFOAM/v1712/OpenFOAM-v1712/etc/bashrcDebug
    source $WM_PROJECT_USER_DIR/etc/bashrc
}
alias srcof300p="source $OpenF/OpenFOAM-v3.0+/etc/bashrc"

alias srcwaves2Foam="source $OpenF/waves2Foam/bin/bashrc"
alias OCW3D="$HOME/OpenFOAM/fabien-v3.0+/applications/utilities/waves2Foam/ThirdParty/OceanWave3D-Fortran90/GUI/OCW3D"
alias srcOpenAndWaves="srcOpenFoam; srcwaves2Foam"
alias srcParaView="export PATH=$PATH:$OpenF/ThirdParty-v3.0+/build/linux64Gcc/ParaView-4.4.0/bin/"

alias srcHPC2.0='source $HOME/These/HPC/HPC_2Dv2.0/bashrc'
alias srcHPC2.1='source $HOME/These/HPC/HPC_2Dv2.1/bashrc'
alias srcIBMHPC='source $HOME/These/HPC/HPC_2DIBMFs/bashrc'
alias srcFsHPC='source $HOME/These/HPC/HPC_2DFreeSpiercing/bashrc'
alias srcCFsHPC='source $HOME/These/HPC/HPC_2DFsPCorner/bashrc'
alias srcIdCellHPC='source $HOME/These/HPC/HPC_2DIdCell/bashrc'
alias srcBF='source $HOME/These/HPC/HPC_2DIBF/bashrc'
alias srcHPC='srcIdCellHPC'



