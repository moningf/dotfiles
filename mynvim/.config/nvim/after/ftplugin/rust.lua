local bufnr = vim.api.nvim_get_current_buf()
local map = vim.keymap.set

map("n", "<leader>rr", function() vim.cmd.RustLsp("runnables") end, { silent = true, buffer = bufnr, desc = "Rust: runnables" })
map("n", "<leader>rc", function() vim.cmd.RustLsp("run") end, { silent = true, buffer = bufnr, desc = "Rust: run" })
map("n", "<leader>rt", function() vim.cmd.RustLsp("testables") end, { silent = true, buffer = bufnr, desc = "Rust: testables" })
map("n", "<leader>rd", function() vim.cmd.RustLsp("debuggables") end, { silent = true, buffer = bufnr, desc = "Rust: debuggables" })
map("n", "<leader>ca", function() vim.cmd.RustLsp("codeAction") end, { silent = true, buffer = bufnr, desc = "Code Action" })
map("n", "K", function() vim.cmd.RustLsp({ "hover", "actions" }) end, { silent = true, buffer = bufnr, desc = "Hover Actions" })
map("n", "<leader>rn", vim.lsp.buf.rename, { silent = true, buffer = bufnr, desc = "Rename" })
map("n", "<leader>th", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { silent = true, buffer = bufnr, desc = "Toggle Inlay Hints" })
