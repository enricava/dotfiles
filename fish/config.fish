set -gx GOPATH "$HOME/go"
set -gx GOBIN "$HOME/go/bin"

fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.pub-cache/bin
fish_add_path $HOME/development/flutter/bin
fish_add_path $HOME/go/bin
fish_add_path /usr/local/android-studio/bin
fish_add_path /usr/local/go/bin
fish_add_path /opt/nvim-linux64/bin
fish_add_path /opt/homebrew/bin/
fish_add_path /opt/homebrew/opt/openjdk/bin
fish_add_path /opt/homebrew/share/google-cloud-sdk/bin
fish_add_path /Applications/Obsidian.app/Contents/MacOS

# Added for flutter, cocoapods
fish_add_path /opt/homebrew/opt/ruby/bin
set -gx GEM_HOME $HOME/.gem
fish_add_path $GEM_HOME/bin
set -gx LDFLAGS -L/opt/homebrew/opt/ruby/lib
set -gx CPPFLAGS -I/opt/homebrew/opt/ruby/include

set -gx CPPFLAGS -I/opt/homebrew/opt/openjdk/include $CPPFLAGS

set -x N_PREFIX "$HOME/n"
contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin" # Added by n-install (see http://git.io/n-install-repo).

if status is-interactive
    # Helix config
    set -gx EDITOR (command -v hx)
    set -gx NODE_MODULES_GLOBAL (npm -g root)

    set -gx WORKSPACE $HOME/repos

    alias l "ls -la"
    alias v nvim

    starship init fish | source
    fzf --fish | source
    nvm -s use 22.12.0
end
