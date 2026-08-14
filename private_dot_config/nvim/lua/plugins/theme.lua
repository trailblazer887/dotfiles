return {
  -- 添加 base16-nvim 主题插件
  {
    "wincent/base16-nvim",
    lazy = false,      -- 确保在启动时加载
    priority = 1000,   -- 保证在其它插件之前加载
    config = function()
      -- 设置配色为 gruvbox-dark-hard
      vim.cmd([[colorscheme gruvbox-dark-hard]])
      vim.o.background = 'dark'
      
      -- 让窗口分隔线颜色暗一点
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = 1250067 })
      
      -- 让注释（Comment）的颜色更明显（使用 Boolean 配色）
      local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
      vim.api.nvim_set_hl(0, 'Comment', bools)
      
      -- 让 LSP 签名参数高亮更清晰（使用 PMenu 配色）
      local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
      vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', {
        fg = marked.fg,
        bg = marked.bg,
        ctermfg = marked.ctermfg,
        ctermbg = marked.ctermbg,
        bold = true
      })

	  -- 变量名的颜色
      vim.api.nvim_set_hl(0, 'Identifier', { fg = '#d5c4a1'})

      
    end,
  },
}
