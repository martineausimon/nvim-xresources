local Tools = require('nvim-xresources.tools')
local System = require('nvim-xresources.system')
local config = require('nvim-xresources').config

local colors = {}
local contrast = config.contrast
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
    light_blue    = 'blue',
    light_cyan    = 'cyan',
    light_green   = 'green',
    light_magenta = 'magenta',
    light_red     = 'red',
    light_white   = 'white',
    light_yellow  = 'yellow',
  }) do
    if not excluded_colors[light_color] then
      colors[light_color] = Tools.light(colors[base_color], contrast * config.auto_light.value)
    end
  end
end

for color, hex in pairs(config.palette_overrides) do
  colors[color] = hex
end

colors.fg1 = Tools.light(colors.fg, contrast * 1)
colors.bg1 = Tools.light(colors.bg, contrast * 0.2)
colors.bg2 = Tools.light(colors.bg, contrast * 0.5)
colors.bg3 = Tools.light(colors.bg, contrast * 0.9)
colors._bg = Tools.too_black(colors.bg) and colors.bg1 or Tools.light(colors.bg, contrast * -0.15)

colors['grey'] = Tools.shaker(colors.white, colors.black)

return colors
