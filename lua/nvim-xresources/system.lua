local M = {}

local function get_xresources_color(c)
  local color = io.popen(('xrdb -query | grep %s -m 1 | cut -f 2'):format(c))
  if color then color = color:read("*l") end
  return color
end

M.load_cached_xresources = function()
  local config = require('nvim-xresources').config
  local cache_path = vim.fn.stdpath('cache') .. '/xresources.lua'
  local xresources_path = config.xresources_path

  local cache_mtime = vim.fn.getftime(cache_path)
  local xresources_mtime = vim.fn.getftime(xresources_path)

  if cache_mtime >= xresources_mtime then
    return dofile(cache_path)
  else
    local colors = {}
    local color_names = {
      'foreground',
      'background',
      'color0',
      'color1',
      'color2',
      'color3',
      'color4',
      'color5',
      'color6',
      'color7',
      'color8',
      'color9',
      'color10',
      'color11',
      'color12',
      'color13',
      'color14',
      'color15',
    }

    for _, c in ipairs(color_names) do
      colors[c] = get_xresources_color(c)
    end

    local cache_file = io.open(cache_path, "w")
    if cache_file then
      cache_file:write("return " .. vim.inspect(colors))
      cache_file:close()
    end

    return colors
  end
end

return M
