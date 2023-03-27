local lualine_ok, lualine = pcall(require, "lualine");

if lualine_ok then
    lualine.setup()

    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
    if not is_windows then
        local xresources_ok, _ = pcall(require, "xresources")

        if xresources_ok then
            vim.cmd.colorscheme("xresources")
        end
    end
end
