# Neovim config

To install this config on MacOS, clone the repository to `~/.config/nvim`,
so that the `init.lua` is in `~/config/nvim/init.lua`.

The file structure should be:

```code
~/.config/nvim
├── LICENSE
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── colorscheme.lua
    │   ├── keymaps.lua
    │   └── options.lua
    ├── lazy-load.lua
    ├── lazy-setup.lua
    └── plugins
        ├── colorscheme.lua
        ├── lualine.lua
        ├── nightfly.lua
        ├── telescope_and_fzf.lua
        └── ...
```

## Troubleshooting

* Use `nvim >= 0.9.0`
* Python:
    * Install Python using `pyenv install 3.10.0`
    * Set a global version using `pyenv global 3.10.0`
    * Add the path to python (get it using `which python`) to `~/config/nvim/lua/core/options.lua`. The path sould be: `vim.g.python3_host_prog = '/Users/michaelthumand/.pyenv/shims/python'`
    * Do a `pip install neovim`

## Tmux and Neovim

### Install Tmux and a plugin manager

**Step 1**: Tmux can be installed on MacOS with for example Homebrew:

```
brew install tmux
```

**Step 2**: In the home folder add the `.tmux.conf` from this repository to `~/.tmux.conf`.

**Step 3**: And a plugin manager can be installed on MacOS like this:

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

When a plugin is specified in `.tmux.conf` it can be installed from a Tmux-session with `<C-b>I`.

To move easily between `tmux` and `nvim` make sure to use this plugin: `christoomey/vim-tmux-navigator`.

### Some Tmux shortcuts

* `tmux new -s [name]`  (if not number, then session name will be a number)
* `tmux ls`
* `tmux detach` (in normal command line)
* `tmux attach -t [name]`
* `<C-b>s` to list sessions from tmux
* `<C-b>,` to rename
* `<C-b>I` to install plugins


`gcc` for commenting
`C-n` for opening neo-tree
`<leader>ff` find files
`<leader>fr` find old files
`<leader>fg` live grep
`<leader>fs` grep string under cursor in cwd
`<leader>K` Hover information about the symbol under cursor
`<leader>gd` jump to definitions
`<leader>gD` jump to declaration
`<leader>gi` list implementations
`<leader>go` jums to the definition of the type of symbol under cursor
`<leader>gr` list references to the symbol
`<leader>gs` signature information
`<leader>gl` show diagnostics
`<leader>[d` Move to previous diagnostics
`<leader>]d` Move to next diagnostics


