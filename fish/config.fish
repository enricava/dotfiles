set -gx DOTFILES "$HOME/dotfiles"
set -gx MY_REPOS "$HOME/repos/enricava"

fish_add_path $HOME/.local/bin
fish_add_path /opt/nvim-linux64/bin
fish_add_path /usr/local/android-studio/bin
fish_add_path /usr/bin/flutter/bin
fish_add_path $HOME/go/bin

if status is-interactive
    alias l "ls -la"
    alias ll "ls -la"

    alias dotfiles "cd $DOTFILES"
    alias myrepos "cd $MY_REPOS"

    alias v 'nvim'
    alias vim 'nvim'

    function y
      set tmp (mktemp -t "yazi-cwd.XXXXXX")
      yazi $argv --cwd-file="$tmp"
      if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
      end
      rm -f -- "$tmp"
    end

    starship init fish | source
    fzf --fish | source
end
