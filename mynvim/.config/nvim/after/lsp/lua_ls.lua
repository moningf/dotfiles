return {
  -- capabilities = require("blink.cmp").get_lsp_capabilities(),
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
      hint = {
        enable = true,
      },
    },
  },
}
