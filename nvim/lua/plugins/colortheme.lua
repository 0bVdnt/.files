return {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        local onedark = require('onedark')

        -- Define initial state
        local bg_transparent = true

        -- Function to toggle transparency
        local function toggle_transparency()
            bg_transparent = not bg_transparent

            -- Reapply theme with new transparency setting
            onedark.setup({
                style = 'darker',
                transparent = bg_transparent,
                term_colors = true,
                ending_tildes = false,
                cmp_itemkind_reverse = false,
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
                lualine = { transparent = false },
                diagnostics = {
                    darker = true,
                    undercurl = true,
                    background = true
                }
            })

            -- Reload colorscheme
            onedark.load()
        end

        -- Apply initial theme
        onedark.setup({ transparent = bg_transparent })
        onedark.load()

        -- Keybinding for toggling transparency
        vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end
}
