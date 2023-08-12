local Tools = require('nvim-xresources.tools')
local System = require('nvim-xresources.system')
local config = require('nvim-xresources').config

local colors = {}

local xresources = System.load_cached_xresources()

colors = {
  fg            = xresources.foreground,
  bg            = xresources.background,
  black         = xresources.color0,
  red           = xresources.color1,
  green         = xresources.color2,
  yellow        = xresources.color3,
  blue          = xresources.color4,
  magenta       = xresources.color5,
  cyan          = xresources.color6,
  white         = xresources.color7,
  light_black   = xresources.color8,
  light_red     = xresources.color9,
  light_green   = xresources.color10,
  light_yellow  = xresources.color11,
  light_blue    = xresources.color12,
  light_magenta = xresources.color13,
  light_cyan    = xresources.color14,
  light_white   = xresources.color15,
  none = 'NONE',
}

for color, hex in pairs(config.palette_overrides) do
  colors[color] = hex
end

if config.auto_light.enable then
  local excluded_colors = {}

  for _, color in ipairs(config.auto_light.exclude) do
    excluded_colors[color] = true
  end

  for light_color, base_color in pairs({
    light_black   = 'black',
    light_green   = 'green',
    light_yellow  = 'yellow',
    light_blue    = 'blue',
    light_magenta = 'magenta',
    light_cyan    = 'cyan',
    light_white   = 'white',
  }) do
    if not excluded_colors[light_color] then
      colors[light_color] = Tools.light(colors[base_color], config.auto_light.value)
    end
  end
end

for color, hex in pairs(config.palette_overrides) do
  colors[color] = hex
end

local adjustContrast = function(hexColor, contrast)
  return Tools.light(hexColor, contrast)
end

local contrast = config.contrast

colors.fg1  = adjustContrast(colors.fg, contrast)
colors.bg1  = adjustContrast(colors.bg, contrast * 0.2)
colors.bg2  = adjustContrast(colors.bg, contrast * 0.5)
colors.bg3  = adjustContrast(colors.bg, contrast * 0.9)

colors['grey'] = Tools.shaker(colors.white, colors.black)

return colors
