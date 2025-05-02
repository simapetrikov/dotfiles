return {
   'vimwiki/vimwiki',
   event = "VeryLazy",
   init = function () --replace 'config' with 'init'
      vim.g.vimwiki_list = {
	 {path = '~/Documents/vimwiki/', syntax = 'markdown', ext = '.md'},
	 {path = '~/*', syntax = 'markdown', ext = '.md'},
	 {path = '~/programming/progwiki/', syntax = 'markdown', ext = '.md'}

      }
   end
}
