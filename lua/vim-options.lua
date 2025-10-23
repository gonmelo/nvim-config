vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "120"

vim.keymap.set("n", "<leader>e", ":Ex<CR>", { noremap = true, silent = true, desc = "Toggle netrw"})
vim.keymap.set({"n", "v"}, "d", '"_d', { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "D", '"_D', { noremap = true, silent = true })
