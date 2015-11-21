# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
umask 022

export PATH

alias ll='ls -la --color=auto'
alias grep='grep --color'
alias df='df -h'
alias ps='ps --sort=start_time'
alias g='git'
