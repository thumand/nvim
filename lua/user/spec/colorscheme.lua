local M = {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  commit = "5e36ca599f4aa41bdd87fbf2c5aae4397ac55074",
}

function M.config()
  vim.cmd.colorscheme "catppuccin"
end

return M
