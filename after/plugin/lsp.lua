local ok, lsp = pcall(require, "lsp-zero");

if ok then
    lsp.preset("recommended")

    lsp.ensure_installed({
        "rust_analyzer",
        "lua_ls",
    })

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ["<A-h>"] = cmp.mapping(function() luasnip.jump(-1) end),
        ["<A-l>"] = cmp.mapping(function() luasnip.expand_or_jump() end),
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(cmp_select)),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(cmp_select)),
        ["<C-h>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-l>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })

    cmp_mappings["<Tab>"] = nil
    cmp_mappings["<S-Tab>"] = nil

    cmp.setup({
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        mapping = cmp_mappings,
        sources = cmp.config.sources({
            { name = "nvim_lua" },
            { name = "luasnip" },
        }),
    })

    cmp.setup.filetype("yagpdbcc", {
        sources = cmp.config.sources({
            { name = "yagpdb-cc" },
        })
    })

    lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = "E",
            warn = "W",
            hint = "H",
            info = "I"
        }
    })

    lsp.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>lw", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>lo", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>]", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>[", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>lm", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    require "lspconfig".lua_ls.setup {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }

    lsp.setup()

    vim.diagnostic.config({
        virtual_text = true
    })
end
