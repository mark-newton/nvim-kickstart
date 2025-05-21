return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        enable_cmp_source = true,
        virtual_text = {
          enabled = false,
          manual = false,
          -- A mapping of filetype to true or false, to enable virtual text.
          filetypes = {
            bash = true,
            python = true,
            php = true,
          },
          default_filetype_enabled = false,
          idle_delay = 75,
          virtual_text_priority = 65535,
          map_keys = true,
          accept_fallback = nil,
          key_bindings = {
            accept = "<Tab>",
            accept_word = false,
            accept_line = false,
            clear = false,
            next = "<Right>",
            prev = "<M-[>",
          }
        }
      })
    end,
  },

  { -- requires ANTHROPIC_API_KEY or OPENAI_API_KEY setup in env
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      provider = "claude",
      openai = {
        --model = "gpt-4o",
        model = "gpt-4o-mini",
      },
      claude = {
        model = "claude-3-7-sonnet-latest",
        --model = "claude-3-5-sonnet-20241022",
        disable_tools = true,
      },
      mappings = {
        edit = "<leader>ae"
      },
      hints = { enabled = true },
      behavior = { enable_claude_text_editor_tool_mode = false },
      windows = {
        ask = { start_insert = false, border = "rounded" },
        edit = { border = "rounded" },
      },
      system_prompt = [[
        Important user preferences:
        - Never add or remove code comments unless I ask for it. Instead, make
          your code self-explanatory using good variable names and semantics.
        - If the language allows it, make full use of static typing and
          inference.
        - If you need to provide a summary of what we've done, make it
          extremely concise regardless of what you've been asked to do before.
        - Never spend any words to say why your solution is good at the end of
          your response.
      ]],
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
      "echasnovski/mini.icons",
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    init = function()
      -- Recommended option
      -- views can only be fully collapsed with the global statusline
      vim.o.laststatus = 3
    end,
  },
}
