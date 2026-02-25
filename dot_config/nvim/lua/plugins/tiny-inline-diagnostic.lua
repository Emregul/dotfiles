return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  config = function()
    -- Disable default virtual text since this replaces it
    vim.diagnostic.config({ virtual_text = false })

    require("tiny-inline-diagnostic").setup({
      preset = "modern",
      options = {
        show_source = true,
        throttle = 20,
        softwrap = 30,
        multilines = true,
      },
    })
  end,
}
