-- 把当前 buffer 直接挪到标签栏的任意位置
--   <leader>bm  插入式（拖拽语义）
--   <leader>bM  交换式
--
-- 注意：bufferline 自带的 move_to() 语义是「交换」不是「插入」，
-- 所以插入式是把相邻交换循环出来实现的。

--- 标签栏元素，按显示顺序
local function elements()
  local got = require("bufferline").get_elements()
  return got.elements or got -- 兼容旧版直接返回 list
end

--- 当前 buffer 在标签栏里的序号（从 1 开始）
---@param list table[]
---@return integer?
local function current_index(list)
  local cur = vim.api.nvim_get_current_buf()
  for i, item in ipairs(list) do
    if item.id == cur then
      return i
    end
  end
end

--- 插到第 pos 位，中间的被顺延
---@param pos integer
local function move_to_position(pos)
  local bl = require("bufferline")
  local list = elements()
  local from = current_index(list)
  if not from then
    return vim.notify("当前 buffer 不在标签栏里", vim.log.levels.WARN)
  end

  pos = math.max(1, math.min(pos, #list))
  if pos == from then
    return
  end

  local step = pos > from and 1 or -1
  for i = 1, math.abs(pos - from) do
    bl.move_to(from + step * i)
  end
end

--- 与第 pos 位互换
---@param pos integer
local function swap_with_position(pos)
  local bl = require("bufferline")
  local list = elements()
  local from = current_index(list)
  if not from then
    return vim.notify("当前 buffer 不在标签栏里", vim.log.levels.WARN)
  end

  pos = math.max(1, math.min(pos, #list))
  if pos ~= from then
    bl.move_to(pos, from)
  end
end

--- 弹位置列表，选中后执行 action(idx)
---@param action fun(pos: integer)
---@param prompt string
local function pick_position(action, prompt)
  local list = elements()
  local from = current_index(list)
  if not from then
    return vim.notify("当前 buffer 不在标签栏里", vim.log.levels.WARN)
  end

  local items = {}
  for i, item in ipairs(list) do
    items[i] = {
      idx = i,
      text = string.format("%s%d  %s", i == from and "» " or "  ", i, item.name or ("#" .. item.id)),
    }
  end

  vim.ui.select(items, {
    prompt = string.format("%s（当前第 %d 个 / 共 %d 个）", prompt, from, #list),
    format_item = function(it)
      return it.text
    end,
  }, function(choice)
    if choice then
      action(choice.idx)
    end
  end)
end

return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "<leader>bm",
        function()
          pick_position(move_to_position, "移动当前 buffer 到位置")
        end,
        desc = "Move Buffer to Position",
      },
      {
        "<leader>bM",
        function()
          pick_position(swap_with_position, "当前 buffer 与位置交换")
        end,
        desc = "Swap Buffer with Position",
      },
    },
  },
}
