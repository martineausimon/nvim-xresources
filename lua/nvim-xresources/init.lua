local M = {}

M.config = {
  xresources_path = os.getenv("HOME") .. '/.Xresources',
  auto_light = {
    enable = true,
    value = 0.5,
    exclude = {}
  },
  contrast = 1,
  palette_overrides = {},
}

local function prepare_env()
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end

  vim.g.colors_name = 'xresources'
  vim.opt.termguicolors = true

  if vim.fn.exists 'syntax_on' then
    vim.cmd('syntax reset')
  end
end

local function highlight(colorSet)
  local _ColorSet = M.custom_highlight_groups and vim.tbl_deep_extend("force", {}, colorSet, M.custom_highlight_groups) or colorSet

  for hlgroup, args in pairs(_ColorSet) do
    if type(args) == 'string' then
      vim.cmd(('hi! link %s %s'):format(hlgroup, args))
    else
      local guifg, guibg, gui, guisp = args.guifg or nil, args.guibg or nil, args.gui or nil, args.guisp or nil
      local cmd = { 'hi', hlgroup }
      if guifg then table.insert(cmd, 'guifg=' .. guifg) end
      if guibg then table.insert(cmd, 'guibg=' .. guibg) end
      if gui then table.insert(cmd, 'gui=' .. gui) end
      if guisp then table.insert(cmd, 'guisp=' .. guisp) end
      vim.cmd(table.concat(cmd, ' '))
    end
  end
end

function M.setup(config)
  M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

function M.custom_highlight_groups(config)
  M.custom_highlight_groups = config or nil
end

M.load = function()

  prepare_env()

  local Theme = require('nvim-xresources.theme')
  local syntax     = Theme.loadSyntax()
  local editor     = Theme.loadEditor()
  local plugins    = Theme.loadPlugins()
  local treesitter = Theme.loadTreesitter()
  local filetypes  = Theme.loadFiletypes()

  Theme.loadTerminal()

  highlight(syntax)
  highlight(editor)
  highlight(plugins)
  highlight(treesitter)
  highlight(filetypes)

end

return M
