# Setup

Dear future me, I did not track all of the dependencies, but some are:

- `nvim 0.10.0` - check `.mybashrc` for path
- `fzf`, `ripgrep`
- `npm`
- `clang`
- `go` - binaries are added to path in `.mybashrc`
- `rust` - some stuff goes in path as well
- `python` - needs `venv` to be installed

In `Mason`, `markdownlint` needs to be installed.

## Sync `dotfiles/` with configs

```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/.mybashrc ~/.mybashrc
```

## Include custom gitconfig

In `~/.gitconfig`:

```md
[include]
    path = dotfiles/.mygitconfig
```
