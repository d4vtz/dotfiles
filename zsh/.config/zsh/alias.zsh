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

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
