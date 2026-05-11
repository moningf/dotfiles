return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    -- 配置
    opts = {
      -- 风格
      flavour = "macchiato",         -- latte, frappe, macchiato, mocha
      auto_integrations = true,      -- 自动集成
      transparent_background = true, -- 终端颜色

      -- 非活动窗口变暗
      dim_inactive = {
        enabled = false,   -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.01, -- percentage of the shade to apply to the inactive window
      },
    },

    no_italic = false,    -- 禁用斜体
    no_bold = false,      -- 禁用粗体
    no_underline = false, -- 禁用下划线

    config = function(_, opts)
      -- print(vim.inspect(_))
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin-nvim"
    end
  },
}
