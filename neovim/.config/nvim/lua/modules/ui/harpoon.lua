local harpoon = require("harpoon")

local M = {}


M.setup = function()
  harpoon:setup()

  vim.keymap.set("n", "<leader>a", function() harpoon:list():prepend() end,
    { noremap = true, silent = true, desc = 'Harpoon Prepend' })
  vim.keymap.set("n", "<leader>A", function() harpoon:list():append() end,
    { noremap = true, silent = true, desc = 'Harpoon Add' })
  vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { noremap = true, silent = true, desc = 'Harpoon menu' })

  -- :list():removeAt(3)
  --
  vim.keymap.set("n", "<leader>y", function() harpoon:list():select(1) end,
    { noremap = true, silent = true, desc = 'Harpoon 1' })
  vim.keymap.set("n", "<leader>u", function() harpoon:list():select(2) end,
    { noremap = true, silent = true, desc = 'Harpoon 2' })
  vim.keymap.set("n", "<leader>i", function() harpoon:list():select(3) end,
    { noremap = true, silent = true, desc = 'Harpoon 3' })
  vim.keymap.set("n", "<leader>o", function() harpoon:list():select(4) end,
    { noremap = true, silent = true, desc = 'Harpoon 4' })
end

return M
