# Neovim Workflow Cheatsheet

Based on your LazyVim config with Snacks picker, smart-splits, harpoon2, flash, yanky, mini-files, gitsigns, trouble, and language extras for Go, Python, TypeScript, Terraform, Docker, C#, and more.

`<leader>` = Space. `jk` = Escape from insert mode.

---

## 1. Finding Files & Text

### Quick Access (the ones you'll use 50x/day)

| Keys | Action |
|------|--------|
| `<leader><space>` | **Find files** (project root) |
| `<leader>/` | **Live grep** (project root) — search file contents |
| `<leader>,` | **Open buffers** — switch between open files |
| `<leader>:` | Command history |
| `<leader>fr` | Recent files |
| `<leader>fp` | **Projects** — switch between workspace dirs |

### Find Variations

| Keys | Action |
|------|--------|
| `<leader>ff` | Find files (root) |
| `<leader>fF` | Find files (cwd — current directory, not project root) |
| `<leader>fg` | Find files (git-tracked only) |
| `<leader>fR` | Recent files (cwd only) |
| `<leader>fc` | Find config files (nvim config) |
| `<leader>fn` | New file |

### Grep Variations

| Keys | Action |
|------|--------|
| `<leader>sg` | Grep (root) |
| `<leader>sG` | Grep (cwd) |
| `<leader>sb` | Search lines in current buffer |
| `<leader>sB` | Grep across all open buffers |
| `<leader>sw` | Grep word under cursor or visual selection (root) |
| `<leader>sW` | Grep word under cursor or visual selection (cwd) |

**Tip:** In any Snacks picker, press `Alt+c` to toggle between project root and cwd.

---

## 2. Code Navigation (LSP)

