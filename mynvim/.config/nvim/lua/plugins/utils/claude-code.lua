local toggle_key = "<C-,>"



-- local fallback_key = "<C-_>"
return {
  "coder/claudecode.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  opts = {
    -- diff_opts = {
    --   layout = "vertical",
    --   open_in_new_tab = false,
    --   keep_terminal_focus = false,
    --   hide_terminal_in_new_tab = false,
    -- },

    terminal = {
      provider = "snacks",


      snacks_win_opts = {
        position = "float",
        width = 0.8,
        height = 0.8,
        border = "rounded",
        keys = {
          -- 直接引用顶部定义的变量
          claude_hide = {
            toggle_key,
            function(self) self:hide() end,
            mode = "t",
            desc = "Hide Claude",
          },
          -- claude_hide_fallback = {
          --   fallback_key,
          --   function(self) self:hide() end,
          --   mode = "t",
          --   desc = "Hide Claude",
          -- },
        },
      },
    },
  },


  keys = {
    -- 引用变量，配置普通模式和可视模式的唤醒
    { toggle_key,   "<cmd>ClaudeCodeFocus<cr>", mode = { "n", "x" },  desc = "Toggle Claude Code" },
    -- { fallback_key, "<cmd>ClaudeCodeFocus<cr>", mode = { "n", "x" },  desc = "Toggle Claude Code" },

    -- 保留官方推荐的备用快捷键
    { "<leader>ac", "<cmd>ClaudeCode<cr>",      desc = "Claude Code" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
  },
}
