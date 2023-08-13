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

return M
