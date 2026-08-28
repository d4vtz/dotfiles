# Create a directory and enter it
mkcd() {
    if (( $# != 1 )); then
        print "Uso: mkcd <directorio>"
        return 1
    fi

    mkdir -p -- "$1" && cd -- "$1"
}

# Display command help with syntax highlighting
help() {
    if (( $# == 0 )); then
        print "Uso: help <comando> [argumentos]"
        return 1
    fi

    "$@" --help 2>&1 |
        bat --plain --language=help
}

# Pretty-print a JSON file
jsonpp() {
    if (( $# != 1 )); then
        print "Uso: jsonpp <archivo.json>"
        return 1
    fi

    jq '.' -- "$1"
}

# Pretty-print a YAML file
yamlpp() {
    if (( $# != 1 )); then
        print "Uso: yamlpp <archivo.yaml>"
        return 1
    fi

    yq eval --prettyPrint '.' "$1"
}

# Restart the current Zsh session
zreload() {
    exec zsh
}
