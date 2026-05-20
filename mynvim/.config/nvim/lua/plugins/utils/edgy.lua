return {
  "folke/edgy.nvim",
  enabled = false,
  event = "VeryLazy",
  init = function()
    -- 优化窗口分割时的视觉跳动问题
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    -- 定义左侧边栏的布局
    left = {
      -- 左侧上半部分：文件树 (NvimTree)
      {
        title = "NvimTree",
        ft = "NvimTree",         -- 根据 filetype 识别
        size = { height = 0.5 }, -- 高度占据 50%
        pinned = true,           -- 固定显示，不易被误关
      },
      -- 左侧下半部分：文件大纲 (Aerial)
      {
        title = "Aerial",
        ft = "aerial",
        open = "AerialToggle left", -- 定义打开它的命令
        size = { height = 0.5 },    -- 高度占据另外 50%
        pinned = true,
      },
    },
    -- 全局定义左侧边栏的统一宽度
    options = {
      left = { size = 35 },
    },
    animate = {
      enabled = false,
    }
  },
}
