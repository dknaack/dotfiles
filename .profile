#!/bin/sh

export PATH="$HOME/.local/bin:$HOME/.local/bin/statusbar/:$PATH:$HOME/etc/android/cmdline-tools/latest/bin/:$HOME/etc/repos/flutter/bin/"

# XDG base directories
export \
    XDG_CACHE_HOME="$HOME/.cache" \
    XDG_CONFIG_HOME="$HOME/.config" \
	XDG_DATA_HOME="$HOME/.local/share" \
	XDG_STATE_HOME="$HOME/.local/state"

# Default programs
export \
    BROWSER="librewolf" \
    EDITOR="nvim" \
    READER="zathura" \
    SUDO_EDITOR="sudo nvim" \
    TERMINAL="foot"

# env variables to keep programs from putting random stuff inside $HOME
export \
	ANDROID_AVD_HOME="$HOME/etc/android/avd" \
	ANDROID_HOME="$HOME/etc/android" \
	ANDROID_SDK_ROOT="$HOME/etc/android/sdk" \
    CARGO_HOME="$HOME/.local/share/cargo" \
    CCACHE_DIR="$HOME/.cache/ccache/" \
	GDBHISTFILE="$XDG_DATA_HOME/gdb/history" \
    GEM_PATH="$HOME/.local/share/gem" \
    GEM_SPEC_CACHE="$HOME/.cache/gem" \
    GNUPGHOME="$HOME/.config/gnupg" \
    GOPATH="$HOME/.local/share/go" \
    GPG_TTY="$(tty)" \
    GROFF_FONT_PATH="$HOME/.local/share/groff/fonts" \
    GROFF_TMAC_PATH="$HOME/.local/share/groff/tmac" \
    GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0" \
    HISTCONTROL='ignoreboth' \
    HISTFILE="$HOME/.cache/histfile" \
    IPYTHONDIR="$HOME/.config/ipython" \
    LEDGER_FILE="$HOME/docs/finances/journal" \
    LESSHISTFILE="-" \
    MAIL="$HOME/.local/share/mail" \
    MAILDIR="$HOME/.local/share/mail" \
	MAKEFLAGS="-j$(nproc)" \
    NOTMUCH_CONFIG="$HOME/.config/notmuch-config" \
    PASSAGE_DIR="$HOME/.local/share/passage/store" \
    PASSAGE_IDENTITIES_FILE="$HOME/.local/share/passage/identities" \
    PASSAGE_RECIPIENTS_FILE="$HOME/.local/share/passage/recipients" \
    PASSWORD_STORE_DIR="$HOME/.local/share/password-store" \
    PKG_CONFIG_PATH="$HOME/.local/share/pkgconfig" \
	REMINDERS="$HOME/docs/.reminders" \
    RUSTUP_HOME="$HOME/.local/share/rustup" \
    TEXMFHOME="$XDG_DATA_HOME/texmf" \
	TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var" \
	TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config" \
	UNISON="$XDG_DATA_HOME/unison" \
    WINEPREFIX="$HOME/.config/wine" \
	VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC' \
    XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" \
	XINITRC="$XDG_CONFIG_HOME/X11/xinitrc" \
    ZDOTDIR="$HOME/.config/zsh"

# Misc settings
export \
    MANWIDTH=80 \
	CHROME_EXECUTABLE="/usr/bin/chromium" \
	XKB_DEFAULT_LAYOUT="us" \
	XKB_DEFAULT_VARIANT="altgr-intl" \
    _JAVA_AWT_WM_NONREPARENTING=1

if [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x river >/dev/null; then
    echo 'Starting river...'
	river
fi