These work in any file with an LSP server attached (Go, Python, TS, C#, etc.).

### Go To

| Keys | Action |
|------|--------|
| `gd` | **Go to definition** — the most used. Jump to where a symbol is defined |
| `gr` | **References** — find all usages of a symbol across the project |
| `gI` | Go to implementation (interfaces → concrete types) |
| `gy` | Go to type definition (see the type of a variable) |
| `gD` | Go to declaration |
| `K` | **Hover** — show docs/type info in a floating window |
| `gK` | Signature help (function parameters) |

### Navigate References (word highlighting)

When your cursor is on a symbol, all matching references in the file get highlighted automatically.

| Keys | Action |
|------|--------|
| `]]` | Jump to next reference of current word |
| `[[` | Jump to previous reference of current word |
| `Alt+n` | Next reference (wraps around) |
| `Alt+p` | Previous reference (wraps around) |

### Call Hierarchy

| Keys | Action |
|------|--------|
| `gai` | **Incoming calls** — what calls this function? |
| `gao` | **Outgoing calls** — what does this function call? |

### Symbols

| Keys | Action |
|------|--------|
| `<leader>ss` | **LSP symbols** in current file (functions, classes, variables) |
| `<leader>sS` | **Workspace symbols** — search across entire project |
| `<leader>cs` | Symbols sidebar (Trouble) — persistent symbol outline |
| `<leader>cS` | LSP references/definitions panel (Trouble) |

---

## 3. Code Actions & Refactoring

| Keys | Action |
|------|--------|
| `<leader>ca` | **Code action** — fix, refactor, extract (context-dependent) |
| `<leader>cr` | **Rename symbol** — renames across all files |
| `<leader>cR` | Rename file (updates imports) |
| `<leader>cf` | Format file/selection |
| `<leader>co` | Organize imports |
| `<leader>cA` | Source action |
| `<leader>cm` | Mason — manage LSP servers, formatters, linters |

### Inc-Rename (your extra)

When you trigger `<leader>cr`, inc-rename shows a live preview of the rename across the buffer as you type.

---

## 4. Diagnostics & Errors

| Keys | Action |
|------|--------|
| `<leader>cd` | Show diagnostics for current line (floating window) |
| `]d` / `[d` | Next / previous diagnostic |
| `]e` / `[e` | Next / previous **error** (skip warnings) |
| `]w` / `[w` | Next / previous **warning** |
| `<leader>xx` | **Diagnostics list** (Trouble) — all project diagnostics |
| `<leader>xX` | Buffer diagnostics only (Trouble) |
| `<leader>sd` | Diagnostics picker (fuzzy search) |
| `<leader>sD` | Buffer diagnostics picker |

---

## 5. Flash — Jump Anywhere

Flash replaces the built-in search with labeled jumps.

| Keys | Action |
|------|--------|
| `s` | **Flash jump** — type characters, labels appear, press label to jump |
| `S` | **Flash treesitter** — select treesitter nodes (functions, blocks, etc.) |
| `Ctrl+Space` | **Incremental selection** — expand selection by treesitter node, `Backspace` to shrink |
| `Ctrl+s` | Toggle flash in search mode (`/` or `?`) |

### Flash workflow

1. Press `s`
2. Type 1-2 characters of your target
3. Colored labels appear on all matches
4. Press the label letter to jump there

This replaces `f`/`t` for same-line jumps AND `/` for cross-screen jumps. It's faster than both.

---

## 6. Buffers (Open Files)

Buffers are your open files. The tabline at the top shows them.

### Switching

| Keys | Action |
|------|--------|
| `Shift+h` | Previous buffer |
| `Shift+l` | Next buffer |
| `<leader>,` | Buffer picker (fuzzy search open buffers) |
| `<leader>bb` | Switch to last buffer (toggle between two files) |
| `` <leader>` `` | Same as above |
| `<leader>bj` | **Pick buffer** — labels appear on each tab, press to jump |

### Managing

| Keys | Action |
|------|--------|
| `<leader>bd` | Delete buffer (close file) |
| `<leader>bo` | Delete **other** buffers (keep only current) |
| `<leader>bD` | Delete buffer AND window |
| `<leader>bp` | Pin buffer |
| `<leader>bP` | Close all non-pinned buffers |
| `<leader>br` | Close buffers to the right |
| `<leader>bl` | Close buffers to the left |
| `[B` / `]B` | Move buffer left / right in tabline |

---

## 7. Harpoon — Pin Your Key Files

Harpoon lets you mark files you keep jumping back to (e.g., the handler, the model, and the test). Way faster than fuzzy finding when you're bouncing between 3-5 files.

| Keys | Action |
|------|--------|
| `<leader>H` | **Add current file** to harpoon list |
| `<leader>h` | **Open harpoon menu** — see all marked files |
| `<leader>1` through `<leader>9` | **Jump to harpooned file** by number |

### Harpoon workflow

1. Open your main files, press `<leader>H` on each
2. Now `<leader>1` = first file, `<leader>2` = second, etc.
3. Use `<leader>h` to reorder or remove files
4. Harpoon saves per-project — it remembers when you reopen

---

## 8. Windows & Splits

### Creating

| Keys | Action |
|------|--------|
| `<leader>\|` | Split window right (vertical) |
| `<leader>-` | Split window below (horizontal) |
| `<leader>wd` | Close window |
| `<leader>wm` | **Toggle maximize** current window (zoom) |

### Navigating (smart-splits — works across nvim and tmux)

| Keys | Action |
|------|--------|
| `Ctrl+h` | Move to left split/pane |
| `Ctrl+j` | Move to split/pane below |
| `Ctrl+k` | Move to split/pane above |
| `Ctrl+l` | Move to right split/pane |

### Resizing (smart-splits)

| Keys | Action |
|------|--------|
| `Alt+h` | Resize left |
| `Alt+j` | Resize down |
| `Alt+k` | Resize up |
| `Alt+l` | Resize right |

These resize bindings work seamlessly across neovim splits and tmux panes.

---

## 9. Tabs

Tabs are separate workspaces (each tab can have its own split layout). Use them when working on unrelated tasks simultaneously.

| Keys | Action |
|------|--------|
| `<leader><tab><tab>` | New tab |
| `<leader><tab>d` | Close tab |
| `<leader><tab>]` | Next tab |
| `<leader><tab>[` | Previous tab |
| `<leader><tab>f` | First tab |
| `<leader><tab>l` | Last tab |
| `<leader><tab>o` | Close other tabs |

---

## 10. File Explorer & File Management

### Neo-tree (sidebar explorer)

| Keys | Action |
|------|--------|
| `<leader>e` | Toggle file explorer (root) |
| `<leader>E` | Toggle file explorer (cwd) |

Inside neo-tree: `a` = add file, `d` = delete, `r` = rename, `c` = copy, `m` = move, `y` = copy path.

### Mini-files (floating file editor)

| Keys | Action |
|------|--------|
| `<leader>fm` | Open mini-files at current file's directory |
| `<leader>fM` | Open mini-files at cwd |

Inside mini-files:

| Keys | Action |
|------|--------|
| `Enter` | Open file / enter directory |
| `-` | Go up a directory |
| `g.` | Toggle hidden files |
| `gc` | Set cwd to current directory |
| `Ctrl+w s` | Open in horizontal split |
| `Ctrl+w v` | Open in vertical split |
| Edit text | Rename file (just change the filename text) |
| New line | Create new file |
| Delete line | Delete file |
| `:w` | **Confirm all changes** |

---

## 11. Git

### Lazygit

| Keys | Action |
|------|--------|
| `<leader>gg` | **Open lazygit** (root) — full TUI git client |
| `<leader>gG` | Open lazygit (cwd) |

### Git Pickers

| Keys | Action |
|------|--------|
| `<leader>gs` | Git status (changed files picker) |
| `<leader>gd` | Git diff (hunks) |
| `<leader>gD` | Git diff vs origin |
| `<leader>gl` | Git log |
| `<leader>gL` | Git log (cwd) |
| `<leader>gf` | Current file history |
| `<leader>gb` | Blame line (picker) |
| `<leader>gS` | Git stash |
| `<leader>gB` | Open in GitHub browser |
| `<leader>gY` | Copy GitHub URL |
| `<leader>gi` | GitHub issues |
| `<leader>gp` | GitHub pull requests |

### Gitsigns (inline git)

Your config has inline blame enabled (shows author + date at end of each line).

| Keys | Action |
|------|--------|
| `]h` / `[h` | Next / previous git hunk |
| `]H` / `[H` | Last / first hunk |
| `<leader>ghs` | **Stage hunk** |
| `<leader>ghr` | Reset hunk |
| `<leader>ghS` | Stage entire buffer |
| `<leader>ghu` | Undo stage hunk |
| `<leader>ghR` | Reset entire buffer |
| `<leader>ghp` | Preview hunk inline |
| `<leader>ghb` | Blame line (full detail) |
| `<leader>ghB` | Blame entire buffer |
| `<leader>ghd` | Diff this file |
| `<leader>ghD` | Diff against `~` (previous commit) |
| `ih` | **Hunk text object** — select a hunk in visual/operator mode |

---

## 12. Yank & Paste (Yanky)

Yanky gives you a yank ring — paste history like a clipboard manager.

| Keys | Action |
|------|--------|
| `<leader>p` | **Open yank history** — fuzzy search all past yanks |
| `p` / `P` | Paste after/before (enhanced — goes through yanky) |
| `[y` / `]y` | **Cycle through yank history** after pasting |
| `]p` / `[p` | Paste with auto-indent (linewise) |
| `>p` / `<p` | Paste and indent right/left |

### Yank cycling workflow

1. Yank several things (lines, words, blocks)
2. Paste with `p`
3. Wrong thing? Press `[y` to cycle to the previous yank
4. Keep pressing `[y` / `]y` until you get the right one

---

## 13. Search & Replace

| Keys | Action |
|------|--------|
| `<leader>sr` | **Search and replace** (grug-far) — multi-file search/replace with preview |
| `n` / `N` | Next / previous search result (always goes forward/backward regardless of `/` or `?`) |
| `*` | Search word under cursor (vim built-in) |
| `#` | Search word under cursor (reverse) |

### grug-far workflow

1. `<leader>sr` opens the search/replace panel
2. Type search pattern, optionally replacement
3. Preview all matches across files
4. Apply selectively or all at once

---

## 14. Todo Comments

| Keys | Action |
|------|--------|
| `]t` / `[t` | Next / previous TODO/FIXME/HACK comment |
| `<leader>xt` | Todo list (Trouble) |
| `<leader>xT` | TODO + FIX + FIXME only (Trouble) |
| `<leader>st` | Todo picker (fuzzy search) |
| `<leader>sT` | TODO/FIX/FIXME picker |

---

## 15. Editing Essentials

### Moving Lines

| Keys | Action |
|------|--------|
| `Alt+j` / `Alt+k` | Move line down/up (normal, insert, and visual mode) |

### Indenting

| Keys | Action |
|------|--------|
| `>` / `<` (visual) | Indent/outdent — **stays in visual mode** so you can repeat |

### Commenting

| Keys | Action |
|------|--------|
| `gcc` | Toggle comment on current line |
| `gc` (visual) | Toggle comment on selection |
| `gco` | Add comment below current line |
| `gcO` | Add comment above current line |

### Surround (mini.surround)

| Keys | Action |
|------|--------|
| `gsa` | **Add** surrounding (e.g., `gsaiw"` wraps word in quotes) |
| `gsd` | **Delete** surrounding |
| `gsr` | **Replace** surrounding |

### Undo

| Keys | Action |
|------|--------|
| `u` | Undo |
| `Ctrl+r` | Redo |
| `<leader>su` | **Undo tree** — visual undo history, browse and restore any state |

---

## 16. Toggle Options

| Keys | Action |
|------|--------|
| `<leader>uf` | Toggle auto-format on save |
| `<leader>us` | Toggle spell check |
| `<leader>uw` | Toggle word wrap |
| `<leader>ul` | Toggle line numbers |
| `<leader>uL` | Toggle relative line numbers |
| `<leader>ud` | Toggle diagnostics |
| `<leader>uh` | Toggle inlay hints |
| `<leader>ug` | Toggle indent guides |
| `<leader>uz` | **Zen mode** — distraction-free editing |
| `<leader>uZ` | Toggle zoom (maximize current window) |
| `<leader>uD` | Toggle dim (dim inactive code) |

---

## 17. Terminal

| Keys | Action |
|------|--------|
| `Ctrl+/` | **Toggle floating terminal** (root dir) |
| `<leader>ft` | Terminal (root dir) |
| `<leader>fT` | Terminal (cwd) |

---

## 18. Miscellaneous Useful

| Keys | Action |
|------|--------|
| `<leader>l` | Open Lazy plugin manager |
| `<leader>qq` | Quit all |
| `Ctrl+s` | Save file (works in normal, insert, visual) |
| `<leader>?` | Show all buffer keymaps (which-key) |
| `<leader>sk` | Search all keymaps |
| `<leader>sh` | Search help pages |
| `<leader>sm` | Search marks |
| `<leader>sj` | Search jump list |
| `<leader>s"` | Search registers |
| `<leader>sR` | **Resume** last picker (continue where you left off) |
| `<leader>n` | Notification history |
| `<leader>un` | Dismiss all notifications |

---

## Confidence Assessment

- **High confidence:** All keymaps sourced directly from LazyVim source code (commit `83d90f3`) and your custom config files. These are accurate for LazyVim v8.
- **Note:** Some LSP keymaps (like `gd` for C#) are overridden by your OmniSharp autocmd in `autocmds.lua` — this is intentional for better C# goto-definition support.
- **Note:** The Snacks picker is the default in your config (LazyVim v8 uses Snacks picker by default). If you previously used Telescope, the keymaps are the same but the UI is Snacks.

## Footnotes

[^1]: LazyVim keymaps source: [`lua/lazyvim/config/keymaps.lua`](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)
[^2]: LSP keymaps: [`lua/lazyvim/plugins/lsp/init.lua`](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/lsp/init.lua) — `servers["*"].keys`
[^3]: Snacks picker keymaps: [`lua/lazyvim/plugins/extras/editor/snacks_picker.lua`](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/editor/snacks_picker.lua)
[^4]: Editor plugins (flash, gitsigns, trouble, todo): [`lua/lazyvim/plugins/editor.lua`](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/editor.lua)
[^5]: Harpoon2 extra: [`lua/lazyvim/plugins/extras/editor/harpoon2.lua`](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/editor/harpoon2.lua)
[^6]: Mini-files extra: [`lua/lazyvim/plugins/extras/editor/mini-files.lua`](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/editor/mini-files.lua)
[^7]: Yanky extra: [`lua/lazyvim/plugins/extras/coding/yanky.lua`](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/coding/yanky.lua)
[^8]: UI plugins (bufferline, noice): [`lua/lazyvim/plugins/ui.lua`](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/ui.lua)
[^9]: Your custom smart-splits config: `dot_config/nvim/lua/plugins/smart-splits.lua`
[^10]: Your custom gitsigns config (inline blame): `dot_config/nvim/lua/plugins/gitsigns.lua`
[^11]: Your custom keymaps (`jk` escape): `dot_config/nvim/lua/config/keymaps.lua`
