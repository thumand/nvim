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


