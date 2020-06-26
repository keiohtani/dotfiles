## vim buffer
`:enew` `:new` `:vnew`

# vim X completion mode
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

# vim dictionary
- add word under the cursor as a good word
`zg` or `zug`
- add word under the cursor as a bad word
`zw` or `zuw`
# vim default
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

# vim window
- Horizontal split
`:sp`

- Vertical split
`:vs`

- change windows size
`number <C-w> -/+` or `:res +/-number` vertical
`number <C-w> >/<` or `:vertical res +/-number` horizontal

# Custom
- open cheatsheet
<leader>c

# fzf.vim
- open in a split
`<C-x>`
- open in a vsplit
`<C-v>`

# Bullets.vim
- indent
`>>`
`<C-t>`
- dedent
`<<`
`<C-d>`

# custom textobj
- function
`af`, `if`, `aF`, `iF`

- indent
`ai`, `ii`, `aI`, `iI`

- line
`al`, `il`, `aL`, `iL`

# vim-system-copy
- basic
`cp<motion>`
- line copy
`cP`
- paste
`cv`

# ReplaceWithRegister
`gr<motion>`

# vim surround
`<operation>s<tag>` - ex `ds"`

# fugitive
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

# NERDTree
- move up the directory
`u` or `U`

- Open commands
`m`

- Open file without moving the cursor
`go`
`gi` for split window

# ctrlp
- open a selected file in vsplit
`<C-v>`
- open a selected file in split
`<C-s>`

# coc
- goto definition
`gf`

- goto implementation
`gi`

# tcomment_vim
- toggle comment
`gc{motion}`


# netrw
- Create new file in the file explore
`%`

- Rename a file
`R`
