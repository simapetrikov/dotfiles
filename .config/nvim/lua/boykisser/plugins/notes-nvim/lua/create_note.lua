
-- Define the directory where files will be stored
local storage_path = "~/Documents/vimwiki/notes/"

-- Get current date and time
local current_datetime = os.date("%Y%m%d%H%M%S")

-- Generate filename
local filename = current_datetime .. ".md"

-- Create full file path
local full_path = storage_path .. filename

-- Open file in a new buffer
vim.cmd("edit " .. full_path)

