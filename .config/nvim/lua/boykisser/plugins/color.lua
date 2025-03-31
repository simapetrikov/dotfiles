return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      "*"; -- Highlight all file types, or specify a list e.g., { "css", "html", "lua" }
    })
  end,
}
