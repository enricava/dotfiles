function repos
    if not set -q WORKSPACE
        echo "Set WORKSPACE env variable."
        return 1
    end

    set -l repo (fd --hidden --max-depth 5 '^\.git$' $WORKSPACE \
        | string replace -r '/\.git/?$' '' \
        | string replace "$WORKSPACE/" '' \
        | fzf --bind 'tab:down,shift-tab:up' \
              --height 40% \
              --reverse \
              --prompt 'repo > ' \
              --preview "bat --color=always --style=plain $WORKSPACE/{}/README.md 2>/dev/null; or git -C $WORKSPACE/{} log --oneline --color=always -15" \
              --preview-window 'right:50%')

    if test -n "$repo"
        cd $WORKSPACE/$repo
    end
end
