#!/bin/zsh

autoload -U colors && colors
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# Path
path=("$HOME/.scripts/" "$HOME/.local/bin/" "$HOME/.local/bin/dat/releases/dat-13.13.1-linux-x64" "$path[@]")
path+=("$HOME/.gem/ruby/2.6.0/bin/")

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/history"

# Options
setopt noclobber
setopt autocd

source "${XDG_CONFIG_HOME:-$HOME/.config}/aliases" 
source "${XDG_CONFIG_HOME:-$HOME/.config}/functions" 

# Change cursor shape
function zle-keymap-select {
		if [[ ${KEYMAP} == vicmd ]] ||
		   [[ $1 = 'block' ]]; then
				echo -ne '\e[1 q'
		elif [[ ${KEYMAP} == main ]] ||
		     [[ ${KEYMAP} == viins ]] ||
    	     [[ ${KEYMAP} = '' ]] ||
    	     [[ $1 = 'beam' ]]; then
			echo -ne '\e[5 q'
		fi
}

zle -N zle-keymap-select
zle-line-init() {
		zle -K viins
		echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey -v

# Edit command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey "^v" edit-command-line

# prompt
autoload -Uz promptinit
promptinit
fpath=("$ZDOTDIR/prompts" "$ZDOTDIR" "$fpath[@]") 	
PROMPT='%1~ %F{blue}%(!.#.$) %f'

# syntax highlighting
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# auto suggestions
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# mpv file completion
zstyle ':completion:*:*:mpv:*' file-patterns '*.(#i)(flv|mp4|webm|mkv|wmv|mov|avi|mp3|ogg|wma|flac|wav|aiff|m4a|m4b|m4v|gif|ifo)(-.) *(-/):directories' '*:all-files'

# fzf
source /usr/share/fzf/completion.zsh
