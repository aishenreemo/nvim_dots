local ok, _ = pcall(require, "undotree")

if ok then
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end
