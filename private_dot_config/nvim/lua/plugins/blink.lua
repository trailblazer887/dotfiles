return {
	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				-- Tab 键采纳当前选中的补全项
				["<Tab>"] = { "accept", "fallback" },
				-- Ctrl+j 选择下一个候选项
				["<C-j>"] = { "select_next", "fallback" },
				-- Ctrl+k 选择上一个候选项
				["<C-k>"] = { "select_prev", "fallback" },
			},
			completion = {
				ghost_text = {
					enabled = false -- 关闭幽灵文本
				},
				documentation = {
					auto_show = false  -- 关闭文档自动显示
				}
			}
		},
	},
}
