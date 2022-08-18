	HISTFILE=$HOME/.ksh_history
	HISTSIZE=20000

	PROMPT="; "
	PS1=$PROMPT

	export EDITOR=$VIM
	export FCEDIT=$EDITOR
	export PAGER=less
	export LANG=en_GB.UTF-8
	export TZ=Europe/London
	export PLAN9=/usr/local/plan9 export PLAN9 
	export PATH=$PATH:$PLAN9/bin export PATH
	export NO_COLOR
	export GCC_COLORS=
	export SFEED_PLUMBER="firefox"
	export SFEED_URL_FILE="$HOME/.config/sfeed/urls"

	alias restart='doas shutdown -r now'
	alias shutdown='doas shutdown -P now'
	alias ls='ls -p'
	alias sx='startx'
	alias svup='doas sv status /var/service/*'
	alias sfu='sfeed_update ~/.config/sfeed/sfeedrc'
	alias sf='sfeed_curses ~/.sfeed/feeds/*'
	alias sfc='rm ~/.sfeed/feeds/*'
