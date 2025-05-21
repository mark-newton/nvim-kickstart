return {

  {
    'folke/which-key.nvim',
    opts = {
      delay = 500,
      win = {
        border = 'rounded', -- none, single, double, shadow
      },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      preview_config = { border = 'rounded' },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "bash", "lua", "php", "html", "blade", "css", "python", "markdown", "markdown_inline" },
      auto_install = true,
      ignore_install = { "haskell" },
      highlight = {
        enable = true,
        disable = { "python" },
        additional_vim_regex_highlighting = false,
      },
      autopairs = { enable = true, },
      indent = { enable = true, disable = { 'ruby', 'php' } },
      matchup = { enable = true, },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>", -- set to `false` to disable one of the mappings
          node_incremental = "<Enter>",
          scope_incremental = false,
          node_decremental = "<Backspace>",
        },
      },
    },
    -- to see default folds go to https://github.com/nvim-treesitter/nvim-treesitter/tree/master/queries
    --[[ (function_definition)
    (interface_declaration)
    (trait_declaration)
    (function_static_declaration)
    (method_declaration) ]]
    require("vim.treesitter.query").set(
      "php",
      "folds",
      [[
      [
      (method_declaration)
      ] @fold
      ]]
    )
  },

}
