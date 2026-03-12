local map = vim.keymap.set

-- 清除高亮
map("n", "<leader>h", "<cmd>nohlsearch<cr>")

-- 显示诊断内容
-- map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic", })

-- 缓冲区切换
map("n", "<C-,>", "<cmd>BufferPrevious<cr>")
map("n", "<C-.>", "<cmd>BufferNext<cr>")
