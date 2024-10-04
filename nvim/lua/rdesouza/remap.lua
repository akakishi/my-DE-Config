vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Return to Explorer" })

-- stolen from ThePrimeagen

-- move selected line down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- move selected line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- appends line below to the end and moves cursor to beginning
vim.keymap.set("n", "J", "mzJ`z")
-- moves cursor half page up/down while keeping it centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- when searching the cursor stays in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwmm", function()
    require("vim-with-me").StartVimWithMe()
end, { desc = "Start Vim-With-Me" })
vim.keymap.set("n", "<leader>vwms", function()
    require("vim-with-me").StopVimWithMe()
end, { desc = "Stop Vim-With-Me" })

-- pasting over a selection keeps the original buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over, keep original" })

-- next greatest remap ever : asbjornHaland
-- copy selection into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to system clipboard" })

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- tmux new session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })

-- quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- start replacing the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word" })

-- makes current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make executable" })

-- make it rain
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Cellular Automaton" });

-- source current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { desc = "Source file" })

-- lazygit
vim.keymap.set("n", "<leader>gg", function ()
    vim.cmd("LazyGit")
end, { desc = "LazyGit" })

-- spell check
-- switch to english
vim.keymap.set("n", "<leader>lsen", function()
    vim.opt.spelllang = "en"
    vim.cmd("echo 'Spell language set to English'")
end, { desc = "Spelling language English" })
-- switch to spanish
vim.keymap.set("n", "<leader>lsen", function()
    vim.opt.spelllang = "es"
    vim.cmd("echo 'Spell language set to Spanish'")
end, { desc = "Spelling language Spanish" })
-- switch to both
vim.keymap.set("n", "<leader>lsb", function()
    vim.opt.spelllang = "en,es"
    vim.cmd("echo 'Spell language set to English and Spanish'")
end, { desc = "Spelling language English and Spanish" })
-- apply spell suggestion
vim.keymap.set("n", "<leader>lss", function()
    vim.cmd("normal! 1z=")
end, { desc = "Spelling suggestions" })
-- add new word
vim.keymap.set("n", "<leader>lga", function()
    vim.cmd("normal! zg")
end, { desc = "Add word to spell file" })
-- remove word
vim.keymap.set("n", "<leader>lgr", function()
    vim.cmd("normal! zug")
end, { desc = "Remove word from spell file" })
-- repeat replacement for all matches
vim.keymap.set("n", "<leader>lgm", function()
    vim.cmd("normal! zg")
end, { desc = "Repeat spell fix" })
