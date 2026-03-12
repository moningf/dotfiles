return{

  --快捷键显示插件
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)", },
    },
  },

  -- 文件搜索插件
{
  'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    -- basic config
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    --lsp config
    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Telescope lsp definition' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Telescope lsp referencek' })
  end
},
-- {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "MunifTanjim/nui.nvim",
--     "nvim-tree/nvim-web-devicons",
--   },
--   lazy = false,
--   keys = {
--     {"<leader>e","<cmd>Neotree toggle<CR>",desc ="打开文件树"}
--   },
--   opts = {
--   },
-- }
}
