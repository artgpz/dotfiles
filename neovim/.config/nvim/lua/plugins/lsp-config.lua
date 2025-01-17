return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "eslint-lsp",
        "gopls",
        "lua-language-server",
        "prettierd",
        "svelte-language-server",
        "tailwindcss-language-server",
        "vtsls",
      },
    },
  },
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      setup = {
        svelte = function(_, opts)
          LazyVim.lsp.on_attach(function(client, buffer)
            if client.name == "svelte" then
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                callback = function(ctx)
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end
          end)
        end,
      },
      -- configuration here or empty for defaults
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      setup = {
        svelte = function(_, opts)
          LazyVim.lsp.on_attach(function(client, buffer)
            if client.name == "svelte" then
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
                callback = function(ctx)
                  -- Here use ctx.match instead of ctx.file
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
              -- vim.api.nvim_create_autocmd("BufWritePost", {
              --   pattern = { "*.js", "*.ts" },
              --   callback = function(ctx)
              --     client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              --   end,
              -- })
            end
          end)
        end,
      },
    },
  },
}
