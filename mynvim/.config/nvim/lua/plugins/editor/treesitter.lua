return {
  "neovim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  dependencies = {
    "neovim-treesitter/treesitter-parser-registry",
  },
  config = function()
    require("nvim-treesitter").install({
      "regex",
      "lua",
      "python",
      "rust",
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "json",
      "bash",
      "markdown",
      "vim",
      "vimdoc",
      "query",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "python",
        "rust",
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "html",
        "css",
        "json",
        "sh",
        "markdown",
      },
      callback = function(args)
        vim.treesitter.start(args.buf)
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
