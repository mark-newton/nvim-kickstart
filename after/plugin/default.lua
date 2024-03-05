-- window management
vim.keymap.set("n", "<leader>v", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>w", "<C-w>w") -- swap to next window
vim.keymap.set("n", "<leader>x", ":close<CR>") -- close current split window

-- function keys
vim.keymap.set("n", "<f2>", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<f3>", ":clo<CR>") -- close current split window
vim.keymap.set("v", "<f5>", "gc") -- close current split window
vim.keymap.set("n", "<f7>", "<C-w>w") -- swap to next window
vim.keymap.set("n", "<f9>", ":set list! list? <CR>") -- toggle

