return {
  dir = "/home/dm/.config/nvim/lua/boykisser/plugins/notes-nvim", -- Your path
  name = "notes-nvim",
  config = function ()

     vim.api.nvim_set_keymap('n', '<Leader>nn', ':lua require("create_note")<CR>', { noremap = true, silent = true })

  end
}
