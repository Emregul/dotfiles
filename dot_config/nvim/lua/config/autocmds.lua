-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Recompile catppuccin after Lazy updates (prevents stale cache causing missing highlights)
vim.api.nvim_create_autocmd("User", {
  pattern = { "LazyUpdate", "LazySync" },
  callback = function()
    require("catppuccin").compile()
    vim.cmd.colorscheme(vim.g.colors_name)
  end,
})

-- Fix OmniSharp gd: snacks_picker's LspAttach fires after the dotnet extra's omnisharp_extended
-- keymap, overriding it. We re-override after a delay so we always fire last.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "omnisharp" then
      vim.defer_fn(function()
        vim.keymap.set("n", "gd", function()
          require("omnisharp_extended").lsp_definitions()
        end, { buffer = args.buf, desc = "Goto Definition" })
      end, 100)
    end
  end,
})
