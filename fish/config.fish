set -gx DOTFILES "$HOME/dotfiles"
set -gx MY_REPOS "$HOME/repos/enricava"

fish_add_path $HOME/.local/bin
fish_add_path /opt/nvim-linux64/bin
fish_add_path /usr/local/android-studio/bin
fish_add_path $HOME/development/flutter/bin
fish_add_path /usr/local/go/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.pub-cache/bin

set -x N_PREFIX "$HOME/n"
contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).

if status is-interactive
    set -gx EDITOR hx

    alias l "ls -la"
    alias v nvim
    alias vim nvim

    starship init fish | source
    fzf --fish | source
    nvm -s use 22.11.0
end
