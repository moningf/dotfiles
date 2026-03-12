local opt = vim.opt

-- 行号
opt.number = true
opt.relativenumber = true

-- tab & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
-- opt.autoindent = true

-- 禁止自动包裹
opt.wrap = false

-- search settings
opt.ignorecase = true -- 忽略大小写
opt.smartcase = true -- 如果使用大小写混用，则不忽略

-- cursorline
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.winborder = "rounded"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true

vim.g.mapleader = " "

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- vim.diagnostic.config({
--   virtual_text = true,      -- 显示报错/警告文本
--   signs = true,             -- 左侧图标
--   underline = true,         -- 波浪线
--   update_in_insert = false, -- 不在 insert 模式更新
-- })
