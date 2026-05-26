return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    ft = { "rust" },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.g.rustaceanvim = {
        server = {
          capabilities = capabilities,

          on_attach = function(client, bufnr)
            -- inlay hints
            vim.lsp.inlay_hint.enable(true)

            local map = vim.keymap.set

            -- code action
            map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })

            -- hover
            map("n", "K", vim.lsp.buf.hover, { buffer = bufnr })

            -- rename
            map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
            -- inlay_hint
            map('n', '<leader>th', function()
              if vim.lsp.inlay_hint then
                local is_enabled = vim.lsp.inlay_hint.is_enabled()
                vim.lsp.inlay_hint.enable(not is_enabled)
                print("Inlay Hints: " .. (is_enabled and "OFF" or "ON"))
              end
            end, { desc = "Toggle Inlay Hints" })
          end,

          settings = {
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
                bindingModeHints = {
                  enable = true,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                  minLines = 1,
                },
                closureReturnTypeHints = {
                  enable = "always",
                },
                lifetimeElisionHints = {
                  enable = "always",
                },
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
