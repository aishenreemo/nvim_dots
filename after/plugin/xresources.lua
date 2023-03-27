local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
if not is_windows then
    local ok, xresources = pcall(require, "xresources");

    if ok then
        vim.api.nvim_set_hl(0, "Directory", {
            fg = xresources.blue,
            bg = xresources.bg,
            ctermfg = "blue",
        })
    end
end
