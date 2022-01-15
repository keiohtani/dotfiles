# ---------- vim ------------
- replace
`:%s/Search-Word/Replace-Word/g`

## Go Functions
- Go to a file
`gf`
- Go to a link
`gx`
- Go to the definition
`gd`
- Go to the implementation
`gi`

## buffer
`:enew` `:new` `:vnew`
- go to a file
`gf`

## X completion mode
- tag 
`<C-x><C-]>`
- filename
`<C-x><C-f>`
- context-aware word
`<C-x><C-p>`
- line
`<C-x><C-l>`
- omni
`<C-x><C-o>`

## dictionary
- add word under the cursor as a good word
`zg` or `zug`
- add word under the cursor as a bad word
`zw` or `zuw`
## default
- move current line to the middle of the screen
`zz`

- move current line to the top of the screen
`zt`

- move current line to the bottom of the screen
`zb`

- repeat find next character
`;` forward
`,` backward

- see the content of registers
`:registers` 

- check if mapping exists
`:mapcheck("<CR>", "n")`

- go back to previous location
`<C-o>`

- go forward in locations
`<C-i>`

- change to lowercase
`gu`

- change to uppercase
`gU`

- cycle through
`:jumps`

- jump to the link
`<C-]>`

- search word under the cursor
`*`

## window
- Horizontal split
`:sp`

- Vertical split
`:vs`

- change windows size
`number <C-w> -/+` or `:res +/-number` vertical
`number <C-w> >/<` or `:vertical res +/-number` horizontal

## netrw
- Create new file in the file explore
`%`

- Rename a file
`R`

# -------- Custom ---------
- open cheatsheet
<leader>c

# -------- Plugins --------
## gv.vim
- open commit browser
`:GV`
- commit only for the current file
`:GV!`

## fzf.vim
- open in a split
`<C-x>`
- open in a vsplit
`<C-v>`

## Bullets.vim
- indent
`>>`
`<C-t>`
- dedent
`<<`
`<C-d>`

## custom textobj
- function
`af`, `if`, `aF`, `iF`

- indent
`ai`, `ii`, `aI`, `iI`

- line
`al`, `il`, `aL`, `iL`

## vim-system-copy
- basic
`cp<motion>`
- line copy
`cP`
- paste
`cv`

## ReplaceWithRegister
`gr<motion>`

## vim surround
`<operation>s<tag>` - ex `ds"`

## fugitive
- git status
`:G`

- add to stage
`s`

- unstage
`u`

- difftoal
`dv`

- drop in difftool
`dp`

- commit
`:Gcommit`

- push
`:Gpush`

- jump to next/previou funks
`]c` `[c`

## NERDTree
- move up the directory
`u` or `U`

- Open commands
`m`

- Open file without moving the cursor
`go`
`gi` for split window

## ctrlp
- open a selected file in vsplit
`<C-v>`
- open a selected file in split
`<C-s>`

## coc
- goto definition
`gf`

- goto implementation
`gi`

## tcomment_vim
- toggle comment
`gc{motion}`
