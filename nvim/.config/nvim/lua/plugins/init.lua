return {
  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup { options = { theme = "tokyonight" } }
    end,
  },

-- which-key with icons
{
  "folke/which-key.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- for filetype/buffer icons
    "echasnovski/mini.icons",      -- optional icon support for which-ke
  },
  config = function()
    local wk = require("which-key")
    wk.setup()
    wk.register({
        ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find File" },
        ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
        ["<leader>fr"] = { "<cmd>Telescope oldfiles<CR>", "Recent Files" },
        ["<leader>fe"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },

        ["<leader>ld"] = { vim.lsp.buf.definition, "Go to Definition" },
        ["<leader>lr"] = { vim.lsp.buf.references, "References" },
        ["<leader>lh"] = { vim.lsp.buf.hover, "Hover" },
        ["<leader>lf"] = { function() vim.lsp.buf.format({ async = true }) end, "Format" },

        ["<leader>gs"] = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
        ["<leader>gr"] = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
        ["<leader>gp"] = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
        ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "Checkout Branch" },

        ["<leader>bn"] = { "<cmd>enew<CR>", "New Buffer" },
        ["<leader>bd"] = { "<cmd>bd<CR>", "Delete Buffer" },
        ["<leader>bl"] = { "<cmd>ls<CR>", "List Buffers" },
    })
  end,
},

  -- Quality-of-life
  { "windwp/nvim-autopairs", config = true },
  { "numToStr/Comment.nvim", config = true },
}

