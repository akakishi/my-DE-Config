vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use { "wbthomason/packer.nvim" }
	use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.x",
        requires = {{ "nvim-lua/plenary.nvim" }}
    }
	use { "catppuccin/nvim", as = "catppuccin" }
	use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
	use { "nvim-treesitter/playground" }
	use {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        requires = {{"nvim-lua/plenary.nvim"}}
    }
	use { "theprimeagen/vim-be-good" }
	use { "mbbill/undotree" }
	use { "tpope/vim-fugitive" }
	use {
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{"neovim/nvim-lspconfig"},
			{"williamboman/mason.nvim"},
			{"williamboman/mason-lspconfig.nvim"},

			-- Autocompletion
			{"hrsh7th/nvim-cmp"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"saadparwaiz1/cmp_luasnip"},
			{"hrsh7th/cmp-nvim-lsp"},
			{"hrsh7th/cmp-nvim-lua"},

			-- Snippets
			{"L3MON4D3/LuaSnip"},
			{"rafamadriz/friendly-snippets"}
		}
	}
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use { "vim-airline/vim-airline" }
    use {
        "vim-airline/vim-airline-themes",
        run = ":AirlineTheme catppuccin"
    }
    use { "rust-lang/rust.vim" }
    use { "eandrju/cellular-automaton.nvim" }
    use {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }
end)
