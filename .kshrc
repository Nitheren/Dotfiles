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

	PROMPT="~ "
	#PROMPT="<$USER@$HOST:!>$PS1S"
	#PPROMPT='$USER:$PWD:!'"$PS1S"
	#PPROMPT='<$USER@$HOST:$PWD:!>'"$PS1S"
	PS1=$PROMPT
	# $TTY is the tty we logged in on,
	# $tty is that which we are in now (might by pty)
	tty=$(tty)
	tty=${tty##*/}
	TTY=${TTY:-$tty}
	# $console is the system console device
	console=$(sysctl kern.consdev)
	console=${console#*=}

	set -o emacs

	alias ls='exa -F'
	alias h='fc -l | more'

	case "$TERM" in
	sun*-s)
		# sun console with status line
		if [[ $tty != $console ]]; then
			# ilabel
			ILS='\033]L'; ILE='\033\\'
			# window title bar
			WLS='\033]l'; WLE='\033\\'
		fi
		;;
	xterm*)
		ILS='\033]1;'; ILE='\007'
		WLS='\033]2;'; WLE='\007'
		pgrep -qxs $PPID telnet && export TERM=xterms
		;;
	*)	;;
	esac
	# do we want window decorations?
	if [[ -n $ILS ]]; then
		function ilabel { print -n "${ILS}$*${ILE}">/dev/tty; }
		function label { print -n "${WLS}$*${WLE}">/dev/tty; }

		alias stripe='label "$USER@$HOST ($tty) - $PWD"'
		alias istripe='ilabel "$USER@$HOST ($tty)"'

		# Run stuff through this to preserve the exit code
		function _ignore { local rc=$?; "$@"; return $rc; }

		function wftp { ilabel "ftp $*"; "ftp" "$@"; _ignore eval istripe; }

		function wcd     { \cd "$@";     _ignore eval stripe; }

		function wssh    { \ssh "$@";    _ignore eval 'istripe; stripe'; }
		function wtelnet { \telnet "$@"; _ignore eval 'istripe; stripe'; }
		function wsu     { \su "$@";     _ignore eval 'istripe; stripe'; }

		alias su=wsu
		alias ftp=wftp
		eval stripe
		eval istripe
		PS1=$PROMPT
	fi
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
;;
*)	# non-interactive
;;
esac
