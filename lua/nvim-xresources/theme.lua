local C = require('nvim-xresources.colors')

local M = {}

M.loadTerminal = function()
   vim.g.terminal_color_0  = C.black
   vim.g.terminal_color_1  = C.red
   vim.g.terminal_color_2  = C.green
   vim.g.terminal_color_3  = C.yellow
   vim.g.terminal_color_4  = C.blue
   vim.g.terminal_color_5  = C.purple
   vim.g.terminal_color_6  = C.cyan
   vim.g.terminal_color_7  = C.white
   vim.g.terminal_color_8  = C.light_black
   vim.g.terminal_color_9  = C.light_red
   vim.g.terminal_color_10 = C.light_green
   vim.g.terminal_color_11 = C.light_yellow
   vim.g.terminal_color_12 = C.light_blue
   vim.g.terminal_color_13 = C.light_purple
   vim.g.terminal_color_14 = C.light_cyan
   vim.g.terminal_color_15 = C.light_white
end

M.loadSyntax = function()
  return {
    Boolean        = { guifg = C.magenta, guibg = C.none, gui = 'bold', guisp = nil },
    Comment        = { guifg = C.cyan, guibg = C.none, gui = 'italic', guisp = nil },
    Constant       = { guifg = C.magenta, guibg = C.none, gui = nil, guisp = nil },
    Character      = 'Constant',
    Conditional    = { guifg = C.yellow, guibg = C.none, gui = 'none', guisp = nil },
    Debug          = 'Special',
    Define         = 'PreProc',
    Delimiter      = 'Special',
    Error          = { guifg = C.red, guibg = C.none, gui = nil, guisp = nil },
    Exception      = { guifg = C.yellow, guibg = C.none, gui = nil, guisp = nil },
    Float          = { guifg = C.magenta, guibg = C.none, gui = nil, guisp = nil },
    Function       = { guifg = C.cyan, guibg = C.none, gui = 'bold', guisp = nil },
    Identifier     = { guifg = C.cyan, guibg = C.none, gui = 'bold', guisp = nil },
    Ignore         = { guifg = C.none, guibg = C.none, gui = nil, guisp = nil },
    Include        = 'PreProc',
    Keyword        = { guifg = C.yellow, guibg = C.none, gui = 'bold', guisp = nil },
    Label          = { guifg = C.yellow, guibg = C.none, gui = 'bold', guisp = nil },
    Macro          = 'PreProc',
    Number         = 'Constant',
    Operator       = { guifg = C.yellow, guibg = C.none, gui = 'bold', guisp = nil },
    PreProc        = { guifg = C.light_blue, guibg = C.none, gui = nil, guisp = nil },
    PreCondit      = 'PreProc',
    Repeat         = { guifg = C.yellow, guibg = C.none, gui = 'bold', guisp = nil },
    Statement      = { guifg = C.yellow, guibg = C.none, gui = 'none', guisp = nil },
    StorageClass   = 'Type',
    Special        = { guifg = C.light_magenta, guibg = C.none, gui = nil, guisp = nil },
    SpecialChar    = 'Special',
    Structure      = 'Type',
    String         = { guifg = C.magenta, guibg = C.none, gui = nil, guisp = nil },
    SpecialComment = 'Special',
    Typedef        = 'Type',
    Tag            = 'Special',
    Type           = { guifg = C.light_green, guibg = C.none, gui = 'none', guisp = nil },
    Todo           = { guifg = C.black, guibg = C.yellow, gui = nil, guisp = nil },
    Underlined     = { guifg = C.none, guibg = C.none, gui = 'underline', guisp = nil },
  }
end

