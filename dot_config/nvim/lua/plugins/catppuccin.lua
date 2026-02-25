return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        telescope = true,
        which_key = true,
        mini = true,
        treesitter = true,
        native_lsp = { enabled = true },
      },
      -- Give distinct colors to different C# (and general) type kinds
      custom_highlights = function(colors)
        return {
          ["@lsp.type.class"]       = { fg = colors.yellow },    -- classes
          ["@lsp.type.struct"]      = { fg = colors.teal },      -- structs
          ["@lsp.type.enum"]        = { fg = colors.peach },     -- enums
          ["@lsp.type.interface"]   = { fg = colors.green },     -- interfaces
          ["@lsp.type.namespace"]   = { fg = colors.mauve },     -- namespaces
          ["@lsp.type.enumMember"]  = { fg = colors.lavender },  -- enum values
          -- Class-level members (fields, properties, events) → sapphire
          ["@lsp.type.field"]                      = { fg = colors.sapphire },
          ["@lsp.type.fieldName"]                  = { fg = colors.sapphire }, -- OmniSharp uses fieldName
          ["@lsp.type.fieldName.cs"]               = { fg = colors.sapphire },
          ["@lsp.type.property"]                   = { fg = colors.sapphire },
          ["@lsp.type.event"]                      = { fg = colors.sapphire },
          ["@lsp.typemod.field.readonly"]           = { fg = colors.sapphire },
          ["@lsp.typemod.field.static"]             = { fg = colors.sapphire },
          ["@lsp.typemod.fieldName.readonly"]       = { fg = colors.sapphire },
          ["@lsp.typemod.fieldName.static"]         = { fg = colors.sapphire },
          ["@lsp.typemod.property.readonly"]        = { fg = colors.sapphire },
          ["@lsp.typemod.property.static"]          = { fg = colors.sapphire },
          -- Local scope (local vars, parameters) → maroon
          ["@lsp.type.variable"]                   = { fg = colors.maroon },
          ["@lsp.type.parameter"]                  = { fg = colors.maroon },
          ["@lsp.typemod.variable.readonly"]        = { fg = colors.maroon },
          ["@lsp.typemod.parameter.readonly"]       = { fg = colors.maroon },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
