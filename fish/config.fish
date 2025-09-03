if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias l 'exa -l --icons'
alias ll "l -a"
alias ff 'fastfetch'

function fish_greeting 
    fastfetch
end

set -x PATH $PATH ~/.local/bin/

bind \cS "tmux-sessionizer"

alias cd 'z'

zoxide init fish | source

