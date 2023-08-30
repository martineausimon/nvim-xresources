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

local M = {}

local function get_xresources_color(c)
  local color = io.popen(('xrdb -query | grep %s -m 1 | cut -f 2'):format(c))
  if color then color = color:read("*l") end
  return color
end

local function get_termux_color(c)
  local opts = require('nvim-xresources').options()
  local colors_file = opts.termux_colors_path

  for line in colors_file:lines() do
    local name, hex = line:match("(%S+):%s*(%S+)")
    if name == c then
      colors_file:close()
      return hex
    end
  end
end

function M.fallback_colors()
  local opts = require('nvim-xresources').options()
  local fallback_themes = require('nvim-xresources.fallback')
  local theme = fallback_themes[opts.fallback_theme]
  if not theme then
    vim.notify(string.format("Can't find fallback theme (%s). Switch back to nord", opts.fallback_theme), vim.log.levels["INFO"], {})
    return fallback_themes.nord
  end

  return theme
end

function M.load_termux_colors()
  local colors = {}

  for _, c in ipairs(color_names) do
    colors[c] = get_termux_color(c)
  end

  return colors
end

function M.load_cached_xresources()
  local opts = require('nvim-xresources').options()
  local cache_path = vim.fn.stdpath('cache') .. '/xresources.lua'
  local xresources_path = opts.xresources_path

  local cache_mtime = vim.fn.getftime(cache_path)
  local xresources_mtime = vim.fn.getftime(xresources_path)

  if cache_mtime >= xresources_mtime then
    return dofile(cache_path)
  else
    local colors = {}

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
