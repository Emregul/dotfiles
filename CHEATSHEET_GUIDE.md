# Cheatsheet Builder Guide

Create beautiful Catppuccin Mocha-themed HTML cheatsheets for any tool.
Use this as a manual reference or paste it to Copilot as a prompt.

---

## Quick Start

Copy `cheatsheet.html` and modify the data. The architecture is:

```
header  →  title + subtitle + leader-badge legend
controls  →  search box + category filter buttons
grid  →  cards (one per section)
  card  →  card-header (icon + title) + card-body (rows) + optional tip
script  →  search + filter logic
```

---

## How to Add a Card

Each card is a `<div class="card cat-CATEGORY" data-category="CATEGORY">`:

```html
<div class="card cat-nav" data-category="nav">
  <div class="card-header"><span class="card-icon">🧭</span> Section Title</div>
  <div class="card-body">
    <div class="row">
      <div class="key-col"><kbd>Ctrl</kbd><span class="key-plus">+</span><kbd>a</kbd></div>
      <div class="desc-col">Description of what this does</div>
    </div>
    <div class="row">
      <div class="key-col"><kbd class="leader">prefix</kbd><kbd>w</kbd></div>
      <div class="desc-col"><strong>Important action</strong> — extra detail</div>
    </div>
    <div class="separator"><span>Sub-section</span></div>
    <div class="row">
      <div class="key-col"><kbd>g</kbd><kbd>d</kbd></div>
      <div class="desc-col">Another keybinding</div>
    </div>
  </div>
  <div class="tip">💡 Pro tip goes here</div>
</div>
```

### Key patterns

| Pattern | HTML | Renders as |
|---------|------|------------|
| Single key | `<kbd>g</kbd>` | `g` |
| Key sequence | `<kbd>g</kbd><kbd>d</kbd>` | `g` `d` |
| Modifier combo | `<kbd>Ctrl</kbd><span class="key-plus">+</span><kbd>a</kbd>` | `Ctrl + a` |
| Leader prefix | `<kbd class="leader">SPC</kbd><kbd>f</kbd>` | `SPC` (yellow) `f` |
| Bold action | `<strong>Jump to def</strong>` | **Jump to def** |
| Separator | `<div class="separator"><span>Label</span></div>` | ── Label ── |
| Tip footer | `<div class="tip">text</div>` | italic hint bar |

---

## Categories & Colors

Categories control the left-border color and filter buttons. Built-in:

| Category | CSS class | Color | Suggested use |
|----------|-----------|-------|---------------|
| `find` | `cat-find` | Blue | Search, grep, fuzzy find |
| `nav` | `cat-nav` | Mauve/Purple | Navigation, movement |
| `code` | `cat-code` | Green | LSP, completion, refactor |
| `diag` | `cat-diag` | Red | Errors, diagnostics, debug |
| `git` | `cat-git` | Peach/Orange | Git operations |
| `edit` | `cat-edit` | Yellow | Text manipulation, yank |
| `file` | `cat-file` | Teal | File/buffer/window mgmt |
| `ui` | `cat-ui` | Sky/Cyan | Toggles, settings, UI |

### Adding a new category

1. Add a CSS rule:
```css
.cat-NEWCAT .card-header { color: var(--pink); border-left: 3px solid var(--pink); }
```

2. Add a filter button in the controls div:
```html
<button class="filter-btn" data-cat="NEWCAT">New Category</button>
```

3. Use `data-category="NEWCAT"` on your cards.

---

## Creating a Cheatsheet for a New Tool

### Step 1 — Copy the template

```bash
cp cheatsheet.html tmux-cheatsheet.html
```

### Step 2 — Update the header

```html
<h1>tmux Cheatsheet</h1>
<p><span class="leader-badge">prefix = Ctrl+a</span> ...</p>
```

### Step 3 — Choose categories

Pick 4-8 categories that map to the tool's workflow areas. Examples:

| Tool | Categories |
|------|-----------|
| **tmux** | session, window, pane, copy, plugin |
| **fish** | nav, edit, history, abbr, plugin |
| **git** | stage, commit, branch, remote, log, stash |
| **WezTerm** | tab, pane, copy, font, workspace |

### Step 4 — Populate cards

One card per logical section. Keep rows to 5-12 per card (split if larger).
Use `<strong>` for the most important bindings beginners should learn first.
Add `<div class="tip">` for workflow advice.

### Step 5 — Update filter buttons

Replace the `<button class="filter-btn">` elements to match your categories.

---

## Copilot Prompt Template

Paste this to Copilot to auto-generate a cheatsheet:

```
Create an HTML cheatsheet for [TOOL] using the exact same design system
as my neovim cheatsheet.html in the dotfiles repo. Requirements:

1. Use the Catppuccin Mocha theme (same CSS variables)
2. Same card-based grid layout with search and category filters
3. Title: "[TOOL] Cheatsheet"
4. Leader badge: show the prefix/leader key
5. Categories: [LIST YOUR CATEGORIES]
6. Base the keybindings on my actual config at:
   ~/.local/share/chezmoi/dot_config/[TOOL_CONFIG_PATH]
7. Include tips for workflow patterns
8. Keep it print-friendly
9. Save to ~/.local/share/chezmoi/[tool]-cheatsheet.html
```

---

## Available Catppuccin Colors

All colors from the Mocha palette are in CSS variables:

```
--blue      #89b4fa    --mauve     #cba6f7
--sapphire  #74c7ec    --pink      #f5c2e7
--sky       #89dceb    --flamingo  #f2cdcd
--teal      #94e2d5    --rosewater #f5e0dc
--green     #a6e3a1    --red       #f38ba8
--yellow    #f9e2af    --maroon    #eba0ac
--peach     #fab387    --lavender  #b4befe
```

Surface colors for backgrounds: `--base`, `--mantle`, `--crust`, `--surface0/1/2`
Text colors: `--text`, `--subtext0/1`, `--overlay0/1`

---

## Features Built Into the Template

- **Search**: type to filter rows across all cards, `/` to focus
- **Category filters**: click to show only one category
- **Keyboard nav**: `Esc` clears search
- **Print layout**: `@media print` switches to 3-column, white background
- **Hover effects**: cards lift, rows highlight
- **Responsive**: grid auto-fills from 380px minimum

---

## File Naming Convention

```
cheatsheet.html          # neovim (the original)
tmux-cheatsheet.html     # tmux
fish-cheatsheet.html     # fish shell
git-cheatsheet.html      # git
```

All live in the dotfiles repo root (`~/.local/share/chezmoi/`).
