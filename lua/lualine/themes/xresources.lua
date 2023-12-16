local C = require('nvim-xresources.colors')

return {
  normal = {
    a = { bg = C.bg2, fg = C.fg1, gui = C.bold },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  insert = {
    a = { bg = C.bg2, fg = C.light_blue, gui = C.bold },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  visual = {
    a = { bg = C.bg2, fg = C.light_yellow, gui = C.bold },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  replace = {
    a = { bg = C.bg2, fg = C.light_red, gui = C.bold },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  command = {
    a = { bg = C.bg2, fg = C.blue, gui = C.bold },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  inactive = {
    a = { bg = C._bg, fg = C.grey, gui = C.bold },
    b = { bg = C._bg, fg = C.grey },
    c = { bg = C._bg, fg = C.grey }
  }
}
