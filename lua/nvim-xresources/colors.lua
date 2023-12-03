local Tools = require('nvim-xresources.tools')
local System = require('nvim-xresources.system')
local opts = require('nvim-xresources').options()

local contrast, termux_path = opts.contrast, opts.termux_colors_path
local system

local colors = {}

if vim.fn.has('termux)') and Tools.exists(termux_path) then
  system = System.load_termux_colors()
elseif Tools.exists(opts.xresources_path) then
  system = System.load_cached_xresources()
else
  system = System.fallback_colors()
end

local bold = opts.bold and 'bold' or 'none'

colors = {
  fg            = system.foreground,
  bg            = system.background,
  black         = system.color0,
  red           = system.color1,
  green         = system.color2,
  yellow        = system.color3,
  blue          = system.color4,
  magenta       = system.color5,
  cyan          = system.color6,
  white         = system.color7,
  light_black   = system.color8,
  light_red     = system.color9,
  light_green   = system.color10,
  light_yellow  = system.color11,
  light_blue    = system.color12,
  light_magenta = system.color13,
  light_cyan    = system.color14,
  light_white   = system.color15,
  bold          = bold,
  none = 'NONE',
}

for color, hex in pairs(opts.palette_overrides) do
  colors[color] = hex
end

if opts.auto_light.enable then
  local excluded_colors = {}

  for _, color in ipairs(opts.auto_light.exclude) do
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
      colors[light_color] = Tools.light(colors[base_color], contrast * opts.auto_light.value)
    end
  end
end

for color, hex in pairs(opts.palette_overrides) do
  colors[color] = hex
end

colors.fg1 = Tools.light(colors.fg, contrast * 1)
colors.bg1 = Tools.too_black(colors.bg) and Tools.light(colors.bg, contrast * 0.25) or Tools.light(colors.bg, contrast * 0.2)
colors.bg2 = Tools.light(colors.bg, contrast * 0.5)
colors.bg3 = Tools.light(colors.bg, contrast * 0.9)
colors._bg = Tools.too_black(colors.bg) and Tools.light(colors.bg, contrast * 0.15) or Tools.light(colors.bg, contrast * -0.15)

colors['grey'] = Tools.shaker(colors.white, colors.black)

return colors
