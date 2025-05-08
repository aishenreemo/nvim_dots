require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer" },
})

require("lazydev").setup()

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- require("snippy").expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

            -- For `mini.snippets` users:
            -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
            -- insert({ body = args.body }) -- Insert at cursor
            -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
            -- require("cmp.config").set_onetime({ sources = {} })
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<A-h>"] = cmp.mapping(function() luasnip.jump(-1) end),
        ["<A-l>"] = cmp.mapping(function() luasnip.expand_or_jump() end),
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })),
        ["<C-h>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-l>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- { name = "vsnip" }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = "ultisnips" }, -- For ultisnips users.
        -- { name = "snippy" }, -- For snippy users.
    }, {
        { name = "buffer" },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        { name = "cmdline" }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

require("lspconfig").rust_analyzer.setup({
    capabilities = capabilities,
})

vim.diagnostic.config({
    virtual_text = true
})

vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, { remap = false, desc = "LSP Format buffer." })
vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end,
    { remap = false, desc = "LSP Go to definition" })
vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, { remap = false, desc = "LSP Hover cursor" })
vim.keymap.set("n", "<leader>lw", function() vim.lsp.buf.workspace_symbol() end,
    { remap = false, desc = "LSP Workspace symbols" })
vim.keymap.set("n", "<leader>lc", function() vim.lsp.buf.code_action() end,
    { remap = false, desc = "LSP Show code actions" })
vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end,
    { remap = false, desc = "LSP Show references" })
vim.keymap.set("n", "<leader>lm", function() vim.lsp.buf.rename() end, { remap = false, desc = "LSP Rename identifier" })

vim.keymap.set("n", "<leader>lo", function() vim.diagnostic.open_float() end,
    { remap = false, desc = "LSP Show diagnostics" })
vim.keymap.set("n", "<leader>]", function()
    vim.diagnostic.jump({ count = 1 })
end, { remap = false, desc = "LSP Next diagnostic" })
vim.keymap.set("n", "<leader>[", function()
    vim.diagnostic.jump({ count = -1 })
end, { remap = false, desc = "LSP Previous diagnostic" })
