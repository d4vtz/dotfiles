# Directory listing
if (( $+commands[lsd] )); then
    alias ls='lsd'
    alias ll='lsd -l'
    alias la='lsd -a'
    alias lla='lsd -la'
    alias lt='lsd --tree'
else
    alias ll='ls -lh'
    alias la='ls -A'
    alias lla='ls -Alh'
fi

# Bat
if (( $+commands[bat] )); then
    alias b='bat'
    alias bp='bat --plain --paging=never'
    alias bcat='bat --paging=never'
fi

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Lazygit
if (( $+commands[lazygit] )); then
    alias lg='lazygit'
fi


# Disk usage
if (( $+commands[dust] )); then
    alias dus='dust -n 20'
    alias dusd='dust -D -n 20'
fi

# Filesystems
if (( $+commands[duf] )); then
    alias disks='duf --only local --sort usage'
    alias inodes='duf --only local --inodes'
fi
