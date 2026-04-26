return {
  {
    -- mini工具包
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("mini.pairs").setup()     -- 自动补全括号/引号
      require("mini.comment").setup()   -- gcc / gc 注释
      require("mini.surround").setup()  -- 修改括号/引号包裹
      require("mini.ai").setup()        -- 增强文本对象
      require("mini.move").setup()      -- 移动目标
      require("mini.splitjoin").setup() -- gs命令来折叠或展开参数
    end,
  },
  -- {
  --   "folke/snacks.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   ---@type snacks.config
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --     bigfile = { enabled = false },
  --     dashboard = { enabled = true },
  --     explorer = { enabled = false },
  --     indent = { enabled = false },
  --     input = { enabled = false },
  --     picker = { enabled = false },
  --     notifier = { enabled = false },
  --     quickfile = { enabled = false },
  --     scope = { enabled = false },
  --     scroll = { enabled = false },
  --     statuscolumn = { enabled = false },
  --     words = { enabled = false },
  --   },
  -- }
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "buffer local keymaps (which-key)", },
    },
  }
}
