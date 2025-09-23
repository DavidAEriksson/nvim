return {
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          python = {
            require("formatter.filetypes.python").black,
          },
          javascript = {
            require("formatter.filetypes.javascript").prettier,
          },
          typescript = {
            require("formatter.filetypes.typescript").prettier,
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
          },
          javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettier,
          },
          json = {
            require("formatter.filetypes.json").prettier,
          },
          html = {
            require("formatter.filetypes.html").prettier,
          },
          css = {
            require("formatter.filetypes.css").prettier,
          },
          scss = {
            require("formatter.filetypes.css").prettier,
          },
          yaml = {
            require("formatter.filetypes.yaml").prettier,
          },
          markdown = {
            require("formatter.filetypes.markdown").prettier,
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })

      vim.api.nvim_create_augroup("FormatAutogroup", {})
      vim.api.nvim_create_autocmd("BufWritePost", {
        command = "FormatWrite",
        group = "FormatAutogroup",
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        python = { "flake8" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}