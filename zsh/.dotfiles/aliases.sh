alias cat='/usr/local/bin/bat --theme=DarkNeon --style=full'
alias c='/usr/local/bin/code'
alias g='git status'
alias df='duf'
alias du='dust'
alias tree='br'
alias k='kubectl'
alias kp='kubectl -n platform'

function activate() { source $1/bin/activate }

function ordevice() {
    open "https://live.touchsurgery.com/admin/core/ordevice/?q=$1"
}

