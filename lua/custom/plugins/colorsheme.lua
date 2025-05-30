return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('kanagawa').setup {
        compile = false,
        dimInactive = false,
        transparent = true,
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        overrides = function(colors)
          local theme = colors.theme
          local palette = colors.palette
          return {

            PmenuSel = { blend = 0 },
            NormalFloat = { bg = 'none' },
            FloatBorder = { bg = palette.sumiInk1 },
            FloatTitle = { bg = 'none' },
            CursorLineNr = { bg = theme.ui.bg_p2 },
            Visual = { bg = palette.waveBlue2 },

            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

            WinSeparator = { fg = palette.waveBlue2 },
            Folded = { bg = 'none' },
            MiniIndentscopeSymbol = { fg = theme.ui.bg },
            CursorLine = { bg = theme.ui.bg },

            TelescopePromptBorder = { fg = palette.sumiInk6, bg = palette.sumiInk1 },
            TelescopeResultsBorder = { fg = palette.sumiInk6, bg = palette.sumiInk1 },
            TelescopePreviewBorder = { fg = palette.sumiInk6, bg = palette.sumiInk1 },
          }
        end,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
      }
      -- require('kanagawa').load 'wave'
    end,
  },
  {
    'webhooked/kanso.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanso').setup {
        compile = false,
        dimInactive = false,
        disableItalics = true,
        transparent = true,
        overrides = function(colors)
          local theme = colors.theme
          local palette = colors.palette
          return {

            -- float borders use; white: oldWhite, blue: zenBlue2
            PmenuSel = { blend = 0 },
            NormalFloat = { bg = 'none' },
            FloatBorder = { fg = palette.oldWhite, bg = 'none' },
            FloatTitle = { bg = 'none' },
            Visual = { bg = palette.zenBlue2 },

            WinSeparator = { fg = palette.zenBlue2 },
            Folded = { bg = 'none' },
            MiniIndentscopeSymbol = { fg = theme.ui.bg_p2 },
            CursorLine = { bg = theme.ui.bg_p1 },
            -- NormalNC = { bg = palette.zen0 }, -- enable for inactive dim

            TelescopePromptBorder = { fg = palette.oldWhite, bg = 'none' },
            TelescopeResultsBorder = { fg = palette.oldWhite, bg = 'none' },
            TelescopePreviewBorder = { fg = palette.oldWhite, bg = 'none' },

            PounceMatch = { fg = theme.ui.fg_reverse, bg = theme.diag.warning },
          }
        end,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none',
              },
            },
          },
        },
      }
      require('kanso').load 'ink'
    end,
  },
}
