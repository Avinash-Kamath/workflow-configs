---
tags: [neovim, beginner, guide]
---

# Getting Started with Neovim

## First Things First

### 1. Run the built-in tutorial
Open Neovim and type:
```
:Tutor
```
This is a 30-minute interactive guide that teaches basic navigation and editing. Do this before anything else.

---

### 2. Understand Modes

Neovim is modal — the keyboard does different things depending on the active mode.

| Mode | How to enter | What it's for |
|---|---|---|
| **Normal** | `<Esc>` | Navigation, commands — *the default mode* |
| **Insert** | `i`, `a`, `o` | Typing text |
| **Visual** | `v`, `V`, `<C-v>` | Selecting text |
| **Command** | `:` | Running commands like `:w`, `:q` |

> Rule of thumb: Always return to Normal mode with `<Esc>` when you're done typing.

---

### 3. The Most Important Commands

```
:w        save
:q        quit
:wq       save and quit
:q!       quit without saving
:e file   open a file
```

---

## Navigation

### Moving the cursor (Normal mode)

```
h  ←   j  ↓   k  ↑   l  →

w   move forward one word
b   move backward one word
e   move to end of word

0   start of line
$   end of line
^   first non-blank character of line

gg  top of file
G   bottom of file
5G  go to line 5

{   move up one paragraph/block
}   move down one paragraph/block
```

### Scrolling

```
<C-d>   scroll down half page
<C-u>   scroll up half page
<C-f>   scroll down full page
<C-b>   scroll up full page
```

---

## Editing

### Entering Insert mode

```
i   insert before cursor
a   insert after cursor
I   insert at start of line
A   insert at end of line
o   new line below, enter insert mode
O   new line above, enter insert mode
```

### Operators (Normal mode)

Operators combine with motions: `[operator][motion]`

```
d   delete     dw = delete word, dd = delete line, d$ = delete to end
c   change     cw = change word (delete + enter insert mode)
y   yank       yy = copy line, yw = copy word
>   indent     >> = indent line
<   unindent   << = unindent line
```

### Visual mode

```
v       character selection
V       line selection
<C-v>   block selection

After selecting:
d   delete
y   copy
>   indent
c   change
```

### Undo / Redo

```
u       undo
<C-r>   redo
```

---

## Search & Replace

```
/pattern      search forward
?pattern      search backward
n             next match
N             previous match
<Esc>         clear highlights

:%s/old/new/g    replace all in file
:%s/old/new/gc   replace all with confirmation
```

---

## Working with Files

Use **Telescope** for fuzzy finding:

```
<Space>sf   find files
<Space>sg   search text in project (live grep)
<Space>s.   recent files
<Space><Space>   switch open buffers
```

---

## Getting Help

Neovim has excellent built-in help:

```
:help          open help index
:help keyword  help for specific topic
<Space>sh      search help docs with Telescope
```

---

## Recommended Learning Order

1. `:Tutor` — basic navigation and editing
2. [[Keymaps]] — your specific keymaps
3. Learn Telescope — `<Space>sf` and `<Space>sg` will change how you work
4. Learn LSP features — once a language server is set up
5. Learn text objects — `ci"`, `da)`, etc. (via mini.ai)
