return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = {
      view = "cmdline",
    },
    views = {
      cmdline_popup = {
        position = {
          -- row = 11,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        win_options = {
          winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
        },
      },
      hover = {
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          -- row = 14,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
        },
      },
      mini = {
        timeout = 4000,
        win_options = {
          winblend = 0,
        },
      },
    },
    lsp = {
      hover = { enabled = false },
      signature = { enabled = false },
    },
    presets = {
      bottom_search = true,
      long_message_to_split = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
