# Enable Powerlevel10k instant prompt.
# Keep this block close to the top of the file.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Directories
typeset -g ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
typeset -g ZAP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zap"
typeset -g ZAP_FILE="$ZAP_DIR/zap.zsh"

mkdir -p "$ZSH_CACHE_DIR"

# Zap plugin manager
if [[ ! -r "$ZAP_FILE" ]]; then
    print -P "%F{yellow}Zap no está instalado. Iniciando instalación...%f"

    if command -v curl >/dev/null 2>&1; then
        zsh <(
            curl -fsSL \
                https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh
        ) --branch release-v1 --keep
    else
        print -P "%F{red}Error: curl es necesario para instalar Zap.%f"
    fi
fi

if [[ -r "$ZAP_FILE" ]]; then
    source "$ZAP_FILE"
else
    print -P "%F{red}No fue posible cargar Zap.%f"
fi


# Shell behavior
setopt auto_cd
setopt interactive_comments
setopt correct
setopt no_beep
setopt extended_glob


# Plugins
if (( $+functions[plug] )); then
    plug "zsh-users/zsh-completions"
    plug "zsh-users/zsh-autosuggestions"
    plug "romkatv/powerlevel10k"
fi

# Completion
autoload -Uz compinit
compinit -d "$ZSH_CACHE_DIR/zcompdump"
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR/completion"

unsetopt menu_complete
setopt auto_menu

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:*:*:*:processes' command \
    'ps -u "$USER" -o pid,user,comm -w -w'


# Key bindings
bindkey -e
bindkey '^ ' autosuggest-accept
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# History
HISTFILE="$ZSH_CACHE_DIR/history"
HISTSIZE=50000
SAVEHIST=10000

setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_save_no_dups
setopt hist_verify

# Zoxide
if (( $+commands[zoxide] )); then
    eval "$(zoxide init zsh)"
fi

# Exports
[[ -r "$ZDOTDIR/exports.zsh" ]] &&
    source "$ZDOTDIR/exports.zsh"

# Aliases
[[ -r "$ZDOTDIR/alias.zsh" ]] &&
    source "$ZDOTDIR/alias.zsh"

# Functions
[[ -r "$ZDOTDIR/functions.zsh" ]] &&
    source "$ZDOTDIR/functions.zsh"

# Fuzzy finder
[[ -r "$ZDOTDIR/fzf.zsh" ]] &&
    source "$ZDOTDIR/fzf.zsh"

# Powerlevel10k configuration
[[ -r "$ZDOTDIR/.p10k.zsh" ]] &&
    source "$ZDOTDIR/.p10k.zsh"

# Locales
[[ -r "$ZDOTDIR/local.zsh" ]] &&
    source "$ZDOTDIR/local.zsh"

# Syntax highlighting must be loaded last
if (( $+functions[plug] )); then
    plug "zsh-users/zsh-syntax-highlighting"
fi
