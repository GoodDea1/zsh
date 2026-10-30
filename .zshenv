# Environment variables
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
# export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export BITWARDEN_SSH_AUTH_SOCK="$XDG_RUNTIME_DIR"
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export STACK=1
export RENPY_PATH_TO_SAVES="$XDG_DATA_HOME/renpy"
export RENPY_MULTIPERSISTENT="$XDG_DATA_HOME/renpy_shared"

export TERMINAL="kitty"
export EDITOR="nvim"
export BROWSER="zen-browser"

export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons

export PATH=/home/nick/.pyenv/shims:/home/nick/.local/share/zinit/polaris/bin:/home/nick/.local/share/cargo/bin:/home/nick/.local/bin:/usr/local/bin:/usr/bin:/bin:/root/.cargo/bin

export FZF_DEFAULT_OPTS="--layout=reverse --info=inline --border=sharp --preview-border=sharp"
. "/home/nick/.local/share/cargo/env"
