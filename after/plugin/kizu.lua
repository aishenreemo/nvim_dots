pcall(require, "kizu")

if os.getenv("TMUX") then
    vim.cmd.highlight("Normal guifg=#c5c8c9 guibg=none")
end
