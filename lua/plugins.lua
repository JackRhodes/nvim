local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use("editorconfig/editorconfig-vim")
  use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  use("puremourning/vimspector")

  use({
    "glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  })
  use("hrsh7th/nvim-cmp") -- autocompletion framework
  use("hrsh7th/cmp-nvim-lsp") -- LSP autocompletion provide
  use("windwp/nvim-autopairs")
  use("preservim/nerdtree")
  use("andweeb/presence.nvim")
  use({ "yamatsum/nvim-nonicons", requires = { "kyazdani42/nvim-web-devicons" } })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
  use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use("Mofiqul/dracula.nvim")

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })

  use({ "jose-elias-alvarez/null-ls.nvim", config = require("null-ls-setup") })

  use("glepnir/lspsaga.nvim")
  use("vim-test/vim-test")
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  })

  use("Hoffs/omnisharp-extended-lsp.nvim")
  -- autocomplete config
  local cmp = require("cmp")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

  cmp.setup({
    mapping = {
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
    },
    sources = {
      { name = "nvim_lsp" },
    },
  })

  vim.cmd([[colorscheme dracula]])

  vim.g.vimspector_enable_mappings = "HUMAN"

  -- show the '~' characters after the end of buffers
  vim.g.dracula_show_end_of_buffer = true
  -- use transparent background
  vim.g.dracula_transparent_bg = true
  -- set custom lualine background color
  vim.g.dracula_lualine_bg_color = "#44475a"

  require("lualine").setup({
    options = {
      theme = "dracula-nvim",
    },
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
