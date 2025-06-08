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
      -- require('kanso').load 'ink'
    end,
  },
  {
    'jwbaldwin/oscura.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('oscura').setup {
        cursorline = vim.o.cursorline,
        transparent_background = true,
        nvim_tree_darker = false,
        undercurl = true,
        treesitter_context_bg = false,
        float_borderless = false,
      }
      vim.cmd.colorscheme 'oscura'
    end,
  },
  { -- NOTE: only need this when the colorscheme doesn't support overrides
    'cwebster2/color-overrides.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local override_reset = {
        'DiffAdd',
        'DiffChange',
        'DiffDelete',
        'DiffText',
        'Folded',
        'MatchParen',
      }
      local override_set = {
        -- kanagawa/kanso: zenblue2 = #2D4F67, oldWhite = #C8C093, inkYellow = #c4b28a
        AvantePromptInput = { guibg = '#15171c', blend = 0 },
        AvantePromptInputBorder = { guibg = '#15171c', guifg = '#68737d' },
        AvanteSidebarWinSeparator = { guibg = 'NONE', guifg = '#68737d' },
        CurSearch = { guibg = '#DCA561', guifg = '#15171c' },
        CursorLine = { guibg = '#1c1e22' },
        DiagnosticSignError = { guifg = '#db4b4b' },
        DiagnosticSignHint = { guifg = '#1abc9c' },
        DiagnosticSignInfo = { guifg = '#0db9d7' },
        DiagnosticSignWarn = { guifg = '#e0af68' },
        DiffAdd = { guibg = '#315532', guifg = '#ffffff' }, -- new line
        DiffChange = { guibg = 'NONE', guifg = '#afd7ff' }, -- change line
        DiffDelete = { guibg = '#713431', guifg = '#ffffff' }, -- del line
        DiffText = { guibg = '#29416f', guifg = '#ffffff' }, -- change text
        FloatBorder = { guibg = 'NONE', guifg = '#68737d' },
        Folded = { guibg = 'NONE' },
        IncSearch = { guibg = '#DCA561', guifg = '#15171c' },
        MatchParen = { guibg = 'NONE', guifg = 'orange' },
        NormalFloat = { guifg = '#68737d', guibg = 'NONE' },
        Pmenu = { guibg = '#223249', guifg = '#dcd7ba' },
        PmenuSbar = { guibg = '#223249' },
        PmenuSel = { guibg = '#2d4f67' },
        PmenuThumb = { guibg = '#2d4f67' },
        BlinkCmpMenuSelection = { guibg = '#2d4f67' },
        Search = { guibg = '#2d4f67', guifg = '#ffffff' },
        Special = { guifg = '#c4b28a' },
        ['@tag.attribute'] = { guifg = '#9099a1' },
        ['@tag.delimiter'] = { guifg = '#c4b28a' },
        ['@type.builtin'] = { guifg = '#c4b28a' },
        TelescopeNormal = { guibg = 'NONE' },
        TelescopePreviewBorder = { guibg = 'NONE', guifg = '#68737d' },
        TelescopePromptBorder = { guibg = 'NONE', guifg = '#68737d' },
        TelescopePromptNormal = { guibg = 'NONE' },
        TelescopePromptTitle = { guibg = 'NONE', guifg = '#FFFFFF' },
        TelescopeResultsBorder = { guibg = 'NONE', guifg = '#68737d' },
        TelescopeTitle = { guibg = 'NONE', guifg = '#FFFFFF' },
        Visual = { guibg = '#2d4f67', guifg = '#FFFFFF' },
        WhichKeyFloat = { guibg = 'NONE' },
        WinSeparator = { guibg = 'NONE', guifg = '#68737d' },
      }
      require('color-overrides').set_overrides(override_reset, override_set)
    end,
  },
}
