# Usage: copy & paste the code below in ~/.bash_profile

_complete_i2cssh_hosts () {
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    host_list=`grep '    ' ~/.i2csshrc | grep -v 'hosts:' | sed -n -e 's/ *//' -e 's/://p'`
    COMPREPLY=( $(compgen -W "${host_list}" -- $cur))
    return 0
}
_complete_known_hosts () {
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    host_list=`cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`
    COMPREPLY=( $(compgen -W "${host_list}" -- $cur))
    return 0
}
complete -F _complete_i2cssh_hosts i2cssh
complete -F _complete_known_hosts ssh