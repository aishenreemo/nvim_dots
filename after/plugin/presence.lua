local ok, presence = pcall(require, "presence")

if ok then
    presence.setup({
        auto_update         = true,
        neovim_image_text   = "who needs an ide?",
        main_image          = "neovim",
        log_level           = nil,
        debounce_timeout    = 10,
        enable_line_number  = true,
        blacklist           = {},
        buttons             = true,
        file_assets         = {},
        show_time           = false,
        editing_text        = "editing %s",
        file_explorer_text  = "browsing %s",
        git_commit_text     = "committing changes",
        plugin_manager_text = "managing plugins",
        reading_text        = "reading %s",
        workspace_text      = "working on %s",
        line_number_text    = "line %s out of %s",
    })

    vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function ()
            presence:update()
        end
    })
end
