# Default applications
export EDITOR='nvim'
export VISUAL="$EDITOR"
export PAGER='less'

# Bat
if (( $+commands[bat] )); then
    export MANPAGER='bat --plain --language=man'
    export MANROFFOPT='-c'
else
    export MANPAGER='less -R'
fi

# Less
export LESS='-R --mouse --wheel-lines=3'

# Python
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME:-$HOME/.cache}/python"

# Development
typeset -g RIPGREP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ripgrep/config"
if [[ -r "$RIPGREP_CONFIG" ]]; then
    export RIPGREP_CONFIG_PATH="$RIPGREP_CONFIG"
fi
unset RIPGREP_CONFIG

