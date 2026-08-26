# Create a directory and enter it
mkcd() {
    if (( $# != 1 )); then
        print "Uso: mkcd <directorio>"
        return 1
    fi

    mkdir -p -- "$1" && cd -- "$1"
}

# Restart the current Zsh session
zreload() {
    exec zsh
}
