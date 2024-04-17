vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ll", vim.cmd.Lazy)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set({ "n", "i" }, "<C-s>", "<C-c>:w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true, silent = true })
--vim.keymap.set("n", "<C-w>", ":bd<CR>", { noremap = true, silent = true })
