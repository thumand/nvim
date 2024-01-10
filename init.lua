LAZY_PLUGIN_SPEC = {}

function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

require("user.options")
require("user.keymaps")
require("user.autocmds")
spec "user.spec.colorscheme"
spec "user.spec.devicons"
spec "user.spec.treesitter"
spec "user.spec.mason"
-- spec "user.schemastore"
spec "user.spec.lspconfig"
-- spec "user.navic"
-- spec "user.breadcrumbs"
-- spec "user.null-ls"
-- spec "user.illuminate"
-- spec "user.telescope"
-- spec "user.telescope-tabs"
-- spec "user.nvimtree"
-- spec "user.lualine"
-- spec "user.whichkey"
-- spec "user.cmp"
-- spec "user.autopairs"
spec "user.spec.comment"
-- spec "user.gitsigns"
-- spec "user.neogit"
-- spec "user.diffview"
-- spec "user.indentline"
-- spec "user.alpha"
-- spec "user.netrw"
-- spec "user.project"
-- spec "user.toggleterm"
-- spec "user.bufdelete"
-- require "user.lazy"
require("user.lazy")
