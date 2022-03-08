# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# USER SPECIFIC ENVIRONMENT
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


# HISTORY
export HISTFILE="/home/nbry/.histfile"
export SAVEHIST=10000
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignorespace:ignoredups
export HISTIGNORE="history:ls:pwd:"
setopt INC_APPEND_HISTORY
export PROMPT_COMMAND='history -a' # add to history on command execution

setopt extendedglob nomatch
unsetopt autocd beep notify
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nbry/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ALIASES
source ~/.zsh_aliases
source ~/.zsh_other

export TERMINAL="alacritty"
export EDITOR="nvim"
export PROMPT_DIRTRIM=1

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
