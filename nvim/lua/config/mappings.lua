local map = LazyVim.safe_keymap_set

--------------------------------------------------------------------------------
-- Custom Mappings
--------------------------------------------------------------------------------

-- floating terminal
local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<leader>fT", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Remap to save using Super + s
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr>", { desc = "Save file" })


