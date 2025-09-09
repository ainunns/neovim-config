-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Copy/paste conveniences
-- Yank to system clipboard with <leader>y and <leader>Y
map({ "n", "v" }, "<leader>y", "+y", { desc = "Yank to system clipboard" })
map("n", "<leader>Y", "+Y", { desc = "Yank line to system clipboard" })

-- Paste from system clipboard with <leader>p and <leader>P
map({ "n", "v" }, "<leader>p", "+p", { desc = "Paste from system clipboard" })
map({ "n", "v" }, "<leader>P", "+P", { desc = "Paste before from system clipboard" })

-- Keep default p behavior from black-holing when pasting over selection
map("x", "p", '"_dP', { desc = "Paste without yanking selection" })
