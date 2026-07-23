return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    branch = "v3.x",
    -- 将加载时机与命令和快捷键绑定，保持启动速度
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function()
          -- require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "打开/关闭 Neo-tree (当前目录)",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "打开 Git 状态树",
      },
    },
    -- init 会在插件加载前运行：拦截并处理直接输入 `nvim .` 打开目录的情况
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.uv.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- 提供完整的文件类型图标支持
      {
        -- 与 LSP 深度整合：当在 Neo-tree 重命名或移动文件时，自动触发重构
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-neo-tree/neo-tree.nvim",
        },
        config = true, -- lazy.nvim 推荐：等同于 require("lsp-file-operations").setup()
      },
      {
        -- 窗口选择器：在开启多重分割窗口时，能通过高亮字母精准选择在新文件中打开的位置
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        opts = { -- lazy.nvim 推荐：使用 opts 表代替 config 函数
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              buftype = { "terminal", "quickfix" },
            },
          },
        },
      },
    },
    -- opts 应当是一个纯粹的表（Table），只存放插件的参数
    opts = {
      close_if_last_window = true, -- 当 Neovim 中只剩下 Neo-tree 时，自动退出
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      sort_case_insensitive = false,

      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true }, -- 在树状图中自动聚焦并展开到当前正在编辑的文件
        use_libuv_file_watcher = true,            -- 极客工作流必备：使用底层系统内核事件来监控文件变化
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_hidden = true,
        },
        window = {
          mappings = {
            ["oc"] = "none",
            ["od"] = "none",
            ["og"] = "none",
            ["om"] = "none",
            ["on"] = "none",
            ["os"] = "none",
            ["ot"] = "none",
            ["."] = "set_root",    -- 按 . 将光标下的文件夹设为当前根目录
            ["u"] = "navigate_up", -- 按 - 返回上一级父目录并设为根目录
          }
        }
      },

      window = {
        position = "left",
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          -- 核心操作逻辑
          ["<space>"] = { "toggle_node", nowait = false },
          ["o"] = { "open", nowait = true },
          ["<cr>"] = "open",
          ["l"] = "open",
          ["<2-LeftMouse>"] = "open",
          ["h"] = "close_node",

          -- 分屏与窗口控制
          ["S"] = "open_split",              -- 水平分屏打开
          ["s"] = "open_vsplit",             -- 垂直分屏打开
          ["t"] = "open_tabnew",             -- 在新标签页打开
          ["w"] = "open_with_window_picker", -- 唤起窗口选择器

          -- 文件系统管理
          ["a"] = { "add", config = { show_path = "none" } }, -- 新建文件
          ["A"] = "add_directory",                            -- 新建文件夹
          ["d"] = "delete",                                   -- 删除
          ["r"] = "rename",                                   -- 重命名（会联动 LSP）
          ["c"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["m"] = "move",

          -- 预览功能
          ["P"] = { "toggle_preview", config = { use_float = true } },

          -- 视图与刷新
          ["R"] = "refresh",
          ["q"] = "close_window",
          ["?"] = "show_help",
        }
      }
    },
    -- config 会在插件加载后运行：这里处理全局变量和 setup 初始化
    config = function(_, opts)
      -- 定义诊断图标，保持终端环境的视觉整洁
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.INFO]  = '',
            [vim.diagnostic.severity.HINT]  = '󰌵',
          },
        }
      })

      -- 将上方的 opts 表传入 setup
      require("neo-tree").setup(opts)
      local function set_neotree_hl()
        -- 直接重新定义，不设置 bg（背景），默认就是透明背景
        vim.api.nvim_set_hl(0, "NeoTreeCursorLine", {
          underline = true,
          bold = true,
          -- 下面这行是可选的：如果你想让下划线有特定的颜色（比如蓝色），可以取消注释
          -- sp = "#89b4fa"
        })
      end

      -- 立即执行
      set_neotree_hl()

      -- 监听主题切换，防止切换主题后高亮被覆盖重置
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = set_neotree_hl,
      })
    end,
  },

  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      explorer = {
        {
          replace_netrw = true, -- Replace netrw with the snacks explorer
          trash = true,         -- Use the system trash when deleting files
        }
      },
    },
    keys = {
      { "<leader>e", function() Snacks.explorer() end, desc = "打开文件树" },
    }
  }
}
