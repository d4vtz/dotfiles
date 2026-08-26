# Default applications
export EDITOR='nvim'
export VISUAL="$EDITOR"
export PAGER='less'
export MANPAGER='less -R'

# Less
export LESS='-R --mouse --wheel-lines=3'

# Python
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME:-$HOME/.cache}/python"

# Development
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/ripgrep/config"