M.loadEditor = function()
  return {
    BufferInactive           = { guifg = C.fg, guibg = C.grey, gui = nil, guisp = nil },
    BufferInactiveTarge      = { guifg = C.fg, guibg = C.grey, gui = nil, guisp = nil },
    BufferInactiveSign       = { guifg = C.blue, guibg = C.grey, gui = nil, guisp = nil },
    BufferCurrent            = { guifg = C.yellow, guibg = C.black, gui = 'bold', guisp = nil },
    BufferCurrentSign        = { guifg = C.blue, guibg = C.black, gui = nil, guisp = nil },
    BufferTabPageFill        = { guifg = C.blue, guibg = C.black, gui = nil, guisp = nil },
    BufferCurrentMod         = { guifg = C.blue, guibg = C.black, gui = nil, guisp = nil },
    BufferInactiveMod        = { guifg = C.blue, guibg = C.grey, gui = nil, guisp = nil },
    ColorColumn              = { guifg = C.none, guibg = C.grey, gui = nil, guisp = nil },
    Conceal                  = { guifg = C.grey, guibg = C.none, gui = nil, guisp = nil },
    CursorLineNr             = { guifg = C.white, gui = 'bold', guisp = nil },
    CursorIM                 = { guifg = C.none, guibg = C.none, gui = 'reverse', guisp = nil },
    CursorColumn             = { guifg = C.none, guibg = C.grey, gui = nil, guisp = nil },
    CursorLine               = { guifg = C.none, guibg = C.none, gui = nil, guisp = nil },
    Cursor                   = { guifg = C.none, guibg = C.none, gui = 'reverse', guisp = nil },
    DiagnosticHint           = { guifg = C.light_green, guibg = C.none, gui = nil, guisp = nil },
    DiagnosticError          = { guifg = C.red, guibg = C.none, gui = nil, guisp = nil },
    DiagnosticWarn           = { guifg = C.yellow, guibg = C.none, gui = nil, guisp = nil },
    DiagnosticInfo           = { guifg = C.blue, guibg = C.none, gui = nil, guisp = nil },
    DiagnosticOk             = { guifg = C.cyan, guibg = C.none, gui = nil, guisp = nil },
    DiagnosticUnderlineHint  = { guifg = C.none, guibg = C.none, gui = 'italic', guisp = nil },
    DiagnosticUnderlineError = { guifg = C.none, guibg = C.none, gui = 'italic', guisp = nil },
    DiagnosticUnderlineWarn  = { guifg = C.none, guibg = C.none, gui = 'italic', guisp = nil },
    DiagnosticUnderlineInfo  = { guifg = C.none, guibg = C.none, gui = 'italic', guisp = nil },
    DiagnosticUnderlineOk    = { guifg = C.none, guibg = C.none, gui = 'italic', guisp = nil },
    DiffAdd                  = { guifg = C.black, guibg = C.green, gui = nil, guisp = nil },
    DiffChange               = { guifg = C.black, guibg = C.yellow, gui = nil, guisp = nil },
    DiffDelete               = { guifg = C.black, guibg = C.red, gui = nil, guisp = nil },
    DiffText                 = { guifg = C.black, guibg = C.fg, gui = nil, guisp = nil },
    Directory                = { guifg = C.cyan, guibg = C.none, gui = nil, guisp = nil },
    debugBreakpoint          = { guifg = C.black, guibg = C.red, gui = nil, guisp = nil },
    EndOfBuffer              = { guifg = C.black, guibg = C.none, gui = nil, guisp = nil },
    ErrorMsg                 = { guifg = C.red, guibg = C.none, gui = 'bold', guisp = nil },
    FoldColumn               = { guifg = C.fg, guibg = C.black, gui = nil, guisp = nil },
    Folded                   = { guifg = C.grey, guibg = C.grey, gui = nil, guisp = nil },
    iCursor                  = { guifg = C.none, guibg = C.none, gui = 'reverse', guisp = nil },
    IncSearch                = { guifg = C.light_white, guibg = C.none, gui = nil, guisp = nil },
    lCursor                  = { guifg = C.none, guibg = C.none, gui = 'reverse', guisp = nil },
    LineNr                   = { guifg = C.grey, guibg = C.none, gui = nil, guisp = nil },
    ModeMsg                  = { guifg = C.fg, guibg = C.none, gui = 'bold', guisp = nil },
    MatchParen               = { guifg = C.red, guibg = C.none, gui = nil, guisp = nil },
    Normal                   = { guifg = C.fg, guibg = C.black, gui = nil, guisp = nil },
    NormalFloat              = { guifg = C.fg, guibg = C.black1, gui = nil, guisp = nil },
    FloatBorder              = { guifg = C.black1, guibg = C.black1, gui = nil, guisp = nil },
    NonText                  = { guifg = C.grey, guibg = C.none, gui = nil, guisp = nil },
    Pmenu                    = { guifg = C.fg, guibg = C.black1, gui = nil, guisp = nil },
    PmenuSel                 = { guifg = C.grey, guibg = C.blue, gui = nil, guisp = nil },
    PmenuSelBold             = { guifg = C.grey, guibg = C.blue, gui = nil, guisp = nil },
    PmenuSbar                = { guifg = C.none, guibg = C.grey, gui = nil, guisp = nil },
    PmenuThumb               = { guifg = C.magenta, guibg = C.green, gui = nil, guisp = nil },
    Question                 = { guifg = C.yellow, guibg = C.none, gui = nil, guisp = nil },
    QuickFixLine             = { guifg = C.none, gui = 'bold', guisp = nil },
    StatusLine               = { guifg = C.grey, guibg = C.grey, gui = nil, guisp = nil },
    StatusLineNC             = { guifg = C.grey, guibg = C.grey, gui = nil, guisp = nil },
    SpellBad                 = { guifg = C.red, guibg = C.none, gui = 'undercurl', guisp = nil },
    SpellCap                 = { guifg = C.blue, guibg = C.none, gui = 'undercurl', guisp = nil },
    SpellLocal               = { guifg = C.cyan, guibg = C.none, gui = 'undercurl', guisp = nil },
    SpellRare                = { guifg = C.magenta, guibg = C.none, gui = 'undercurl', guisp = nil },
    SignColumn               = { guifg = C.fg, guibg = C.black, gui = nil, guisp = nil },
    Search                   = { guifg = C.black, guibg = C.yellow, gui = nil, guisp = nil },
    SpecialKey               = { guifg = C.grey, guibg = C.none, gui = nil, guisp = nil },
    TabLine                  = { guifg = C.grey, guibg = C.black, gui = 'none', guisp = nil },
    TabLineFill              = { guifg = C.grey, guibg = C.black, gui = 'none', guisp = nil },
    TabLineSel               = { guifg = C.cyan, guibg = C.black2, gui = 'bold', guisp = nil },
    Title                    = { guifg = C.green, gui = 'bold', guisp = nil },
    Terminal                 = { guifg = C.fg, guibg = C.black, gui = nil, guisp = nil },
    VertSplit                = { guifg = C.grey, guibg = C.grey, gui = nil, guisp = nil },
    vCursor                  = { guifg = C.none, guibg = C.none, gui = 'reverse', guisp = nil },
    WarningMsg               = { guifg = C.yellow, guibg = C.none, gui = 'bold', guisp = nil },
    Whitespace               = { guifg = C.grey, guibg = C.none, gui = nil, guisp = nil },
    WildMenu                 = { guifg = C.fg, guibg = C.green, gui = nil, guisp = nil },
    Visual                   = { guifg = C.none, guibg = C.grey, gui = nil, guisp = nil },
    VisualNOS                = { guifg = C.black, guibg = C.fg, gui = nil, guisp = nil },
  }
