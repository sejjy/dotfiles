vim.keymap.set("n", "<Left>",  "<Nop>")
vim.keymap.set("n", "<Down>",  "<Nop>")
vim.keymap.set("n", "<Up>",    "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

vim.keymap.set("n", "<C-S-h>", "<C-w><")
vim.keymap.set("n", "<C-S-j>", "<C-w>-")
vim.keymap.set("n", "<C-S-k>", "<C-w>+")
vim.keymap.set("n", "<C-S-l>", "<C-w>>")

vim.keymap.set("v", "J", ":move '>+1<Enter>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<Enter>gv=gv")

vim.keymap.set("n", "<Enter>",   "o<Esc>")
vim.keymap.set("n", "<S-Enter>", "O<Esc>")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set(  "n",        "x",         [["_x]],  { noremap = true })
vim.keymap.set({ "n", "x" }, "c",         [["_c]],  { noremap = true })
vim.keymap.set({ "n", "v" }, "<Leader>d", [["_d]],  { noremap = true, desc = "Delete" })
vim.keymap.set(  "x",        "<Leader>p", [["_dP]], { noremap = true, desc = "Paste" })

vim.keymap.set("n", "<Esc>", ":nohlsearch<Enter>", { silent = true })

vim.keymap.set("n", "<Leader>rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Rename" })
