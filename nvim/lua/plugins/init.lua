return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
	"nvim-treesitter/playground",
	"theprimeagen/vim-be-good",
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets"
		}
	},
    "rust-lang/rust.vim",
    "eandrju/cellular-automaton.nvim",
    "prichrd/netrw.nvim",
    "nvim-tree/nvim-web-devicons",
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    }
}
