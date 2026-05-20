-- 监听主题加载事件，确保我们的颜色覆盖不会被主题重置
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- 1. 修复 Neovim 全局的非活动窗口变色问题
    vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })

    -- 2. 修复 Edgy 插件接管的侧边栏变色问题
    vim.api.nvim_set_hl(0, "EdgyNormalNC", { link = "EdgyNormal" })

    -- 3. 顺手修复一下 NvimTree 可能自带的非活动高亮
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { link = "NvimTreeNormal" })
  end,
})

-- 注意：如果你的配置是按模块加载的，为了确保立即生效，
-- 可以在下方直接先执行一次覆盖：
vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })
vim.api.nvim_set_hl(0, "EdgyNormalNC", { link = "EdgyNormal" }) --
