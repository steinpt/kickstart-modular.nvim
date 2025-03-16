https://tui.ninja/neovim/fundamentals/commands/motions/

|                             Mode                             | Short Name |                  Enter Mode                   |
| :----------------------------------------------------------: | :--------: | :-------------------------------------------: |
| [Insert Mode](https://tui.ninja/neovim/fundamentals/modes/insert/) |     i      |   [i](https://tui.ninja/neovim/commands/i/)   |
| [Replace Mode](https://tui.ninja/neovim/fundamentals/modes/replace/) |     R      |   [R](https://tui.ninja/neovim/commands/R/)   |
| [Visual Mode](https://tui.ninja/neovim/fundamentals/modes/visual/) |     v      |   [v](https://tui.ninja/neovim/commands/v/)   |
| [Visual-Line Mode](https://tui.ninja/neovim/fundamentals/modes/visual_line/) |     V      |   [V](https://tui.ninja/neovim/commands/V/)   |
| [Visual-Block Mode](https://tui.ninja/neovim/fundamentals/modes/visual_block/) |    C-V     | [C-V](https://tui.ninja/neovim/commands/C-V/) |
| [Command-Line Mode](https://tui.ninja/neovim/fundamentals/modes/command_line/) |     c      |   [:](https://tui.ninja/neovim/commands/:/)   |
| Return to [Normal Mode](https://tui.ninja/neovim/fundamentals/modes/normal/) |     n      | [Esc](https://tui.ninja/neovim/commands/Esc/) |

For a full list of Neovim modes, `:h mode()`

|                  Command                  |                            Action                            |
| :---------------------------------------: | :----------------------------------------------------------: |
| [i](https://tui.ninja/neovim/commands/i/) |            insert text before the cursor N times             |
| [a](https://tui.ninja/neovim/commands/a/) |             append text after the cursor N times             |
| [s](https://tui.ninja/neovim/commands/s/) | (substitute) delete N characters [into register x] and start insert |
| [I](https://tui.ninja/neovim/commands/I/) |    insert text before the first CHAR on the line N times     |
| [A](https://tui.ninja/neovim/commands/A/) |        append text after the end of the line N times         |
| [S](https://tui.ninja/neovim/commands/S/) | delete N lines [into register x] and start insert; synonym for "cc". |
| [C](https://tui.ninja/neovim/commands/C/) | change from the cursor position to the end of the line, and N-1 more lines [into register x]; synonym for "c$" |

|                    Command                    |                      Action                       |
| :-------------------------------------------: | :-----------------------------------------------: |
|   [c](https://tui.ninja/neovim/commands/c/)   |                  change operator                  |
|   [d](https://tui.ninja/neovim/commands/d/)   |                  delete operator                  |
|   [y](https://tui.ninja/neovim/commands/y/)   |                   yank operator                   |
|   [~](https://tui.ninja/neovim/commands/~/)   |          swap case (if `tildeop` is set)          |
|  [g~](https://tui.ninja/neovim/commands/g~/)  |                     swap case                     |
|  [gu](https://tui.ninja/neovim/commands/gu/)  |                change to lowercase                |
|  [gU](https://tui.ninja/neovim/commands/gU/)  |                change to uppercase                |
|   [!](https://tui.ninja/neovim/commands/!/)   |        filter through an external program         |
|   [=](https://tui.ninja/neovim/commands/=/)   | filter through 'equalprg' or C-indenting if empty |
|  [gq](https://tui.ninja/neovim/commands/gq/)  |                  text formatting                  |
|  [gw](https://tui.ninja/neovim/commands/gw/)  |      text formatting with no cursor movement      |
| [g?](https://tui.ninja/neovim/commands/g%3F/) |                  ROT13 encoding                   |
|   [>](https://tui.ninja/neovim/commands/>/)   |                 shift text right                  |
|    [<](https://tui.ninja/neovim/commands/)    |                  shift text left                  |
|  [zf](https://tui.ninja/neovim/commands/zf/)  |                   define a fold                   |

|                   Command                   |                     Action                     |
| :-----------------------------------------: | :--------------------------------------------: |
| [yy](https://tui.ninja/neovim/commands/yy/) |             Yank the current line              |
| [cc](https://tui.ninja/neovim/commands/cc/) | Delete the current line then enter INSERT mode |
| [dd](https://tui.ninja/neovim/commands/dd/) |            Delete the current line             |

