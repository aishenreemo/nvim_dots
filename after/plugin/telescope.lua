local ok, builtin = pcall(require, "telescope.builtin")

if ok then
    vim.keymap.set("n", "<leader>tt", function() builtin.builtin({ initial_mode = "normal" }) end, {})
    vim.keymap.set("n", "<leader>te", function() builtin.find_files({ initial_mode = "normal" }) end, {})
    vim.keymap.set("n", "<leader>tg", function() builtin.git_files({ initial_mode = "normal" }) end, {})
    vim.keymap.set("n", "<leader>tl", function() builtin.live_grep({ initial_mode = "normal" }) end, {})
    vim.keymap.set("n", "<leader>tb", function() builtin.buffers({ initial_mode = "normal" }) end, {})
    vim.keymap.set("n", "<leader>th", function() builtin.help_tags({ initial_mode = "normal" }) end, {})
end
