# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Functions
#
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }

# Git Aliases
hub_path=$(which hub)
echo $hub_path
if (( $+commands[hub] )) then
    alias git=$hub_path
fi

pj() { cd $PROJECTS/$1; }
compctl -W $PROJECTS -/ pj

