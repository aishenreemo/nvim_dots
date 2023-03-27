local lualine_ok, lualine = pcall(require, "lualine");

if lualine_ok then
    lualine.setup()

    local xresources_ok, _ = pcall(require, "xresources")

    if xresources_ok then
        vim.cmd.colorscheme("xresources")
    end
end
