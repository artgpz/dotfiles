return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    specs = {
      "akinsho/bufferline.nvim",
      init = function()
        local bufline = require("catppuccin.special.bufferline")
        function bufline.get()
          return bufline.get_theme()
        end
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
