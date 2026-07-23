return {
  {
    -- 显示git痕迹
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      lazygit = {
        configure = true, -- 自动配置集成
      }
    },
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    }
  }
}