end

M.loadFiletypes = function()
  return {
    markdownitalic            = { guifg = nil, guibg = nil, gui = "italic", guisp = nil },
    --markdownbold              = { guifg = nil, guibg = nil, gui = "bold", guisp = nil },
    markdownbolditalic        = { guifg = nil, guibg = nil, gui = "bold,italic", guisp = nil },
    markdownh1                = { guifg = C.yellow, guibg = nil, gui = "bold", guisp = nil },
    markdownh2                = { guifg = C.cyan, guibg = nil, gui = "bold", guisp = nil },
    markdownh3                = { guifg = C.blue, guibg = nil, gui = "bold", guisp = nil },
    markdownh4                = { guifg = C.light_yellow, guibg = nil, gui = "bold", guisp = nil },
    markdownh5                = { guifg = C.light_cyan, guibg = nil, gui = "bold", guisp = nil },
    markdownh6                = { guifg = C.light_blue, guibg = nil, gui = "bold", guisp = nil },
    markdowncode              = { guifg = C.light_white, guibg = nil, gui = nil, guisp = nil },
    markdowncodeblock         = { guifg = C.light_white, guibg = nil, gui = nil, guisp = nil },
    markdowncodedelimiter     = 'Delimiter',
    markdownblockquote        = { guifg = C.grey, guibg = nil, gui = nil, guisp = nil },
    markdownlistmarker        = { guifg = C.grey, guibg = nil, gui = nil, guisp = nil },
    markdownorderedlistmarker = { guifg = C.grey, guibg = nil, gui = nil, guisp = nil },
    markdownrule              = { guifg = C.grey, guibg = nil, gui = nil, guisp = nil },
    markdownheadingrule       = { guifg = C.grey, guibg = nil, gui = nil, guisp = nil },
    markdownurldelimiter      = 'Delimiter',
    markdownlinkdelimiter     = 'Delimiter',
    markdownlinktextdelimiter = 'PreProc',
    markdownheadingdelimiter  = { guifg = C.light_white, guibg = nil, gui = nil, guisp = nil },
    markdownurl               = { guifg = C.magenta, guibg = nil, gui = nil, guisp = nil },
    markdownurltitledelimiter = 'Delimiter',
    markdownlinktext          = { guifg = C.blue, guibg = nil, gui = "underline", guisp = nil },
    markdowniddeclaration     = 'markdownlinktext',
  }
