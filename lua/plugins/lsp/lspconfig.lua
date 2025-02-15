return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end

      local map = function(keys, func, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
      map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
      map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
      map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
      map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
      map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", "n")
      map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    end
    local border = "rounded"
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = border })

    mason_lspconfig.setup_handlers({
      function(server)
        nvim_lsp[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        nvim_lsp["lua_ls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["cssls"] = function()
        nvim_lsp["cssls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["tailwindcss"] = function()
        nvim_lsp["tailwindcss"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["html"] = function()
        nvim_lsp["html"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["jsonls"] = function()
        nvim_lsp["jsonls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["eslint"] = function()
        nvim_lsp["eslint"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["pyright"] = function()
        nvim_lsp["jedi_language_server"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
    })
  end,
}
