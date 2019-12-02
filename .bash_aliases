# TO avoid comma and points problem
export LC_NUMERIC=C

# open lecteurs par default 
alias mp4="totem"
alias avi="mp4"
alias pdf="evince"
alias png="eog"
alias jpg="png"

#shortcuts sudo apt-get because it is too log to write sudo apt update (sudap is better) 
# mostly use only sudall (update then upgrade then clean the udpate again)
export appapt='aptitude'
alias suda="sudo $appapt"
alias sudap="sudo $appapt update"
alias sudai="sudo $appapt install"
alias sudag="sudo $appapt upgrade"
alias sudaclean="sudo apt autoremove; sudo $appapt autoclean"
alias sudall="sudap && sudag && sudaclean && sudap"


# sort by time 
alias lt='ll --sort=time -r'

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
function senddoc () { echo attaching $1 to a mail; ch="preselectid=id4,attachment=`pwd`/$1"; echo 'Executing: thunderbird -compose "'$ch'"'; thunderbird -compose "$ch"; }

#shudown computer 
alias shn="shutdown now"


PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}: ${PWD}\007"'



# Alias rm
#alias rm='trash' #"echo use trash 'rmt/trash' or use the full path i.e. '/bin/rm'" need the package trash-cli sent to trash
# instead of suppressing 
alias rmt="trash"
alias trm="trash"

# if the touchpad is activated, try to detect when its the palm of the hand so as not to click always anywhere
# does not work well
synclient PalmDetect=1

# git function
function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R –
}

##### vim shortcut uses which to find the position of a command, and opens it
function vwhich()
{
     vi $(which $1)
}

function gvwhich()
{
     gvim $(which $1)
}


# look inside the list of the jobs in that computer and print its PID and LOCATION psName mySolv => will look for mySolv*
function psName()
{
    name=$1
    a=$(ps -ef | awk '$8 ~ /'$name'.*/ {"pwdx " $2  | getline a ;printf "%s\t",a ; print $8}')
    #a=$(ps -ef | awk '$8 ~ /'$name'.*/  {print $8 }')

    echo "$a"
    #b=$(ps -ef | awk '$8 ~ /'$name'*/ {print $8}')
    #echo $a
    #for i in $a;do
        #echo $b $(pwdx $i)
    #done

}










# everythin containing $HOME can be commented as it is mine (on vim, just type :%g/\$HOME/s/^/#/g it will add a comment # )
# also possible to comment everything bellow 
# I let them here as example
#PATH to where I store my generic toolbox in python
export PYTHONPATH=$PYTHONPATH:$HOME/These/PythonUtils

#PATH GLOBAL where I store my generic bash functions
export PATH=$PATH:$HOME/bin
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


# Alias These
export THESE_DIR=$HOME/These
alias cdthese="cd $THESE_DIR"
# Alias to connect judas
alias GoJuda='ssh robaux@judas.irphe.univ-mrs.fr'

function GoBenoit(){
	rep=$(pwd) 
	ssrep=$(echo $rep | awk -F "These/" '{printf $2 "\n"}') 
	dir=$ssrep/$1
	echo $rep
	ssh $1 robaux@147.94.56.171
	echo $dir
	cd $dir;

	}
export BenoitDell='robaux@147.94.56.171'
export BenoitHome=$HOME/These/BenoitHome
export perso='fabien@192.168.102.189'
function mountBenoitHome() { 
	sshfs robaux@147.94.56.171:/home/robaux/These $HOME/These/BenoitHome 
	}
function unmountBenoitHome() { 
	fusermount -u $HOME/These/BenoitHome; }

function SyncBenoit() { 
	rep=$(pwd) 
	#ssrep=$(echo $rep | awk -F "These/" '{printf $2 "\n"}') 
	dir=$rep/$1
	echo synch: $dir, with robaux@147.94.56.171:$dir
	#ssh robaux@147.94.56.171 "mkdir -p $dir"
	rsync -e ssh -ravz $1 robaux@147.94.56.171:$dir
	 }
function SyncBenoitBack(){
	rep=$(pwd) 
	#ssrep=$(echo $rep | awk -F "These/" '{printf $2 "\n"}') 
	dir=$rep/$1
	echo synch: $dir, with robaux@147.94.56.171:$dir
	ssh robaux@147.94.56.171 "mkdir -p /$dir"
	rsync -e ssh -ravz  robaux@147.94.56.171:$dir $1
	 }
function SyncPersoBack(){
	rep=$(pwd) 
	ssrep=$(echo $rep | awk -F "These/" '{printf $2 "\n"}') 
	dir=$ssrep/$1
	ssh $perso "mkdir -p /home/fabien/These/$dir"
	echo "rsync -e ssh -ravz  $perso:/home/fabien/These/$dir/* $1"
	rsync -e ssh -ravz  $perso:/home/fabien/These/$dir/* $1
	 }
