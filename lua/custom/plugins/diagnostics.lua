return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy', -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require('tiny-inline-diagnostic').setup {
      preset = 'classic',
      transparent_bg = true,
      transparent_cursorline = false, -- Set the background of the cursorline to transparent (only one the first diagnostic)
      hi = {
        error = 'DiagnosticSignError',
        warn = 'DiagnosticSignWarn',
        info = 'DiagnosticSignInfo',
        hint = 'DiagnosticSignHint',
      },
    }
    vim.diagnostic.config {
      severity_sort = true,
      update_in_insert = false,
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '●',
          [vim.diagnostic.severity.WARN] = '●',
          [vim.diagnostic.severity.INFO] = '●',
          [vim.diagnostic.severity.HINT] = '●',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
          [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
      },
    }
  end,
}
