if status is-interactive

    # ── Path ──────────────────────────────────────────────────────────────────
    fish_add_path ~/.local/bin
    fish_add_path /opt/homebrew/opt/dotnet/libexec

    # .NET (Homebrew installs to non-standard path)
    set -gx DOTNET_ROOT /opt/homebrew/opt/dotnet/libexec

    # ── Vi mode + jk escape ───────────────────────────────────────────────────
    fish_vi_key_bindings
    bind -M insert -m default jk backward-char force-repaint

    # ── Atuin (shell history) ─────────────────────────────────────────────────
    # Ctrl+R for history search; up-arrow left to fzf.fish
    atuin init fish --disable-up-arrow | source

    # ── Zoxide (smart cd) ─────────────────────────────────────────────────────
    zoxide init fish | source

    # ── Abbreviations ─────────────────────────────────────────────────────────

    # System tool replacements
    abbr -a top 'btm'
    abbr -a ps  'procs'
    abbr -a man 'tldr'

    # Git
    abbr -a g   'git'
    abbr -a ga  'git add'
    abbr -a gc  'git commit'
    abbr -a gco 'git checkout'
    abbr -a gd  'git diff'
    abbr -a gl  'git log --oneline --graph'
    abbr -a gp  'git push'
    abbr -a gs  'git status'
    abbr -a gpl 'git pull'
    abbr -a lg  'lazygit'

    # Docker
    abbr -a dk  'docker'
    abbr -a dkc 'docker compose'

    # Quick edits
    abbr -a fishrc  '$EDITOR ~/.config/fish/config.fish'
    abbr -a tmuxrc  '$EDITOR ~/.config/tmux/tmux.conf'
    abbr -a nvimrc  '$EDITOR ~/.config/nvim/'

end

# ── Yazi (cd on quit) ─────────────────────────────────────────────────────────
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd "$cwd"
    end
    rm -f -- "$tmp"
end
