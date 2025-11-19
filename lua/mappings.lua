local map = vim.keymap.set

map("n","<leader>fp","<cmd>echo expand('%p')<cr>",{desc="Show complete file path"})
vim.opt.timeoutlen = 300
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
-- keybinding to close and save the buffers 
map("i","<C-s>","<cmd>w|stopinsert<cr>",{desc="save file in insert mode"})
map("n","<C-s>","<cmd>w<cr>",{desc="save file in normal mode"})
map("n","<leader>qa","<cmd>qa<cr>",{desc="quit all buffers in normal mode"})

-- movement keys in insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

--switching windows
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

--Terminal mode buffer switch
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "switch window left",silent = true })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "switch window right",silent = true })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "switch window down",silent = true })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "switch window up",silent = true })

-- telescope
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

-- nvim-tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })    -- toggle file explorer
map("n", "<C-r>r", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- buffer management
map("n", "<tab>", "<cmd>bnext<CR>", { desc = "move to next buffer" })
map("n", "<S-tab>", "<cmd>bprev<CR>", { desc = "move to prev buffer" })
map("n", "<leader>x", "<cmd>bd|bprev<CR>", { desc = "close the current active buffer" })

-- lsp key bindings
map("n", "K", vim.lsp.buf.hover, { desc = "lsp hover info" })
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "lsp go to definition" })
map("n", "<leader>gr", vim.lsp.buf.references, { desc = "lsp references" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "lsp code action" })
map("n", "<leader>rn", vim.lsp.buf.code_action, { desc = "lsp code action rename" })
map('n', '<space>rn', vim.lsp.buf.rename, { desc = "lsp code action rename" })

--formatting
map("n", "<leader>fm", vim.lsp.buf.format, {})

-- commenting
map("n", "<leader>/", "gcc", { desc = "comment toggle", remap = true })
map("v", "<leader>/", "gc", { desc = "comment toggle", remap = true })

-- nvterm (terminal in neovim)
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<leader>h", function()
	require("nvterm.terminal").new("horizontal")
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
	require("nvterm.terminal").new("vertical")
end, { desc = "terminal new vertical window" })

-- toggleable nvterm
map({ "n", "t" }, "<A-v>", function()
	require("nvterm.terminal").toggle('vertical')
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
	require("nvterm.terminal").toggle('horizontal')
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-i>", function()
	require("nvterm.terminal").toggle('float')
end, { desc = "terminal toggle floating term" })

-- git diff (vim-fugutive) key bindings
map("n", "<leader>gvd","<cmd>Gvdiffsplit<cr>" ,{ desc = "View git diff in a vsplit" })


-- code completion mappings are in plugins/completions.lua

-- debugger mappings are in plugins/debugger.lua
-- map("n", "<leader>db", "<cmd>DapToggleBreakPoint<CR>", { desc = "debugger break point" })
-- map("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "start or continue the debugger" })

--trouble diagnostics keybindings in troule.lua
-- map( "<leader>tr", "<cmd>Trouble diagnostics toggle<CR>", {desc = "Open trouble workspace diagnostics"})
-- map( "<leader>td", "<cmd>Trouble diagnostics toggle<CR>", {desc = "Open trouble document diagnostics"})
-- map( "<leader>tq", "<cmd>Trouble diagnostics toggle<CR>", {desc = "Open trouble workspace diagnostics"} )
-- map( "<leader>tl", "<cmd>Trouble loclist toggle<CR>", {desc = "Open trouble location list"} )
