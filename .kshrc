# use vim if it's installed, vi otherwise
#case "$(command -v vim)" in
#  */vim) VIM=vim ;;
#  *)     VIM=vi  ;;
#esac

case "$-" in
*i*)	# we are interactive
	# we may have su'ed so reset these
	USER=$(id -un)
	UID=$(id -u)
	case $UID in
	0) PS1S='# ';;
	esac

	PS1S=${PS1S:-'$ '}
	HOSTNAME=${HOSTNAME:-$(uname -n)}
	HOST=${HOSTNAME%%.*}
	HISTFILE=$HOME/.ksh_history
	HISTSIZE=20000

	PROMPT="~ "
	#PROMPT="<$USER@$HOST:!>$PS1S"
	#PPROMPT='$USER:$PWD:!'"$PS1S"
	#PPROMPT='<$USER@$HOST:$PWD:!>'"$PS1S"
	PS1=$PROMPT

	export EDITOR=$VIM
	export FCEDIT=$EDITOR
	export PAGER=less
	export LANG=en_GB.UTF-8

	alias ls='ls -F'
	alias h='fc -l | more'
	alias cls=clear
	alias p='ps -l'
	alias df='df -h'
	alias weather='curl https://wttr.in'
	alias nb='newsboat'
	alias cm='cmus'
	alias add='doas pkg_add '
	alias info='pkg_info '
	alias search='pkg_info -Q '
	alias clean='doas pkg_delete -a'
	alias rem='doas pkg_delete '
	alias shutdown='doas shutdown -p now'
	alias restart='doas shutdown -r now'
	alias update='doas pkg_add -u'
	alias suckless='cd ~/git/suckless/'
	alias doc='cd /usr/local/share/doc/pkg-readmes/'
	alias temp='sysctl hw.sensors'
	screenshot(){
					imlib2_grab "screenshot.png" 
	}
	dep_count(){
					pkg_info -f $1 |
									awk -F : '/^@de/{print$3}' 
					}
	net_restart(){
					doas ifconfig iwm0 down
					doas ifconfig iwm0 up
	}
;;
*)	# non-interactive
				;;
esac
