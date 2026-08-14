-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- kj 退出插入模式（相当于 ESC）
map("i", "kj", "<esc>", { desc = "Exit Insert Mode with kj" })

-- 按空格退出可视模式
map("x", "<space>", "<esc>", { desc = "Exit Visual Mode with Space" })
