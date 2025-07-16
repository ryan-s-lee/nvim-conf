local function filepath()
    return vim.fn.expand('%p:.')
end

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        sections = {
            lualine_c = { filepath }
        },
        tabline = {
            lualine_a = { 'buffers' },
            lualine_b = { 'branch' },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'tabs' }
        },
    }
}
