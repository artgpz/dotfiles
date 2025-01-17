return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  optional = true,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      -- nls.builtins.formatting.fish_indent,
      -- nls.builtins.diagnostics.fish,
      -- nls.builtins.formatting.stylua,
      -- nls.builtins.formatting.shfmt,
      nls.builtins.formatting.gofmt,
      nls.builtins.formatting.goimports,
      require("none-ls.diagnostics.eslint_d"),
    })
    table.insert(opts.sources, nls.builtins.formatting.prettier)
  end,
}
