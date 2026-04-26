return {
  {
    -- telescope查找文件
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- optional but recommended
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
      -- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
  },

  {
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
  },

  {
    -- 静态代码检查工具
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufWritePost", "InsertLeave" },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        -- lua = { "luac" },
        python = { "ruff" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        vue = { "eslint_d" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },

  {
    "neovim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    dependencies = {
      "neovim-treesitter/treesitter-parser-registry",
    },
    config = function()
      require("nvim-treesitter").install({
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
  },


  {
    -- flash实现全屏跳转
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
}
