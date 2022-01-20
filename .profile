#!/bin/sh

export PATH="$HOME/.local/bin:$HOME/.local/bin/statusbar/:$PATH"

export \
	BROWSER="librewolf" \
	CARGO_HOME="$HOME/.config/cargo" \
	CCACHE_DIR="$HOME/.cache/ccache/" \
	EDITOR="nvim" \
	GEM_PATH="$HOME/.local/share/gem" \
	GEM_SPEC_CACHE="$HOME/.cache/gem" \
	GNUPGHOME="$HOME/.config/gnupg" \
	GOPATH="$HOME/.config/go" \
	GPG_TTY="$(tty)" \
	GROFF_FONT_PATH="$HOME/.local/share/groff/fonts" \
	GROFF_TMAC_PATH="$HOME/.local/share/groff/tmac" \
	GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0" \
	HISTCONTROL='ignoreboth' \
	HISTFILE="$HOME/.config/histfile" \
    IPYTHONDIR="$HOME/.config/ipython" \
	LEDGER_FILE="$HOME/docs/finances/journal" \
	LESSHISTFILE="-" \
	MAIL="$HOME/.local/share/mail" \
	MAILDIR="$HOME/.local/share/mail" \
	NOTMUCH_CONFIG="$HOME/.config/notmuch-config" \
	PASSWORD_STORE_DIR="$HOME/.local/share/password-store" \
	PASSAGE_DIR="$HOME/.local/share/passage/store" \
    PASSAGE_IDENTITIES_FILE="$HOME/.local/share/passage/identities" \
    PASSAGE_RECIPIENTS_FILE="$HOME/.local/share/passage/recipients" \
	PATH="$PATH:$CARGO_HOME/bin" \
	READER="zathura" \
	RUSTUP_HOME="$HOME/.config/rustup" \
	SUDO_EDITOR="sudo nvim" \
	TERMINAL='st' \
	TEXMFHOME="$HOME/.config/texmf" \
	WINEPREFIX="$HOME/.config/wine" \
	XAUTHORITY="$HOME/.config/Xauthority" \
	XDG_CACHE_HOME="$HOME/.cache" \
	XDG_CONFIG_HOME="$HOME/.config" \
	ZDOTDIR="$HOME/.config/zsh" \
	_JAVA_AWT_WM_NONREPARENTING=1

[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && startx
