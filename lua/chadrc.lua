local M = {}

M.base46 = {
  theme = 'poimandres',
  transparency = false,
  hl_override = {
    Folded = { bg = 'NONE' },
    DiagnosticError = { fg = '#db4b4b' },
    DiagnosticHint = { fg = '#9d7cd8' },
    DiagnosticInfo = { fg = '#0db9d7' },
    DiagnosticWarn = { fg = '#e0af68' },
    Delimiter = { fg = '#303340' },
    DiffAdd = { bg = '#315532', fg = '#ffffff' }, -- new line
    DiffDelete = { bg = '#713431', fg = '#ffffff' }, -- del line
    DiffText = { bg = '#29416f', fg = '#ffffff' }, -- change text
    DiffChange = { bg = 'NONE', fg = '#afd7ff' }, -- change line
  },
}

-- Disabled pending blink integration
M.colorify = {
  enabled = false,
}

M.ui = {

  -- placeholder - only works with nvim-cmp not blink - waiting for updates
  cmp = {
    lspkind_text = true,
    style = 'default', -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true,
    },
  },

  telescope = { style = 'bordered' },

  statusline = {
    enabled = true,
    theme = 'vscode_colored',
    order = { 'mode', 's1', 'path', 'file', 'mod', 'git', '%=', 'lsp_msg', '%=', 'diagnostics', 'lsp', 'cursor', 'cwd' },
    modules = {

      -- partial path (2 dirs)
      s1 = '%#St_lspHints# ',
      path = function()
        local relpath = vim.fn.expand '%:.'
        if relpath == '' or relpath == '.' then
          return ''
        end
        local parts = vim.split(relpath, '/', { trimempty = true })
        table.remove(parts)
        if parts[1] and parts[1]:match '^%.%.?$' then
          if #parts <= 2 then
            return table.concat(parts, '/')
          else
            return parts[1] .. '/' .. table.concat({ unpack(parts, #parts - 1) }, '/')
          end
        end
        if #parts <= 2 then
          return table.concat(parts, '/')
        else
          return '-/' .. table.concat({ unpack(parts, #parts - 1) }, '/')
        end
      end,

      -- file modified flag
      mod = '%#St_lspWarning#%m%#StText#',

      -- cursor location in file
      cursor = '%#StText# Ln %l/%L, Col %v ',
    },
  },

  tabufline = {
    enabled = false,
  },
}

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = '  Find File', keys = 'ff', cmd = 'Telescope find_files' },
    { txt = '  Recent Files', keys = 'fo', cmd = 'Telescope oldfiles' },
    { txt = '󰈭  Find Word', keys = 'fw', cmd = 'Telescope live_grep' },
    { txt = '󱥚  Themes', keys = 'th', cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Lazy", keys = "cl", cmd = "Lazy" },
    { txt = "  Mason", keys = "cm", cmd = "Mason" },
    { txt = '  Mappings', keys = 'ch', cmd = 'NvCheatsheet' },

    { txt = '─', hl = 'NvDashFooter', no_gap = true, rep = true },
    {
      txt = function()
        local stats = require('lazy').stats()
        local ms = math.floor(stats.startuptime) .. ' ms'
        return '  Loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms
      end,
      hl = 'NvDashFooter',
      no_gap = true,
    },
    { txt = '─', hl = 'NvDashFooter', no_gap = true, rep = true },
    {
      txt = function()
        local v = vim.version()
        local nvim_version = string.format('v%d.%d.%d', v.major, v.minor, v.patch)
        return 'Neovim ' .. nvim_version
      end,
      hl = 'NvDashFooter',
      no_gap = true,
    },
  },
}

return M
