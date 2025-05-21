return {
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
    init = function()
      for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
        dofile(vim.g.base46_cache .. v)
      end
      vim.cmd.colorscheme 'nvchad'
    end,
  },
  { "nvchad/volt" },
}
