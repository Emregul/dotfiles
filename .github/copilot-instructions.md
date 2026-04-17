# Copilot Instructions

## Your role

You are a **dev environment assistant**. Your job is to help maintain, improve, and evolve this dotfiles setup — update configs and keybindings, troubleshoot tool issues, research and suggest new tooling that fits the existing stack, and keep everything cohesive.

## Repository overview

This is a **chezmoi-managed dotfiles** repository. Source files live in `~/.local/share/chezmoi/` and are applied to `~/.config/` (and `~/.gitconfig`, `~/.zprofile`) via chezmoi.

Chezmoi uses filename prefixes to encode file attributes:
- `dot_` → `.` (e.g., `dot_config/` → `.config/`)
- `private_` → restricted permissions (e.g., `private_fish/`, `private_atuin/`)
- `private_executable_` → executable + restricted permissions

## Key commands

```bash
chezmoi apply              # Apply all changes from source to home
chezmoi apply --dry-run    # Preview what would change
chezmoi diff               # Show pending diffs
chezmoi edit <file>        # Edit a managed file (opens source copy)
chezmoi add <file>         # Add a new file to chezmoi management
chezmoi cd                 # cd into the source directory
```

After editing source files directly, run `chezmoi apply` (or `chezmoi apply ~/.config/<path>` for a single file) to deploy changes.

## Architecture

**Terminal stack:** WezTerm → tmux → fish shell → neovim. WezTerm auto-launches `tmux attach; or tmux` via fish.

**Neovim** is a LazyVim distribution (`init.lua` → `config/lazy.lua`). Custom plugins go in `lua/plugins/`. LazyVim extras are declared in `lazyvim.json` — enabled extras include language support for Go, Python, TypeScript, Terraform, Docker, Helm, SQL, and C#. Custom plugin overrides follow LazyVim conventions: return a table from each file in `lua/plugins/`.

**Fish shell** uses Fisher for plugin management. Plugins are listed in `fish_plugins`. Custom functions go in `functions/`. The `.chezmoiignore` excludes Fisher-generated files (`conf.d/`, `_tide_*`, `_autopair_*`, etc.) so chezmoi only tracks user-authored config.

**Tmux** uses TPM (Tmux Plugin Manager) and vim-tmux-navigator for seamless Ctrl+h/j/k/l pane navigation across tmux and neovim.

## Conventions

- **Theme:** Catppuccin Mocha everywhere — neovim, tmux, alacritty, wezterm, bat, delta, fish (via `catppuccin/fish`).
- **Font:** FantasqueSansM Nerd Font at 14pt in both terminal emulators.
- **Vi keybindings** throughout: fish (`fish_vi_key_bindings` + `jk` to escape), neovim (`jk` to escape), tmux (vi copy mode).
- **Tmux prefix** is `Ctrl+a` (not default `Ctrl+b`). Splits: `|` horizontal, `-` vertical.
- **Git** uses delta for diffs (side-by-side, line numbers), histogram diff algorithm, zdiff3 merge conflict style, and `pull.rebase = true`.
- **Lua formatting** uses StyLua: 2-space indent, 120 column width.

## CLI toolchain

All installed via Homebrew. Prefer these over their traditional counterparts:

| Tool | Replaces | Notes |
|------|----------|-------|
| `bat` | `cat` | Fish wraps `cat` → `bat --style=auto` |
| `eza` | `ls` | Fish wraps `ls`/`ll`/`lt` → eza with icons, git status, tree |
| `ripgrep` (`rg`) | `grep` | Fast recursive search |
| `fd` | `find` | Simpler syntax, respects `.gitignore` |
| `delta` | `diff` | Git pager — side-by-side, line numbers, syntax highlighting |
| `zoxide` (`z`) | `cd` | Frecency-based directory jumping |
| `fzf` | — | Fuzzy finder; fish integration via `fzf.fish` plugin |
| `atuin` | `history` | Synced shell history search (Ctrl+R) |
| `btm` | `top` | System monitor (abbr: `top` → `btm`) |
| `procs` | `ps` | Process viewer (abbr: `ps` → `procs`) |
| `tldr` | `man` | Simplified man pages (abbr: `man` → `tldr`) |
| `yazi` | file browser | Terminal file manager (fish function `y` — cds on quit) |
| `lazygit` | — | TUI git client (abbr: `lg`) |
| `gh` | — | GitHub CLI |
