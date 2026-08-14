-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 缩进设置
vim.opt.tabstop = 4        -- 一个 Tab 显示为 4 个空格宽度
vim.opt.softtabstop = 4    -- 编辑时按 Tab 插入 4 个空格
vim.opt.shiftwidth = 4     -- 自动缩进（>>、<<）的步长
vim.opt.expandtab = true   -- 将 Tab 转换为空格
-- 关闭 LSP 的 documentHighlight 功能
vim.lsp.handlers["textDocument/documentHighlight"] = function() end
