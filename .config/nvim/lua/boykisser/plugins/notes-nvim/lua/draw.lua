
local M = {}

function M.draw_cat()
    local cat = {
        " /\\_/\\",
        "( o.o )",
        " > ^ <"
    }

    -- Get current buffer handle
    local buf = vim.api.nvim_get_current_buf()

    -- Get current cursor position
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor[1], cursor[2]

    -- Write cat ASCII art to buffer
    for _, line in ipairs(cat) do
        vim.api.nvim_buf_set_lines(buf, row, row, false, {line})
        row = row + 1
    end
end



function M.hw()
   print('hw')
end

return M
