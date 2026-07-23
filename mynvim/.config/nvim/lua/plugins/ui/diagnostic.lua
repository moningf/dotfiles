return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      -- 诊断外观预设
      -- 可用: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
      preset = "modern",

      -- 透明背景
      transparent_bg = false,

      -- cursorline 上诊断背景透明
      transparent_cursorline = true,

      -- 高亮组自定义
      hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine",
        mixing_color = "Normal", -- 与背景混合的颜色，"None" 表示不混合
      },

      -- 禁用该插件的文件类型
      disabled_ft = {},

      options = {
        -- 显示诊断来源（如 "lua_ls", "pyright"）
        show_source = {
          enabled = false,
          if_many = false, -- 仅当同一条诊断有多个来源时才显示
        },

        -- 显示诊断错误码（如 "F401"）
        show_code = true,

        -- 使用 vim.diagnostic.config 的图标而非预设
        use_icons_from_diagnostic = false,

        -- 箭头颜色跟随第一个诊断的严重级别
        set_arrow_to_diag_color = false,

        -- 更新节流（毫秒），值越高 CPU 占用越低
        throttle = 20,

        -- 长消息触发软换行的最小字符数
        softwrap = 30,

        -- 诊断消息显示控制
        add_messages = {
          messages = true,             -- 显示完整诊断消息
          display_count = false,       -- 光标不在行上时显示诊断计数
          use_max_severity = false,    -- 计数时只显示最严重的诊断
          show_multiple_glyphs = true, -- 同级别多个诊断显示多个图标
        },

        -- 多行诊断
        multilines = {
          enabled = true,                               -- 启用多行诊断支持
          always_show = true,                           -- 在所有行上始终显示
          trim_whitespaces = false,                     -- 移除首尾空白
          tabstop = 4,
          severity = { vim.diagnostic.severity.ERROR }, -- ERROR 级别始终可见，其他只在光标行显示
        },

        -- 光标行上显示该行所有诊断（不只是光标下的那个）
        show_all_diags_on_cursorline = false,

        -- 严格仅在光标下有诊断时才显示
        show_diags_only_under_cursor = false,

        -- LSP relatedInformation 相关诊断
        show_related = {
          enabled = true,
          max_count = 3,
        },

        -- 插入/选择模式下显示诊断
        enable_on_insert = false,
        enable_on_select = false,

        -- 超出窗口宽度时的处理
        overflow = {
          mode = "wrap", -- "wrap" | "none" | "oneline"
          padding = 0,
        },

        -- 长消息自动换行
        break_line = {
          enabled = false,
          after = 30,
        },

        -- 自定义格式化函数（接收 diag 对象，返回字符串）
        format = nil,

        -- 虚拟文本优先级
        virt_texts = {
          priority = 2048,
        },

        -- 显示哪些严重级别的诊断
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.HINT,
        },

        -- 触发诊断附加的 autocmd 事件，默认 {"LspAttach"}
        overwrite_events = nil,

        -- 打开诊断浮动窗口时自动隐藏 inline 诊断，避免视觉重叠
        override_open_float = true,
      },
    })
    vim.diagnostic.config({ virtual_text = false })
  end,
}
