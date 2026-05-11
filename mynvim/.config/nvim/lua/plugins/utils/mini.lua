return {
  -- mini工具包
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    -- 目前觉得好用的
    require("mini.move").setup()      -- 移动目标
    require("mini.pairs").setup()     -- 自动补全括号/引号

    require("mini.comment").setup()   -- gcc / gc 注释
    require("mini.surround").setup()  -- 修改括号/引号包裹
    require("mini.ai").setup()        -- 增强文本对象
    require("mini.splitjoin").setup() -- gs命令来折叠或展开参数
  end,
}