end

M.loadPlugins = function()
  return {
    CmpItemMenu           = { guifg = C.cyan, guibg = C.none, gui = nil, guisp = nil },
    CmpItemMenuDefault    = { guifg = C.yellow, guibg = C.none, gui = nil, guisp = nil },
    CmpItemAbbrMatch      = { guifg = C.blue, guibg = C.none, gui = nil, guisp = nil },
    NoiceCursor           = { guifg = C.none, guibg = C.none, gui = 'reverse', guisp = nil },
    TelescopeBorder       = { guifg = C.black2, guibg = C.black2, gui = nil, guisp = nil },
    TelescopePromptBorder = { guifg = C.black1, guibg = C.black1, gui = nil, guisp = nil },
    TelescopePromptNormal = { guifg = C.fg, guibg = C.black1, gui = nil, guisp = nil },
    TelescopePromptPrefix = { guifg = C.light_black, guibg = C.black1, gui = nil, guisp = nil },
    TelescopeNormal       = { guifg = nil, guibg = C.black2, gui = nil, guisp = nil },
    TelescopePreviewTitle = { guifg = C.yellow, guibg = nil, gui = 'underline', guisp = nil },
    TelescopePromptTitle  = { guifg = C.yellow, guibg = nil, gui = 'underline', guisp = nil },
    TelescopeResultsTitle = { guifg = C.yellow, guibg = nil, gui = 'underline', guisp = nil },
    TelescopeSelection    = { guifg = nil, guibg = C.black1, gui = nil, guisp = nil },
    TelescopePreviewLine  = { guifg = nil, guibg = C.black1, gui = 'none', guisp = nil },
  }
end

