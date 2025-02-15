return {
  "tiagovla/tokyodark.nvim",
  opts = {
    gamma = 1.0, 
    transparent_background = false,
    styles = {
      comments = { italic = true },
      keywords = { italic = false },
      identifiers = { italic = false },
      functions = {},
      variables = {},
    },
    custom_highlights = function(highlights, palette)
      return highlights
    end,
    terminal_colors = true,
  },
  config = function(_, opts)
    require("tokyodark").setup(opts)
    vim.cmd [[colorscheme tokyodark]]

  end,

}

