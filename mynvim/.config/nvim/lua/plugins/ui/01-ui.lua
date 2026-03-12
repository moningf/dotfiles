return{

  -- 主题配色插件
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000 ,
    config = function()
      require("catppuccin").setup({
        auto_integrations = true
      })
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- 状态栏插件
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    -- {"<leader>e",function () Snacks.explorer.open() end,desc = "打开文件树"},
  },
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = false },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true},
  },
},
{
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    animation = false,
    auto_hide = true,
    insert_at_start = true,
  },
  version = '^1.0.0',
},
{
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
},
}
