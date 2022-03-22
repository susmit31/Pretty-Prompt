###############################
# ANSI colour codes #
###############################
export f_yellow="\[\033[1;33m\]"
export f_red="\[\033[1;31m\]"
export f_pink="\[\033[1;91m\]"
export f_blue="\[\033[0;34m\]"
export f_lblue="\[\033[1;34m\]"
export f_green="\[\033[32m\]"
export f_orange="\[\033[33m\]"
export f_cyan="\[\033[36m\]"
export f_dgray="\[\033[30m\]"
export f_lgray="\[\033[37m\]"
export f_purple="\[\033[1;35m\]"
export b_purple="\[\033[1;45m\]"
export b_blue="\[\033[1;44m\]"
export b_green="\[\033[1;42m\]"
export b_red="\[\033[1;41m\]"
export b_cyan="\[\033[1;46m\]"
export f_none="\[\033[0m\]"


######################################
# Unicode Geometric Shapes #
######################################
export geom_tri=$(echo -ne '\x25\xB6' | iconv -f utf-16be)
export geom_smsqr=$(echo -ne '\x25\xA0' | iconv -f utf-16be)
export geom_lgrec=$(echo -ne '\x25\xAE' | iconv -f utf-16be)
export geom_lgsqr="$geom_lgrec$geom_lgrec"


#####################################
# Evaluating ancestry #
#####################################
SRCDIR=$(dirname $0)

if [ -a currdir.txt ]
then
	cdir=$(cat $SRCDIR/currdir.txt)
else
	echo $SRCDIR > $SRCDIR/currdir.txt
	cdir=$SRCDIR
fi

alias ancestors="source $cdir/ancestors.sh"
PS1="[$f_cyan\$(ancestors)$f_lblue/\W]$f_yellow$geom_smsqr$geom_tri $f_cyan"

# Same code for Python
# ANCESTORS=$(python3 -c "dir='$(pwd)'; d=dir.split('/'); print('/'.join(d[:-1]) if dir!='/home/shanks-mint' else '')")

# On my system I have compiled a Go code for evaluating the 
# ancestry. I don't find the Bash and Python versions very
# elegant so this is the version I run.
# alias ancestors="~/ancestors"
# PS1="[$f_lblue\$(ancestors)$f_orange/\W$f_none]$f_yellow$geom_smsqr$geom_tri $f_cyan"

# Note that within the prompt you must prefix a chunk of code to be 
# executed every time by "\". Otherwise Bash will just evaluate it 
# at prompt startup and use that value on following prompts. So for
# example, even if you move in to say /home/$USER/Downloads/dir, 
# the prompt will tell you that you're in /home/dir, because the 
# ancestry of the /home/$USER directory is "/home".

##########################################################
# Resetting colour at the beginning of command output #
##########################################################
trap 'echo -ne "\033[0m"' DEBUG