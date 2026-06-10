return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          on_attach = function(_, _)
            vim.lsp.inlay_hint.enable(true)
          end,
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = true,
              check = {
                command = "clippy",
              },
              procMacro = {
                enable = true,
              },
              inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true, minLines = 1 },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always" },
              },
              completion = {
                autoimport = {
                  enable = true,
                },
              },
            },
          },
        },
      }
    end,
  },
}
