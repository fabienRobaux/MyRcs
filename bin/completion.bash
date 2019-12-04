#!/bin/bash
#complete -W "now tomorrow never" sshmount
source /usr/share/bash-completion/completions/sshfs
_sshfscomp()
{
  #echo ""
  #echo "COMP_WORDS : ${COMP_WORDS}"
  #echo "COMP_CWORD : ${COMP_CWORD}"
  #echo "COMP_WORDS[COMP_CWORD] : ${COMP_WORDS[COMP_CWORD]}"
  #echo "COMP_LINE : ${COMP_LINE}"
  #echo "COMP_POINT : ${COMP_POINT}"
  #echo "COMP_KEY : ${COMP_KEY}"
  #echo "COMP_TYPE : ${COMP_TYPE}"
  #echo "args : $@"
  #echo "reply : ${COMPREPLY}"
  #echo ${#COMP_WORDS[@]}
  #if [ "${#COMP_WORDS[@]}" != "2" ]; then
    #return
  #fi
    local cur prev words cword
    _init_completion -n : || return

    local userhost path

    _expand || return 0

    if [ "${#COMP_WORDS[@]}" -le "2"  ] || [[ "$cur" == *:* ]] ; then
        _sshfs
    else 
        _longopt
    fi
}

complete  -o nospace -F  _sshfscomp sshmount
