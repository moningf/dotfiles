return { {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]], -- Ctrl + \
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "float",
      -- direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,

      float_opts = {
        border = "rounded",
        winblend = 0,
      },
    })
  end,
},
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      terminal = {
        win = {
          position = "float", -- 强制默认使用浮动窗口
          border = "rounded", -- 边框样式："none", "single", "double", "rounded", "solid", "shadow" 等
          width = 0.8,        -- 窗口宽度（0 到 1 之间表示相对屏幕的比例）
          height = 0.8,       -- 窗口高度
          backdrop = 60,      -- 背景遮罩的透明度 (0-100)，或者设为 false 禁用遮罩
        }
      }
    },
    keys = {
      -- 绑定 <C-/>
      { "<C-/>", function() Snacks.terminal.toggle() end, mode = { "n", "t", "i", "v" }, desc = "Toggle Terminal" },
    }
  }
}
