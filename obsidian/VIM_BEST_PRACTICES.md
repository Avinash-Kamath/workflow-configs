# Vim Best Practices

A living document. Add to this as you learn.

---

## The Core Mindset

Vim is not about pressing keys fast — it's about pressing **fewer keys**. Every time you find yourself holding or repeating a key, there's a better way.

---

## Vertical Movement

**Avoid:** Holding `j` or `k` to scroll through lines.

**Why:** Slow and imprecise. You overshoot and have to correct.

**Use instead:**
- `5j` / `10k` — jump exactly N lines (use relative line numbers to know the number)
- `}` / `{` — jump by paragraph / empty line. Great for moving between functions
- `<C-d>` / `<C-u>` — half page down/up. Fast for large files
- `gg` / `G` — top / bottom of file instantly
- `42G` or `:42` — jump to exact line number
- `H` / `M` / `L` — jump to top / middle / bottom of the visible screen

---

## Horizontal Movement

**Avoid:** Holding `h` or `l` to move across a line. Repeating `w` or `b` many times.

**Why:** Still slow. You're moving one word at a time when you could jump directly.

**Use instead:**
- `f{char}` — jump forward to a character on the line. E.g. `f(` jumps to the next `(`
- `F{char}` — same but backward
- `t{char}` / `T{char}` — jump to just *before* a character (useful with `d`, `c`)
- `;` / `,` — repeat the last `f`/`t` forward or backward. Use this instead of pressing `f` again
- `0` / `^` — start of line / first non-blank character
- `$` — end of line
- `w` / `b` — fine for 1-2 words, but combine with a count: `3w` not `www`

---

## Searching (best horizontal + vertical motion)

**The fastest way to get anywhere in a file:**
- `/pattern` — search forward, lands your cursor exactly where you want
- `*` — search for the word currently under your cursor
- `n` / `N` — jump to next / previous match

**Rule of thumb:** If a target is more than 3 words away, search for it instead of navigating to it.

---

## Operators + Motions (the real power)

Vim commands follow a pattern: `{operator}{motion}`

| Example | What it does |
|---------|-------------|
| `dw` | Delete next word |
| `d$` | Delete to end of line |
| `dt)` | Delete up to (not including) the `)` |
| `ci"` | Change everything inside `"quotes"` |
| `ya{` | Yank (copy) everything around `{block}` including braces |
| `>ip` | Indent the current paragraph |

**Avoid:** Deleting character by character with `x` repeatedly. Use `dw`, `dt{char}`, `d$` instead.

---

## Stay in Normal Mode

**Avoid:** Entering insert mode and then using arrow keys or backspace to navigate/fix things.

**Why:** Normal mode is where you *move and edit*. Insert mode is only for *typing new text*.

**Rule:** The moment you stop typing new characters, press `<Esc>` and use a motion to get where you need to go.

---

*More to be added as we go.*
