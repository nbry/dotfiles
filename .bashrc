# .bashrc

# SOURCE GLOBAL DEFINITIONS
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# USER SPECIFIC ENVIRONMENT
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


# USER SPECIFIC ALIASES AND FUNCTIONS
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi


# HISTORY
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE="history:ls:pwd:"
export PROMPT_COMMAND='history -a' # add to history on command execution

# ALIASES
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_other ]; then
	. ~/.bash_other
fi

# ALACRITTY BASH COMPLETION
source ~/.bash_completion/alacritty


export TERMINAL="alacritty"
export EDITOR="nvim"

# PROMPT
export PROMPT_DIRTRIM=1

git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="[\w]\[$(tput sgr0)\]\[\033[38;5;9m\]\$(git_branch)\[$(tput sgr0)\] \n\[$(tput sgr0)\]\[\033[38;5;48m\]>\[$(tput sgr0)\] \[$(tput sgr0)\] "
