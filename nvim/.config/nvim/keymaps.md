# Neovim Keymaps Cheatsheet

## File Explorers & Navigation

| Key          | Mode   | Description                                              |
| :----------- | :----- | :------------------------------------------------------- |
| `<leader>e`  | Normal | Toggle Oil floating file explorer                        |
| `<leader>E`  | Normal | Open Snacks file explorer                                |
| `<leader>ff` | Normal | Find files                                               |
| `<leader>fg` | Normal | Live grep (search text across files)                     |
| `<leader>fb` | Normal | List open buffers (jumps to existing window/tab if open) |
| `<leader>f;` | Normal | Resume last Snacks picker                                |
| `<leader>fR` | Normal | Rename current file                                      |
| `<leader>fn` | Normal | View notifications                                       |

## LSP & Code Actions

| Key          | Mode             | Description                                                  |
| :----------- | :--------------- | :----------------------------------------------------------- |
| `gd`         | Normal           | Goto Definition                                              |
| `gI`         | Normal           | Goto Source Definition (TypeScript `vtsls`) / Implementation |
| `gy`         | Normal           | Goto Type Definition                                         |
| `gD`         | Normal           | Goto Declaration                                             |
| `gr`         | Normal           | Show References                                              |
| `K`          | Normal           | Hover documentation                                          |
| `gK`         | Normal           | Signature Help                                               |
| `<C-k>`      | Insert           | Signature Help                                               |
| `<C-j>`      | Normal           | Jump to next diagnostic (with float)                         |
| `<leader>ca` | Normal, Visual   | Code Action                                                  |
| `<leader>cr` | Normal           | Rename symbol                                                |
| `<leader>cc` | Normal, Visual   | Run Codelens                                                 |
| `<leader>cC` | Normal           | Refresh & Display Codelens                                   |
| `<leader>cl` | Normal           | LSP Config / Info                                            |
| `<leader>ft` | Normal, Visual   | Format code (`conform.nvim`)                                 |
| `<M-n>`      | Normal, Terminal | Jump to next word reference                                  |
| `<M-p>`      | Normal, Terminal | Jump to previous word reference                              |

## LSP Pickers (Snacks)

| Key          | Mode   | Description                   |
| :----------- | :----- | :---------------------------- |
| `<leader>fd` | Normal | Picker: LSP Definitions       |
| `<leader>fr` | Normal | Picker: LSP References        |
| `<leader>fD` | Normal | Picker: LSP Declarations      |
| `<leader>fy` | Normal | Picker: LSP Type Definitions  |
| `<leader>fc` | Normal | Picker: LSP Incoming Calls    |
| `<leader>fx` | Normal | Picker: Workspace Diagnostics |

## Git & Diffs

| Key           | Mode   | Description                               |
| :------------ | :----- | :---------------------------------------- |
| `<leader>gl`  | Normal | Open Lazygit                              |
| `<leader>gb`  | Normal | Blame current line                        |
| `<leader>gB`  | Normal | Blame entire buffer                       |
| `<leader>gp`  | Normal | Open file from blamed commit in a new tab |
| `<leader>gh`  | Normal | Toggle stage hunk                         |
| `<leader>gs`  | Normal | Toggle stage entire buffer                |
| `<leader>gd`  | Normal | Picker: Git Diff (Hunks)                  |
| `<leader>go`  | Normal | Toggle `mini.diff` inline overlay         |
| `<leader>gcv` | Normal | Toggle `CodeDiff` view                    |
| `<leader>gch` | Normal | `CodeDiff` history (current file)         |
| `<leader>gcH` | Normal | `CodeDiff` history (entire repo)          |
