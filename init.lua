--[[

NOTES

Selected keybindings:

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


--]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.nu = true
vim.wo.relativenumber = true
vim.cmd("set signcolumn=yes")
vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -----------------------------------------------------------------------------
  -- List all plugins, instead of automaticlly import from plugins directory --
  -----------------------------------------------------------------------------
  require("user.plugins.treesitter"),
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  require("user.plugins.neo-tree"),
  require("user.plugins.comment"),
  require("user.plugins.telescope"),
  require("user.plugins.nvim-autopairs"),
  require("user.plugins.nvim-surround"),
  require("user.plugins.gitsigns"),
  "christoomey/vim-tmux-navigator",
  -- Mason for Lsp management
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  -- LSP Support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      --      event = { "BufReadPre", "BufNewFile" },
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { 'onsails/lspkind.nvim' },
      { "rafamadriz/friendly-snippets" },
    },
  },
})

vim.cmd.colorscheme('catppuccin')

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })

  -- Disable inline diagnostics
  vim.diagnostic.config({ virtual_text = false })
end)

-- Using lsp-servers to format files on save
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = { 'javascript', 'typescript' },
    ['rust_analyzer'] = { 'rust' },
    ['lua_ls'] = { 'lua' },
  }
})

-- Diagnostics icons in sign column (remember to set column to always show
lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

local lua_opts = lsp_zero.nvim_lua_ls({
  -- Add custom arguments here
})
require('lspconfig').lua_ls.setup(lua_opts)

--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format()

cmp.setup({
  -- Sources for snipets
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  -- Window settings
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- Keybindings
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    -- Formatting provided by lspkind.nvim
    format = require('lspkind').cmp_format({
      mode = 'symbol',       -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
    })
  }
})
