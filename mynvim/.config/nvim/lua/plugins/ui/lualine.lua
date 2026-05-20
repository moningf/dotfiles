return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    -- 1. 彻底的安全检查：确保每一层级都存在，如果不存在则初始化为一个空表
    if type(opts) ~= "table" then opts = {} end
    if type(opts.options) ~= "table" then opts.options = {} end
    if type(opts.options.disabled_filetypes) ~= "table" then opts.options.disabled_filetypes = {} end
    if type(opts.options.disabled_filetypes.statusline) ~= "table" then opts.options.disabled_filetypes.statusline = {} end
    if type(opts.options.disabled_filetypes.winbar) ~= "table" then opts.options.disabled_filetypes.winbar = {} end

    -- 2. 我们要剔除 lualine 的窗口类型
    local ignore_filetypes = {
      "NvimTree",
      "aerial",
      "edgy"
    }

    -- 3. 将这些类型加入到 lualine 的黑名单中
    for _, ft in ipairs(ignore_filetypes) do
      table.insert(opts.options.disabled_filetypes.statusline, ft)
      table.insert(opts.options.disabled_filetypes.winbar, ft)
    end
  end,
}
