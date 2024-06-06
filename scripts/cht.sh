#!/bin/bash

languages=`echo "bash c cpp docker erlang golang kubectl lua java javascript python r rust tmux typescript vim nvim zig" | tr ' ' '\n'`
utils=`echo "awk cmake cp curl gcc gdb git find fzf make mv sed tar wget" | tr ' ' '\n'`

selected=`printf "$languages\n$utils" | fzf --header-first --header $'Cheats' --layout=reverse --border`
read -p "query: " query

if printf "$languages" | grep -qs $selected; then
  printf "http://cheat.sh/$selected/`echo $query | tr ' ' '+'`"
  tmux neww bash -c "curl cheat.sh/$selected/`echo $query | tr ' ' '+'`?style=monokai & read"
else
  printf "http://cheat.sh/$selected~$query & read"
  tmux neww bash -c "curl cheat.sh/$selected~$query?style=monokai & read"
fi
