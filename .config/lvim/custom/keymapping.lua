lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>Q"] = ":q!<cr>"
lvim.keys.normal_mode["C"] = "^d$<Esc>"


vim.g.lightspeed_no_default_keymaps = 1
lvim.keys.normal_mode["s"] = "<Plug>Lightspeed_omni_s"
lvim.keys.normal_mode["f"] = "<Plug>Lightspeed_f";
lvim.keys.normal_mode["F"] = "<Plug>Lightspeed_F";
lvim.keys.normal_mode[";"] = "<Plug>Lightspeed_;_ft"
lvim.keys.normal_mode[","] = "<Plug>Lightspeed_,_ft"

-- For bookmark plugin
-- vim.keymap.set({ "n", "v" }, "mm", "<cmd>BookmarksMark<cr>", { desc = "Mark current line into active BookmarkList." })
-- vim.keymap.set({ "n", "v" }, "mo", "<cmd>BookmarksGoto<cr>", { desc = "Go to bookmark at current active BookmarkList" })
-- vim.keymap.set({ "n", "v" }, "ma", "<cmd>BookmarksCommands<cr>", { desc = "Find and trigger a bookmark command." })

-- Remap yank and delete to not copy to clipboard
--
vim.cmd("nnoremap x \"_x")
vim.cmd("nnoremap d \"_d")
vim.cmd("nnoremap D \"_D")
vim.cmd("vnoremap d \"_d")

vim.cmd("nnoremap ,x \"+x")
vim.cmd("nnoremap ,d \"+d")
vim.cmd("nnoremap ,D \"+D")
vim.cmd("vnoremap ,d \"+d")
vim.cmd("nnoremap ,dd \"+dd")


-- Resize windows
vim.cmd("nmap <M-H> <C-Left>")
vim.cmd("nmap <M-J> <C-Down>")
vim.cmd("nmap <M-K> <C-Up>")
vim.cmd("nmap <M-L> <C-Right>")
