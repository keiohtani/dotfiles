# vim default
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

# custom textobj
- function
`af`, `if`, `aF`, `iF`

- indent
`ai`, `ii`, `aI`, `iI`

- line
`al`, `il`, `aL`, `iL`

# vim-system-copy
`cp<motion>`

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


# coc
- goto definition
`gt`

# tcomment_vim
- toggle comment
`gc{motion}`


# netrw
- Create new file in the file explore
`%`

- Rename a file
`R`
