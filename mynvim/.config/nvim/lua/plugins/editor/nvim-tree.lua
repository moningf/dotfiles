return {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>",   desc = "Toggle nvim-tree" },
      -- { "<leader>o", "<cmd>NvimTreeFocus<CR>",    desc = "Focus nvim-tree" },
      { "<leader>r", "<cmd>NvimTreeFindFile<CR>", desc = "Reveal current file" },
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 35,
          side = "left",
        },

        renderer = {
          group_empty = true,
          highlight_git = true,
          indent_markers = { enable = true },
        },

        filters = { dotfiles = false, git_ignored = false },

        git = { enable = true, ignore = false },

        update_focused_file = { enable = true, update_root = false },

        actions = {
          open_file = { quit_on_open = false, resize_window = true },
        },
        -- 配置在nvimtree的buffer下的快捷键
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return {
              desc = "nvim-tree: " .. desc,
              buffer = bufnr,
              noremap = true,
              silent = true,
              nowait = true,
            }
          end
          api.config.mappings.default_on_attach(bufnr)
          vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
          vim.keymap.set("n", "i", api.tree.change_root_to_node, opts("CD"))
        end,
      })
    end,
  },
}
