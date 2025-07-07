return 
{{
   'vimwiki/vimwiki',
   event = "VeryLazy",
   init = function () --replace 'config' with 'init'
      vim.g.vimwiki_list = {
	 {path = '~/Documents/vimwiki/', syntax = 'markdown', ext = '.md'},
	 {path = '~/programming/progwiki/', syntax = 'markdown', ext = '.md'},
	 {path = '~/', syntax = 'markdown', ext = '.md'}

      }
   end,

},
{
  dir  = vim.fn.stdpath("config")
  .. "/lua/boykisser/plugins/notes_nvim",
  name = "notes-nvim",
  config = function()
    vim.keymap.set("n", "<Leader>nn",
    ":lua require('boykisser.plugins.notes_nvim.create_note').create_note()<CR>",
    { noremap=true, silent=true, desc="Create new note" })

    vim.api.nvim_set_keymap('n', '<Leader>nc',
    ':lua require("boykisser.plugins.notes_nvim.draw").draw_cat()<CR>',
    { noremap=true, silent=true, desc="Draw cat ASCII" })

    vim.keymap.set("v", "m",
    ":<C-u>lua require('boykisser.plugins.notes_nvim.createmdlink')"
    .. ".create_markdown_link()<CR>",
    { noremap = true, silent = true, nowait = true, desc = "Create md link" })
  end
}

}

