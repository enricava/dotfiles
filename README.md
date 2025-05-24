# Setup

Dear future me, I did not track all of the dependencies, but some are:

- `fish`
- `zellij`
- `fzf`, `ripgrep`, `fd` - nice to haves.
- `go` install `delve` for dap config
- `rust`.

Neovim only:

- `nvim 0.10.0`
- `python` - needs `venv` to be installed.
- `clang` - use it to build a nvim telescope extension (probably already
have it anyway)
- `npm`

In `Mason`, `markdownlint` needs to be installed.

## Change bashrc to fish

I used `chsh`

## Sync `dotfiles/` with configs

TODO: I should fix this script to be smarter

```bash
./setup.sh
```

## Include custom gitconfig

In `~/.gitconfig`:

```md
[include]
    path = dotfiles/.mygitconfig
```
