local ok, bufferline = pcall(require, "bufferline")

if ok then
    bufferline.setup({})
    vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>")
    vim.keymap.set("n", "<leader>bp", "<cmd>bp<CR>")
    vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>")
end
