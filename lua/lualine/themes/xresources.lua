local C = require('nvim-xresources.colors')

return {
  normal = {
    a = { bg = C.cyan, fg = C.black, gui = 'bold' },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  insert = {
    a = { bg = C.magenta, fg = C.black, gui = 'bold' },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  visual = {
    a = { bg = C.yellow, fg = C.black, gui = 'bold' },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  replace = {
    a = { bg = C.red, fg = C.black, gui = 'bold' },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  command = {
    a = { bg = C.blue, fg = C.black, gui = 'bold' },
    b = { bg = C.bg1, fg = C.fg1 },
    c = { bg = C._bg, fg = C.fg }
  },
  inactive = {
    a = { bg = C._bg, fg = C.grey, gui = 'bold' },
    b = { bg = C._bg, fg = C.grey },
    c = { bg = C._bg, fg = C.grey }
  }
}
