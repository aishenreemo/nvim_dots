local ok, tree = pcall(require, "nvim-tree")

if ok then
    tree.setup()
    vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
end
