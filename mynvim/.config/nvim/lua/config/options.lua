local opt = vim.opt
vim.g.mapleader = " "

-- 行号
opt.number = true
opt.relativenumber = true

-- 缩进与空格 tab & indentation
opt.tabstop = 2         -- 一个Tab字符占据的宽度
opt.shiftwidth = 2      --每一级缩进的空格数
opt.expandtab = true    --将Tab转化为空格
opt.breakindent = true  -- 折行缩进
-- opt.wrap = false -- 禁止自动包裹
opt.wrap = true         -- 禁止自动包裹
-- 三大缩进算法(使用Tree-sitter处理缩进)
opt.autoindent = true   -- 自动缩进，当换行时，新一行自动对齐到上一行起始位置
opt.smartindent = false -- 智能缩进，根据代码语法自动增加下一行的缩进
opt.cindent = false     --  开启 C语言风格自动缩进
-- 搜索
opt.ignorecase = true   -- 忽略大小写
opt.smartcase = true    -- 如果使用大小写混用，则不忽略

-- 外观 Appearance
opt.termguicolors = true  --支持24位真彩色
opt.background = "dark"
opt.cursorline = true     --显示光标行
opt.signcolumn = "yes"    -- 始终显示左侧的标记列，显示git或lsp的错误提示
opt.winborder = "rounded" -- 窗口边框 "single"

-- 退格删除
opt.backspace = "indent,eol,start"

-- 系统设置
opt.clipboard:append("unnamedplus") -- 剪切板
opt.updatetime = 200                -- 200ms后自动写入swap文件
opt.timeoutlen = 300                -- 超时300ms后继续响应

-- 窗口规则
opt.splitright = true -- 新窗口默认在右侧
opt.splitbelow = true -- 新窗口默认在下方

-- 禁用 Neovim 内置的文件浏览器
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 代码折叠
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- vim.diagnostic.config({
--   virtual_text = true,      -- 显示报错/警告文本
--   signs = true,             -- 左侧图标
--   underline = true,         -- 波浪线
--   update_in_insert = false, -- 不在 insert 模式更新
-- })
