--
-- Space
vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--local wk = require("which-key")
--wk.register({
--  ff = {
--    name = "file", -- optional group name
--    f = { "<cmd>Telescope find_files<cr>", "Find File" },
--    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123 },
--  },
--}, { prefix = "<leader>" })

-- NerdTree
map("n", "<Leader>n", ":NERDTreeToggle<CR>")

-- Neogit
map("n", "<Leader>gs", ":Neogit<CR>")
map("n", "<Leader>gc", ":Neogit commit<CR>")

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<cr>")
map("n", "<Leader>fg", ":Telescope live_grep<CR>")
map("n", "<Leader>fb", ":Telescope buffers<CR>")
map("n", "<Leader>fh", ":Telescope help_tags<CR>")
map("n", "<Leader>1", ":Telescope sessions [save_current=true]<CR>")
map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files()<cr>')
-- map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>')
map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>')
map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')

-- Lsp Saga
map("n", "<silent> gh", "<cmd>Lspsaga lsp_finder<cr>")
