# Setup

## Sync `dotfiles/` with configs

```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```

## Include custom gitconfig

In `~/.gitconfig`:

```
[include]
    path = dotfiles/.mygitconfig
```
