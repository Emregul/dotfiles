return {
  "Wansmer/symbol-usage.nvim",
  event = "LspAttach",
  config = function()
    require("symbol-usage").setup({
      text_format = function(symbol)
        local fragments = {}

        if symbol.references then
          local usage = symbol.references <= 1 and "1 ref" or symbol.references .. " refs"
          table.insert(fragments, usage)
        end

        if symbol.definition then
          table.insert(fragments, symbol.definition .. " defs")
        end

        if symbol.implementation then
          table.insert(fragments, symbol.implementation .. " impls")
        end

        return table.concat(fragments, ", ")
      end,
    })
  end,
}
