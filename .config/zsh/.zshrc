#!/bin/zsh

autoload -U colors && colors
autoload -U compinit
autoload -Uz promptinit
autoload edit-command-line
zmodload zsh/complist
compinit

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/history"

setopt noclobber
setopt autocd

# Plugins
source "$HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/plugins/zsh-cjd/zsh-cjd.zsh"
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
source "${XDG_CONFIG_HOME:-$HOME/.config}/sh/aliasrc"

# Custom commands
zle-keymap-select() {
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

zle-line-init() {
	zle -K viins
	echo -ne "\e[5 q"
}

preexec() {
	echo -ne '\e[5 q'
}

find-file() {
	local file="$(rg --files | fzf)"
	if [ -n "$file" ]; then
		zle && zle kill-buffer && zle -R
		echo -ne '\e[5 q'
		$EDITOR $file
	fi
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N edit-command-line
zle -N find-file
echo -ne '\e[5 q'

# Key bindings
bindkey -v
bindkey ^A vi-beginning-of-line
bindkey ^E vi-end-of-line
bindkey ^v edit-command-line
bindkey ^P find-file
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Prompt
promptinit
fpath=("$ZDOTDIR/prompts" "$ZDOTDIR" "$fpath[@]")
PROMPT='%1~ %F{blue}%(!.#.$) %f'

# Completions
_comp_options+=(globdots) # Include hidden files
zstyle ':completion:*' menu select
zstyle ':completion:*:*:mpv:*' file-patterns '*.(#i)(flv|mp4|webm|mkv|wmv|mov|avi|mp3|ogg|wma|flac|wav|aiff|m4a|m4b|m4v|gif|ifo)(-.) *(-/):directories' '*:all-files'

# Fix discord
discord_config="$HOME/.config/discord/settings.json"
if ! grep -Fq "MIN_WIDTH" "$discord_config"; then
	sed -i '1a\
		"MIN_WIDTH": 0,\
		"MIN_HEIGHT": 0,' "$discord_config"
fi

# File manager
lf() {
    dir="$(/usr/bin/lf -print-last-dir "$@")"
    if [ -n "$dir" ] && [ -d "$dir" ]; then
        cd "$dir"
    fi
}
