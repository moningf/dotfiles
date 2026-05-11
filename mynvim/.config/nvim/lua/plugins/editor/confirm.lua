return {
  -- 格式化代码
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      vue = { "prettier" },
      java = {},
    },
  },
}
