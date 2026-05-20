return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "lua_ls", "pyright", "clangd", "bashls", "rust_analyzer" },
          automatic_enable = false, -- 自动启动lsp
        },
      },
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        },
      },
    },
    config = function()
      -- 手动启用你想要的 LSP
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")

      -- 统一 LspAttach 按键
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, {
              buffer = event.buf,
              desc = "LSP: " .. desc,
            })
          end

          map("gd", "<cmd>Telescope lsp_definitions<cr>", "Goto Definition")
          map("gr", "<cmd>Telescope lsp_references<cr>", "References")
          map("gI", "<cmd>Telescope lsp_implementations<cr>", "Implementation")
          map("gy", "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition")

          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
          map("<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
          vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            signs = true,
            severity_sort = true,
            float = {
              border = "rounded",
              source = "if_many",
            },
          })
        end,
      })
    end,
  },
}
