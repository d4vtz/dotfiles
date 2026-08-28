# Return if fzf is unavailable
(( $+commands[fzf] )) || return

# Dracula interface
export FZF_DEFAULT_OPTS="
    --height=60%
    --layout=reverse
    --border=rounded
    --info=inline-right
    --prompt='❯ '
    --pointer='▶'
    --marker='✓'
    --cycle
    --bind='ctrl-j:down,ctrl-k:up'
    --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
    --color=fg+:#f8f8f2,bg+:#44475a,hl+:#ff79c6
    --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
    --color=marker:#f1fa8c,spinner:#8be9fd,header:#6272a4
    --color=border:#6272a4,label:#f8f8f2
"

# Ctrl+T: select files and directories
export FZF_CTRL_T_OPTS="
    --walker-skip=.git,node_modules,target,.venv,Build
    --preview='
        if test -d {}; then
            lsd --tree --depth 2 --color always {}
        else
            bat --color=always --style=numbers --line-range=:500 {}
        fi
    '
    --preview-window=right,60%,border-left
    --bind='ctrl-/:change-preview-window(hidden|right,60%|down,50%)'
    --header='Ctrl+/ cambia la vista previa'
"

# Ctrl+R: search command history
export FZF_CTRL_R_OPTS="
    --preview-window=hidden
    --header='Ctrl+R cambia el orden · Alt+R muestra contexto'
"

# Alt+C: select and enter a directory
export FZF_ALT_C_OPTS="
    --walker-skip=.git,node_modules,target,.venv,Build
    --preview='lsd --tree --depth 2 --color always {}'
    --preview-window=right,60%,border-left
"

# Completion menu
export FZF_COMPLETION_OPTS="
    --border=rounded
    --info=inline-right
"

# Use fd as the source for fzf
if (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
fi

# Official Zsh integration: completion and key bindings
source <(fzf --zsh)
