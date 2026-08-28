# Return if zoxide is unavailable
(( $+commands[zoxide] )) || return

# Print the selected directory before entering it
export _ZO_ECHO=1

# Ignore temporary and cache directories
export _ZO_EXCLUDE_DIRS="$HOME:$HOME/.cache/*:$HOME/.local/share/Trash/*:/tmp/*:/var/tmp/*"

# Avoid duplicate entries caused by symbolic links
export _ZO_RESOLVE_SYMLINKS=1

# Initialize zoxide
eval "$(zoxide init zsh --hook pwd)"