M.loadTreesitter = function()
  return {
    ['@comment'] = 'Comment',
    ['@none'] = 'Ignore',
    ['@preproc'] = 'PreProc',
    ['@define'] = 'Define',
    ['@operator'] = 'Operator',
    ['@punctuation.delimiter'] = 'Delimiter',
    ['@punctuation.bracket'] = 'Delimiter',
    ['@punctuation.special'] = 'Delimiter',
    ['@string'] = 'String',
    ['@string.regex'] = 'String',
    ['@string.escape'] = 'SpecialChar',
    ['@string.special'] = 'SpecialChar',
    ['@character'] = 'Character',
    ['@character.special'] = 'SpecialChar',
    ['@boolean'] = 'Boolean',
    ['@number'] = 'Number',
    ['@float'] = 'Float',
    ['@function'] = 'Function',
    ['@function.builtin'] = 'Special',
    ['@function.call'] = 'Function',
    ['@function.macro'] = 'Macro',
    ['@method'] = 'Function',
    ['@method.call'] = 'Function',
    ['@constructor'] = 'Special',
    ['@parameter'] = 'Identifier',
    ['@keyword'] = 'Keyword',
    ['@keyword.function'] = 'Keyword',
    ['@keyword.operator'] = { guifg = C.light_yellow, guibg = C.none, gui = nil, guisp = nil },
    ['@keyword.return'] = 'Keyword',
    ['@conditional'] = 'Conditional',
    ['@repeat'] = 'Repeat',
    ['@debug'] = 'Debug',
    ['@label'] = 'Label',
    ['@include'] = 'Include',
    ['@exception'] = 'Exception',
    ['@type'] = 'Type',
    ['@type.builtin'] = 'Type',
    ['@type.definition'] = 'Typedef',
    ['@type.qualifier'] = 'Type',
    ['@storageclass'] = 'StorageClass',
    ['@attribute'] = 'PreProc',
    ['@field'] = 'Identifier',
    ['@property'] = 'Identifier',
    ['@variable'] = { guifg = C.light_cyan, guibg = C.none, gui = "bold", guisp = nil },
    ['@variable.builtin'] = 'Special',
    ['@constant'] = 'Constant',
    ['@constant.builtin'] = 'Special',
    ['@constant.macro'] = 'Define',
    ['@namespace'] = { guifg = C.light_cyan, guibg = C.none, gui = nil, guisp = nil },
    ['@symbol'] = 'Identifier',
    ['@text'] = { guifg = C.light_cyan, guibg = C.none, gui = nil, guisp = nil },
    ["@text.strong"] = { guifg = C.none, guibg = C.none, gui = 'bold', guisp = nil },
    ["@text.emphasis"] = { guifg = C.none, guibg = C.none, gui = 'italic', guisp = nil },
    ["@text.underline"] = { guifg = C.none, guibg = C.none, gui = 'underline', guisp = nil },
    ["@text.strike"] = { guifg = C.none, guibg = C.none, gui = 'strikethrough', guisp = nil },
    ["@text.title"] = 'Title',
    ["@text.literal"] = 'String',
    ["@text.uri"] = 'Underlined',
    ["@text.math"] = 'Special',
    ["@text.environment"] = 'Macro',
    ["@text.environment.name"] = 'Type',
    ["@text.reference"] = 'Constant',
    ["@text.todo"] = 'Todo',
    ["@text.note"] = 'SpecialComment',
    ["@text.note.comment"] = { guifg = C.magenta, guibg = C.none, gui = 'bold', guisp = nil },
    ["@text.warning"] = 'WarningMsg',
    ["@text.danger"] = 'ErrorMsg',
    ["@text.danger.comment"] = { guifg = C.light_white, guibg = C.red, gui = 'bold', guisp = nil },
    ["@text.diff.add"] = { guifg = C.light_cyan, guibg = C.none, gui = nil, guisp = nil },
    ["@text.diff.delete"] = { guifg = C.light_yellow, guibg = C.none, gui = nil, guisp = nil },
    ["@tag"] = 'Tag',
    ["@tag.attribute"] = 'Identifier',
    ["@tag.delimiter"] = 'Delimiter',
    ["@punctuation"] = 'Delimiter',
    ["@macro"] = 'Macro',
    ["@structure"] = 'Structure',
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.comment"] = '@comment',
    ["@lsp.type.decorator"] = "@macro",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.enumMember"] = "@constant",
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.interface"] = "@constructor",
    ["@lsp.type.macro"] = "@macro",
    ["@lsp.type.method"] = "@method",
    ["@lsp.type.namespace"] = "@namespace",
    ["@lsp.type.parameter"] = "@parameter",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.struct"] = "@type",
    ["@lsp.type.type"] = "@type",
    ["@lsp.type.typeParameter"] = "@type.definition",
    ["@lsp.type.variable"] = "@variable",
  }
end

--M.loadCustom = function()
--  custom = require('nvim-xresources').config
--  return custom.custom_highlight_groups
--end

return M
