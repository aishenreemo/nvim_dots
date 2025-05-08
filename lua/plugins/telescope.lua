local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>tt", function() builtin.builtin({ initial_mode = "normal" }) end,
    { desc = "Telescope Builtins" })
vim.keymap.set("n", "<leader>te", function() builtin.find_files({ initial_mode = "normal" }) end,
    { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>tg", function() builtin.git_files({ initial_mode = "normal" }) end,
    { desc = "Telescope Git Files" })
vim.keymap.set("n", "<leader>tl", function() builtin.live_grep({ initial_mode = "normal" }) end,
    { desc = "Telescope Live Grep" })
vim.keymap.set("n", "<leader>tb", function() builtin.buffers({ initial_mode = "normal" }) end,
    { desc = "Telescope Buffers" })
vim.keymap.set("n", "<leader>th", function() builtin.help_tags({ initial_mode = "normal" }) end,
    { desc = "Telescope Help Tags" })
