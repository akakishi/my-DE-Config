return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        -- function to retrieve file permissions
        local function getFilePermissions()
            if vim.bo.filetype ~= "sh" then
                return "", "#a6e3a1"
            end

            local file_path = vim.fn.expand("%:p")
            if not file_path or file_path == "" then
                return "No File", "#a6e3a1"
            end

            local permissions = vim.fn.getfperm(file_path)
            local owner_permissions = permissions:sub(1, 3)
            local bg_color = (owner_permissions == "rwx") and "#89b4fa" or "#a6e3a1"

            return permissions, bg_color
        end
    end,
    config = function()
        require("lualine").setup {
            options = {
                theme = "catppuccin"
            }
        }
    end
}
