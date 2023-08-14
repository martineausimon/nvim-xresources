local M = {}

local HEX_DIGITS = {
  ['0'] = 0,
  ['1'] = 1,
  ['2'] = 2,
  ['3'] = 3,
  ['4'] = 4,
  ['5'] = 5,
  ['6'] = 6,
  ['7'] = 7,
  ['8'] = 8,
  ['9'] = 9,
  ['a'] = 10,
  ['b'] = 11,
  ['c'] = 12,
  ['d'] = 13,
  ['e'] = 14,
  ['f'] = 15,
  ['A'] = 10,
  ['B'] = 11,
  ['C'] = 12,
  ['D'] = 13,
  ['E'] = 14,
  ['F'] = 15,
}

local function hex_to_rgb(hex)
  return HEX_DIGITS[string.sub(hex, 1, 1)] * 16 + HEX_DIGITS[string.sub(hex, 2, 2)],
    HEX_DIGITS[string.sub(hex, 3, 3)] * 16 + HEX_DIGITS[string.sub(hex, 4, 4)],
    HEX_DIGITS[string.sub(hex, 5, 5)] * 16 + HEX_DIGITS[string.sub(hex, 6, 6)]
end

local function rgb_to_hex(r, g, b)
  return bit.tohex(bit.bor(bit.lshift(r, 16), bit.lshift(g, 8), b), 6)
end

function M.too_black(hex)
  local r, g, b = hex_to_rgb(string.sub(hex, 2))
  return (r + g + b) / (255 * 3) <= 0.08
end

function M.shaker(hex1, hex2)
  local r1, g1, b1 = hex_to_rgb(string.sub(hex1, 2))
  local r2, g2, b2 = hex_to_rgb(string.sub(hex2, 2))

  local r_shaker = (r1 + r2) / 2
  local g_shaker = (g1 + g2) / 2
  local b_shaker = (b1 + b2) / 2

  return string.format("#%s", rgb_to_hex(r_shaker, g_shaker, b_shaker))
end

function M.light(hex, pct)
  pct = 1 + pct
  local r, g, b = hex_to_rgb(string.sub(hex, 2))
  r = math.floor(r * pct)
  g = math.floor(g * pct)
  b = math.floor(b * pct)

  r = r < 0 and 0 or (r > 255 and 255 or r)
  g = g < 0 and 0 or (g > 255 and 255 or g)
  b = b < 0 and 0 or (b > 255 and 255 or b)

  local maxComponent = math.max(r, g, b)
  if maxComponent > 255 then
    r = r * 255 / maxComponent
    g = g * 255 / maxComponent
    b = b * 255 / maxComponent
  end

  return string.format("#%s", rgb_to_hex(r, g, b))
end

function M.show_palette()

  local C = require('nvim-xresources.colors')

  local function create_color_table()
    local color_table = {}

    for color_name, color_value in pairs(C) do
      local hex = string.sub(color_value, 2)
      if #hex == 6 then
        local r, g, b = hex_to_rgb(hex)
        if r and g and b then
          local brightness = r + g + b
          table.insert(color_table, {
            name = color_name,
            value = color_value,
            brightness = brightness
          })
        end
      end
    end

    table.sort(color_table, function(a, b) return a.brightness < b.brightness end)

    return color_table
  end

  local function highlight(preview_buf, lines)
    for i, line in ipairs(lines) do
      local color_name = line:match("^%S+")
      if color_name then
        local color = C[color_name]
        if color then
          local highlight_group = 'NvimXResources' .. i
          vim.api.nvim_buf_add_highlight(preview_buf, -1, highlight_group, i - 1, 14, 29)
          vim.cmd('hi ' .. highlight_group .. ' guibg=' .. color)
        end
      end
    end
  end

  local screen_width, screen_height = vim.api.nvim_get_option("columns"), vim.api.nvim_get_option("lines")
  local demi_screen_width = math.floor(screen_width / 2)
  local demi_screen_height = math.floor(screen_height / 2)
  local x = math.floor(demi_screen_width - 37 / 2)
  local y = math.floor(demi_screen_height - 24 / 2)
  local opts = {
    relative = "win",
    width = 37,
    height = 24,
    col = x,
    row = y,
    style = "minimal",
    border = "single"
  }

  local preview_buf = vim.api.nvim_create_buf(false, true)

  local lines = {}

  string.pad_right = function(str, length)
    return str .. string.rep(" ", length - #str)
  end

  for _, color_data in ipairs(create_color_table()) do
    table.insert(lines, color_data.name:pad_right(30) .. color_data.value)
  end

  vim.api.nvim_buf_set_lines(preview_buf, 0, -1, true, lines)
  vim.api.nvim_open_win(preview_buf, true, opts)
  highlight(preview_buf, lines)

end

return M
