vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>")

-- replace thingy but dont copy the deleted thing in clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- rename a variable
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- resizing windows
vim.keymap.set("n", "<C-S-Up>", "<cmd>:resize +2<CR>")
vim.keymap.set("n", "<C-S-Down>", "<cmd>:resize -2<CR>")
vim.keymap.set("n", "<C-S-Left>", "<cmd>:vertical resize +2<CR>")
vim.keymap.set("n", "<C-S-Right>", "<cmd>:vertical resize -2<CR>")

-- lsp
vim.keymap.set("n", "<leader>p", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- nvim rich presence
vim.keymap.set("n", "<leader>r", "<cmd>lua package.loaded.presence:update()<CR>")
