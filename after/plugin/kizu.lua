pcall(require, "kizu")

vim.keymap.set("n", "<leader>-", "<cmd>hi Normal guifg=#c5c8c9 guibg=none<CR>")
vim.keymap.set("n", "<leader>=", "<cmd>hi Normal guifg=#c5c8c9 guibg=#0b0f10<CR>")

if os.getenv("TMUX") then
    vim.cmd.highlight("Normal guifg=#c5c8c9 guibg=none")
end
