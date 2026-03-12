return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab", -- 使用 super-tab 预设，Tab 键默认会进行补全
        ["<CR>"] = { "accept", "fallback" }, -- 额外绑定 Enter 为接受补全
      },
    },
  },
}
