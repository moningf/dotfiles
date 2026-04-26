local map = vim.keymap.set

-------------------有用的快捷键-----------------
--写入，关闭当前窗口
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>Q", "<cmd>q!<cr>")

-- 打开Lazy,Mason窗口
map("n", "<leader>l", "<cmd>Lazy<cr>")
map("n", "<leader>m", "<cmd>Mason<cr>")

-- 清除高亮
map("n", "<leader>h", "<cmd>nohlsearch<cr>")

-- 显示诊断内容
-- map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic", })

-- 缓冲区切换
-- map("n", "<C-,>", "<cmd>BufferPrevious<cr>")
-- map("n", "<C-.>", "<cmd>BufferNext<cr>")

-------------------窗口配置----------------------
-- 窗口切换
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- 窗口分割
map("n", "<leader>-", "<cmd>split<cr>", { desc = " splist" })
map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = " splist" })
