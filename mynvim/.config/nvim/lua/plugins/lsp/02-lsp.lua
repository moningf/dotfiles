return {
  -- mason-lspconfig为mason的扩展插件（使mason和lspconfig两者结合到一起）不过nvim11之后，lspconfig插件似乎可以替代了
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "html",
        "cssls",
        "cssmodules_ls",
        "lua_ls",
        "stylua",
        "rust_analyzer",
        "pyright",
        "jsonls",
        "jdtls",
        "bashls",
        "clangd",},
      automatic_enable = {
        exclude = { "jdtls"}
      },
    },
  },

}
