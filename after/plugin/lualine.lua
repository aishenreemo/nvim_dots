local ok, lualine = pcall(require, "lualine");

if ok then
    lualine.setup()
    local xok, _ = pcall(require, "xresources")

    if xok then
        vim.cmd.colorscheme("xresources")
    end
end
