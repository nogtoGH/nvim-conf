local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("n", "<F3>",  	[[:lua require('telescope.builtin').find_files()<CR>]])
map("n", "<F4>",    [[<Cmd>lua require('telescope.builtin').file_browser()<CR>]])

