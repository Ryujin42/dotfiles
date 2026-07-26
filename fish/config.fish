if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ll 'exa -l --icons'
alias l "ll -a"
alias ff 'fastfetch'
alias ssh 'env TERM=xterm-256color ssh'

function fish_greeting 
    fastfetch
end

function mkcd
    mkdir $argv
    cd $argv
end

set -x PATH $PATH ~/.local/bin/

bind \cS "tmux-sessionizer"

alias cd 'z'

zoxide init fish | source


# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/ryujin/.lmstudio/bin
# End of LM Studio CLI section

