# My Dotfiles

Clone this repo to ~/dotfiles and run setup.sh 

This will create symlinks for the dotfiles in the correct places. 

## Dependancies
rofi
i3lock-color
alacritty
picom
tmux
dunst
rofi-power-menu

## Optional Dependancies
flameshot
pavucontrol
keeper
ranger

## Future Ideas
- [ ] Write a nvim plugin to associate files with their tests.
eg:
  cmd/
    blah/
      mything.go
  tests/
    test_mything.go
    test_mything2.go

we could associate mything, and the test_mything files regardless of file structure
or nameing (would require manually associating these). So you could be in mything.go
and just hit <leader>mt or whatever, and your given a list with test_mything and
test_mything2, as these 2 files have been associated with our code file. Likewise, if
we are in test_mything file, and hit the <leader>mt, we can jump straight to mything.go
as this test file is for that code

apparently we should persist these associations in either
    ~/.local/state/nvim 
    ~/.cache/nvim

have to look into it more. might be fun. 

---

Nvim plugin to attach labels to blocks of code and ability to search by label.
so if i have some code somewhere like
const sum = (a) => a.reduce((x,a) => x + a)
or whatever, i can label this as sum-arr, then i can search for sum-arr in telescope and this is an option. 

could be useful for labeling exports, or common things we import or use in other files or just navigating to
often visited places in the codebase

---

Golang/bubbletea viewer for background jobs on tenant environment

---

Golang/bubbletea opensearch intergration
  - https://github.com/opensearch-project/opensearch-go

### Done

- [x] Make the dbeaver-connect script but for datagrip
- [x] Tenant remote database automatic connect thingy

---

## License
Unless otherwise marked, everything in this repo is licenced under the WTFPL license terms
```       DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
                    Version 2, December 2004 

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 

 Everyone is permitted to copy and distribute verbatim or modified 
 copies of this license document, and changing it is allowed as long 
 as the name is changed. 

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

  0. You just DO WHAT THE FUCK YOU WANT TO.
```

