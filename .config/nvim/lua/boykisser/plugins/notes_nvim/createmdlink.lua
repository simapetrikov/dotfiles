local M = {}

-- Transliteration table for Russian letters to Latin equivalents
local translit = {
  ['а'] = 'a', ['А'] = 'a',
  ['б'] = 'b', ['Б'] = 'b',
  ['в'] = 'v', ['В'] = 'v',
  ['г'] = 'g', ['Г'] = 'g',
  ['д'] = 'd', ['Д'] = 'd',
  ['е'] = 'e', ['Е'] = 'e',
  ['ё'] = 'yo', ['Ё'] = 'yo',
  ['ж'] = 'zh', ['Ж'] = 'zh',
  ['з'] = 'z', ['З'] = 'z',
  ['и'] = 'i', ['И'] = 'i',
  ['й'] = 'y', ['Й'] = 'y',
  ['к'] = 'k', ['К'] = 'k',
  ['л'] = 'l', ['Л'] = 'l',
  ['м'] = 'm', ['М'] = 'm',
  ['н'] = 'n', ['Н'] = 'n',
  ['о'] = 'o', ['О'] = 'o',
  ['п'] = 'p', ['П'] = 'p',
  ['р'] = 'r', ['Р'] = 'r',
  ['с'] = 's', ['С'] = 's',
  ['т'] = 't', ['Т'] = 't',
  ['у'] = 'u', ['У'] = 'u',
  ['ф'] = 'f', ['Ф'] = 'f',
  ['х'] = 'kh', ['Х'] = 'kh',
  ['ц'] = 'ts', ['Ц'] = 'ts',
  ['ч'] = 'ch', ['Ч'] = 'ch',
  ['ш'] = 'sh', ['Ш'] = 'sh',
  ['щ'] = 'shch', ['Щ'] = 'shch',
  ['ъ'] = '', ['Ъ'] = '',
  ['ы'] = 'y', ['Ы'] = 'y',
  ['ь'] = '', ['Ь'] = '',
  ['э'] = 'e', ['Э'] = 'e',
  ['ю'] = 'yu', ['Ю'] = 'yu',
  ['я'] = 'ya', ['Я'] = 'ya',
}

-- Function to transliterate Russian text to Latin
local function transliterate(text)
  local result = text
  for ru, lat in pairs(translit) do
    result = result:gsub(ru, lat)
  end
  return result
end

function M.create_markdown_link()
  local buf = 0
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_row, start_col = start_pos[2] - 1, start_pos[3] - 1
  local end_row, end_col = end_pos[2] - 1, end_pos[3]

  -- Ensure end_col doesn't exceed line length
  local end_line = vim.api.nvim_buf_get_lines(buf, end_row, end_row + 1, false)[1]
  if not end_line then return end
  end_col = math.min(end_col, #end_line)

  -- Extract selected text
  local lines = vim.api.nvim_buf_get_text(buf, start_row, start_col, end_row, end_col, {})
  if #lines == 0 then return end

  -- Trim leading and trailing spaces from selected text
  local selected_text = table.concat(lines, " "):gsub("^%s+", ""):gsub("%s+$", "")
  
  -- Transliterate Russian letters to Latin for the filename
  local transliterated = transliterate(selected_text)
  
  -- Generate filename from transliterated text
  local filename = transliterated:lower():gsub("[%s_]+", "-"):gsub("[^%w%-]", "") .. ".md"
  
  -- Create Markdown link with original text and generated filename
  local markdown_link = "[" .. selected_text .. "](" .. filename .. ")"
  
  -- Replace selection with the Markdown link
  vim.api.nvim_buf_set_text(buf, start_row, start_col, end_row, end_col, { markdown_link })
end

return M
