-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      delay = 1000,
    })
  end,
}
