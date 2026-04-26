return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- {
  --   -- 优化整体UI
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --   opts = {},
  -- },

  {
    -- 缩进线
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
