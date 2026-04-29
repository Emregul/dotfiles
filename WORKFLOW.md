# Workflow Improvements Guide

Everything below was just installed. Here's how to actually use it day-to-day.

---

## Git

### Branch management is now effortless

```bash
git branch              # Most recently worked-on branches at the top
git fetch               # Stale remote branches auto-cleaned
git tag                 # Tags sorted by version number (v1.2 before v1.10)
```

### Safer force pushes

After rebasing a feature branch:

```bash
git please              # Instead of git push --force
```

If someone else pushed to the same branch since your last fetch, this aborts instead of silently destroying their work.

### Clean PR history with fixup

You're working on a PR and notice commit `abc123` has a bug:

```bash
git add -p              # Stage your fix
git fixup abc123        # Creates a fixup commit targeting that SHA
git rebase -i --autosquash main   # Fixup auto-squashes into the right place
```

This replaces manually reordering and squashing in interactive rebase.

---

## Tmux

### tmux-thumbs: Copy anything in 2 keystrokes

Press **Ctrl+a F** to activate. Every URL, file path, git SHA, IP address, and hex color in the visible pane gets a colored letter hint overlaid on it.

Press the hint letter → it's on your clipboard.

**When to use it:**
- Copy a git SHA from `git log` output
- Grab a URL from CLI tool output
- Copy a file path from an error message
- Snag a container ID from `docker ps`

### extrakto: Fuzzy search your pane

Press **Ctrl+a e** to activate. Opens an fzf window over all text in the current pane and scrollback.

Start typing to fuzzy-match → hit Enter → it's on your clipboard.

**When to use it:**
- "I saw a container ID scroll by 30 lines ago"
- Grabbing text that's no longer visible without scrolling
- When you know roughly what the text contains but can't see it

**Rule of thumb:** Use thumbs when you can see the text. Use extrakto when you need to search for it.

### smart-splits: Unified navigation + resizing

Navigation between neovim splits and tmux panes:

| Keys | Action |
|------|--------|
| Ctrl+h/j/k/l | Move between splits/panes (works across neovim ↔ tmux seamlessly) |
| Alt+h/j/k/l | Resize the current split/pane (also works across neovim ↔ tmux) |

The resize bindings are new — previously Alt+h/j/k/l only resized within neovim. Now they resize tmux panes too when you're at the edge.

---

## Fish Shell

### Long-running command notifications

The `done` plugin is passive — you don't do anything. When any command takes longer than 10 seconds, macOS sends a notification banner automatically.

**Workflow change:** Stop Cmd+Tab-ing back to check if your build finished. Just wait for the notification.

Customize the threshold:

```fish
set -U done_notification_threshold 5    # Notify after 5 seconds instead of 10
```

### Navi cheatsheets

Press **Ctrl+G** anywhere in fish. A fuzzy-searchable cheatsheet opens with community-maintained commands for docker, git, kubectl, terraform, and more.

**Example flow:**
1. You need to remove all stopped docker containers but forget the exact command
2. Press Ctrl+G
3. Type "docker remove stopped"
4. Select the match → it fills your command line
5. Edit any variables if needed, press Enter

You can also type a partial command first, then press Ctrl+G — navi will try to match and complete it.

### New abbreviations

Type the abbreviation, then press Space — it expands to the full command in your prompt.

```
cz  → chezmoi
cza → chezmoi apply
czd → chezmoi diff
cze → chezmoi edit

dkps → docker ps
dkl  → docker logs -f
```

Combine with arguments: `cze ~/.config/fish/config.fish` expands to `chezmoi edit ~/.config/fish/config.fish`.

---

## Neovim

### mini-files: Filesystem as a buffer

Open with **`<leader>fm`** (Space, f, m).

A tiny floating window appears showing the current directory. It's a normal neovim buffer:

| Action | How |
|--------|-----|
| Rename a file | Edit the filename text directly |
| Create a file | Type a new filename on a new line |
| Delete a file | Delete the line |
| Move a file | Cut the line, navigate to another directory, paste |
| Go into a directory | Press Enter on it |
| Go up a directory | Press `-` |
| Confirm changes | Save the buffer (`:w`) |

**When to use it instead of neo-tree:**
- Quick renames (just edit the text, no menus)
- Batch renames (use neovim's normal editing — visual block, substitute, macros)
- Creating multiple files at once (type multiple lines, save)
- Moving files between directories (yank/paste lines)

Neo-tree is still there for browsing. Reach for mini-files when you need to **do** something to files quickly.

---

## CLI Tools

### jq — JSON Swiss Army Knife

```bash
# Pretty-print JSON
curl -s https://api.github.com/repos/Emregul/dotfiles | jq .

# Extract specific fields
docker inspect <container> | jq '.[0].NetworkSettings.IPAddress'

# Filter arrays
gh api repos/Emregul/dotfiles/pulls | jq '.[] | {title, state, user: .user.login}'

# Count items
kubectl get pods -o json | jq '.items | length'
```

### hyperfine — Benchmark anything

```bash
# Benchmark a single command (runs 10+ times, gives statistics)
hyperfine 'fd -e js'

# Compare two approaches
hyperfine 'find . -name "*.js"' 'fd -e js'

# With warmup runs (for disk cache)
hyperfine --warmup 3 'cargo build'
```

### dust — Where's my disk space?

```bash
# Current directory breakdown (visual bar chart)
dust

# Specific directory
dust ~/Workspace

# Only show top 10
dust -n 10

# Reverse sort (smallest first)
dust -r
```

### navi — Interactive cheatsheets (Ctrl+G)

Beyond the Ctrl+G binding, you can also use it directly:

```bash
# Browse all cheatsheets
navi

# Search a specific topic
navi --query docker

# Add your own cheatsheets
navi repo add https://github.com/denisidoro/cheats
```

---

## Setup Checklist

- [x] Git config applied (automatic via chezmoi)
- [x] Fish plugins installed (done, navi widget)
- [x] Fish abbreviations active (restart fish or `source ~/.config/fish/config.fish`)
- [x] CLI tools installed (jq, hyperfine, dust, navi)
- [x] Neovim plugins updated (mini-files, smart-splits only)
- [ ] **Tmux plugins: press `Ctrl+a I` (capital I) in tmux** to install thumbs, extrakto, and smart-splits tmux-side
- [ ] **tmux-thumbs will ask to compile** — pick option 1 (Compile) now that Rust is installed
- [ ] Restart tmux after plugin install: `tmux kill-server && tmux`
