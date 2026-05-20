return {
  "stevearc/aerial.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  keys = {
    -- 也可以用 <leader>a，这里配置在左侧打开
    { "<leader>o", "<cmd>AerialToggle left<CR>", desc = "Toggle Aerial (大纲)" },
  },
  opts = {
    layout = {
      -- 核心：明确指定默认在左侧打开
      default_direction = "left",
      width = 32,
      placement = "edge",
    },
    -- 全局依附模式，配合下方的 edgy 窗口管理器效果更好
    attach_mode = "global",
  },
}
