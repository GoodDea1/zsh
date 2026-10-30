# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
HISTDUP=erase
PURE_PROMPT_SYMBOL='>'
PURE_PROMPT_VICMD_SYMBOL='V'
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey -v
export KEYTIMEOUT=1
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nick/.config/zsh/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# Download Zinit, it it's not there yet
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# fpath+=($HOME/clones/pure)
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
# autoload -U promptinit; promptinit
# prompt pure

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu yes
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':prompt:pure:prompt:*' color white
zstyle :prompt:pure:path color white

bindkey '^f' autosuggest-accept

# Aliases
# alias ls='ls -lha --color'
# alias update='sudo pacman -Syu'
alias update='sudo zypper refresh && sudo zypper dist-upgrade && sudo flatpak update'
# alias search='sudo pacman -Ss'
# alias install='sudo pacman -S'
# alias uninstall='sudo pacman -Rs'
# alias orphans='pacman -Qtdq'
# alias killorphans='pacman -Qtdq | sudo pacman -Rns -'
# alias aurs='yay -Ss'
# alias auri='yay -S'
# alias auru='yay -Rs'
alias fastfetch='fastfetch -l Aperture'
alias rain='cmatrix -ba -u 1 -C red'
alias lava='lavat -G -s 1 -c yellow -k green -C -b 5 -r 1'
alias wifi='nmcli device wifi list'
alias connect='nmcli device wifi connect'
alias audio='pulsemixer'
# alias reload='killall -SIGUSR2 waybar'
alias clock='peaclock --config-dir ~/.config/peaclock'
alias weather='setopt +o nomatch & curl wttr.in/Dublin,California?u?F?q'
# alias wtf="sudo pacman -Syy && wtfutil"
alias v="nvim"
alias reload='systemctl --user daemon-reload && systemctl --user restart waybar.service'


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx

# Load completions
autoload -U compinit && compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

zinit cdreplay -q

# Enter y to use yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# ls automatically after cd
function cl () {
    cd "$@" && ls -lha --color;
}

# source /usr/share/nvm/init-nvm.sh

# figlet -f slant "Welcome User"
fastfetch

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     tmux attach || tmux new-session -s MAIN
# fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
