local groups = {}

local function get_base_colors(colors, contrast)
  local bg = vim.o.background
  local base_colors = {
    -- options (dark mode by default)
    bg0 = colors.dark0,
    bg1 = colors.dark1,
    bg2 = colors.dark2,
    bg3 = colors.dark3,
    bg4 = colors.dark4,
    fg0 = colors.light0,
    fg1 = colors.light1,
    fg2 = colors.light2,
    fg3 = colors.light3,
    fg4 = colors.light4,
    red = colors.bright_red,
    green = colors.bright_green,
    yellow = colors.bright_yellow,
    blue = colors.bright_blue,
    purple = colors.bright_purple,
    aqua = colors.bright_aqua,
    orange = colors.bright_orange,
    neutral_red = colors.neutral_red,
    neutral_green = colors.neutral_green,
    neutral_yellow = colors.neutral_yellow,
    neutral_blue = colors.neutral_blue,
    neutral_purple = colors.neutral_purple,
    neutral_aqua = colors.neutral_aqua,
  }

  local light_colors = {
    bg0 = colors.light0,
    bg1 = colors.light1,
    bg2 = colors.light2,
    bg3 = colors.light3,
    bg4 = colors.light4,
    fg0 = colors.dark0,
    fg1 = colors.dark1,
    fg2 = colors.dark2,
    fg3 = colors.dark3,
    fg4 = colors.dark4,
    red = colors.faded_red,
    green = colors.faded_green,
    yellow = colors.faded_yellow,
    blue = colors.faded_blue,
    purple = colors.faded_purple,
    aqua = colors.faded_aqua,
    orange = colors.faded_orange,
    neutral_red = colors.neutral_red,
    neutral_green = colors.neutral_green,
    neutral_yellow = colors.neutral_yellow,
    neutral_blue = colors.neutral_blue,
    neutral_purple = colors.neutral_purple,
    neutral_aqua = colors.neutral_aqua,
  }

  -- swap colors if light mode
  if bg == "light" then
    base_colors = light_colors
  end

  if contrast == "hard" then
    base_colors.bg0 = colors[bg .. "0_hard"]
  elseif contrast == "soft" then
    base_colors.bg0 = colors[bg .. "0_soft"]
  end

  base_colors.gray = colors.gray

  return base_colors
end

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

groups.setup = function()
  local config = require("fleet").config

  local palette = require("fleet.palette")
  for k, v in pairs(config.palette_overrides) do
    palette[k] = v
  end

  local colors = get_base_colors(palette, config.contrast)
  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    FleetFg0 = { fg = colors.fg0 },
    FleetFg0Bold = { fg = colors.fg0, bold = config.bold },
    FleetFg1 = { fg = colors.fg1 },
    FleetFg1Bold = { fg = colors.fg1, bold = config.bold },
    FleetFg2 = { fg = colors.fg2 },
    FleetFg3 = { fg = colors.fg3 },
    FleetFg4 = { fg = colors.fg4 },
    FleetGray = { fg = colors.gray },
    FleetBg0 = { fg = colors.bg0 },
    FleetBg1 = { fg = colors.bg1 },
    FleetBg2 = { fg = colors.bg2 },
    FleetBg3 = { fg = colors.bg3 },
    FleetBg4 = { fg = colors.bg4 },
    FleetRed = { fg = colors.red },
    FleetRedBold = { fg = colors.red, bold = config.bold },
    FleetGreen = { fg = colors.green },
    FleetGreenBold = { fg = colors.green, bold = config.bold },
    FleetYellow = { fg = colors.yellow },
    FleetYellowBold = { fg = colors.yellow, bold = config.bold },
    FleetBlue = { fg = colors.blue },
    FleetBlueBold = { fg = colors.blue, bold = config.bold },
    FleetPurple = { fg = colors.purple },
    FleetPurpleBold = { fg = colors.purple, bold = config.bold },
    FleetNeutralPurple = { fg = colors.neutral_purple },
    FleetNeutralPurpleBold = { fg = colors.neutral_purple, bold = config.bold },
    FleetAqua = { fg = colors.aqua },
    FleetAquaBold = { fg = colors.aqua, bold = config.bold },
    FleetOrange = { fg = colors.orange },
    FleetOrangeBold = { fg = colors.orange, bold = config.bold },
    FleetRedSign = { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    FleetGreenSign = { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    FleetYellowSign = { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    FleetBlueSign = { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    FleetPurpleSign = { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    FleetAquaSign = { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    FleetOrangeSign = { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    FleetRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    FleetGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    FleetYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    FleetBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    FleetPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    FleetAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    FleetOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.purple, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.aqua },
    CursorLineNr = { fg = colors.fg2, bg = colors.bg1 },
    NonText = { link = "FleetBg2" },
    SpecialKey = { link = "FleetFg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.fg2, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    VertSplit = { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "FleetGreenBold" },
    Title = { link = "FleetGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "FleetYellowBold" },
    ModeMsg = { link = "FleetYellowBold" },
    Question = { link = "FleetOrangeBold" },
    WarningMsg = { link = "FleetRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic },
    FoldColumn = { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "FleetFg2" },
    Comment = { fg = colors.gray, italic = config.italic },
    Todo = { fg = colors.fg0, bold = config.bold, italic = config.italic },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "FleetAqua" },
    Conditional = { link = "FleetAqua" },
    Repeat = { link = "FleetAqua" },
    Label = { link = "FleetAqua" },
    Exception = { link = "FleetRed" },
    Operator = { fg = colors.orange, italic = config.italic },
    Keyword = { link = "FleetAqua" },
    Identifier = { link = "FleetFg1" },
    Field = { link = "FleetNeutralPurple" },
    Function = { link = "FleetFg0Bold" },
    FunctionCall = { link = "FleetYellow" },
    PreProc = { link = "FleetAqua" },
    Include = { link = "FleetFg1" },
    Define = { link = "FleetAqua" },
    Macro = { link = "FleetAqua" },
    PreCondit = { link = "FleetAqua" },
    Constant = { link = "FleetNeutralPurple" },
    Character = { link = "FleetPurple" },
    String = { fg = colors.purple },
    Boolean = { link = "FleetYellow" },
    Number = { link = "FleetYellow" },
    Float = { link = "FleetYellow" },
    Type = { link = "FleetBlueBold" },
    StorageClass = { link = "FleetFg1" },
    Structure = { link = "FleetAquaBold" },
    Typedef = { link = "FleetFg1" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.purple, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "FleetBlueUnderline" },
    SpellBad = { link = "FleetRedUnderline" },
    SpellLocal = { link = "FleetAquaUnderline" },
    SpellRare = { link = "FleetPurpleUnderline" },
    -- LSP Diagnostic
    DiagnosticError = { link = "FleetRed" },
    DiagnosticSignError = { link = "FleetRedSign" },
    DiagnosticUnderlineError = { link = "FleetRedUnderline" },
    DiagnosticWarn = { link = "FleetYellow" },
    DiagnosticSignWarn = { link = "FleetYellowSign" },
    DiagnosticUnderlineWarn = { link = "FleetYellowUnderline" },
    DiagnosticInfo = { link = "FleetBlue" },
    DiagnosticSignInfo = { link = "FleetBlueSign" },
    DiagnosticUnderlineInfo = { link = "FleetBlueUnderline" },
    DiagnosticHint = { link = "FleetAqua" },
    DiagnosticSignHint = { link = "FleetAquaSign" },
    DiagnosticUnderlineHint = { link = "FleetAquaUnderline" },
    DiagnosticFloatingError = { link = "FleetRed" },
    DiagnosticFloatingWarn = { link = "FleetOrange" },
    DiagnosticFloatingInfo = { link = "FleetBlue" },
    DiagnosticFloatingHint = { link = "FleetAqua" },
    DiagnosticVirtualTextError = { link = "FleetRed" },
    DiagnosticVirtualTextWarn = { link = "FleetYellow" },
    DiagnosticVirtualTextInfo = { link = "FleetBlue" },
    DiagnosticVirtualTextHint = { link = "FleetAqua" },
    LspReferenceRead = { link = "FleetYellowBold" },
    LspReferenceText = { link = "FleetYellowBold" },
    LspReferenceWrite = { link = "FleetOrangeBold" },
    LspCodeLens = { link = "FleetGray" },
    -- nvim-treesitter (0.8 compat)
    -- Adapted from https://github.com/nvim-treesitter/nvim-treesitter/commit/42ab95d5e11f247c6f0c8f5181b02e816caa4a4f#commitcomment-87014462
    ["@comment"] = { link = "Comment" },
    ["@none"] = { bg = "NONE", fg = "NONE" },
    ["@preproc"] = { link = "PreProc" },
    ["@define"] = { link = "Define" },
    ["@operator"] = { link = "Operator" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@punctuation.bracket"] = { link = "Delimiter" },
    ["@punctuation.special"] = { link = "Delimiter" },
    ["@string"] = { link = "String" },
    ["@string.regex"] = { link = "String" },
    ["@string.escape"] = { link = "SpecialChar" },
    ["@string.special"] = { link = "SpecialChar" },
    ["@character"] = { link = "Character" },
    ["@character.special"] = { link = "SpecialChar" },
    ["@boolean"] = { link = "Boolean" },
    ["@number"] = { link = "Number" },
    ["@float"] = { link = "Float" },
    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "FunctionCall" },
    ["@function.builtin"] = { link = "Special" },
    ["@function.macro"] = { link = "Macro" },
    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "FunctionCall" },
    ["@constructor"] = { link = "Special" },
    ["@parameter"] = { link = "Identifier" },
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.return"] = { link = "Keyword" },
    ["@conditional"] = { link = "Conditional" },
    ["@repeat"] = { link = "Repeat" },
    ["@debug"] = { link = "Debug" },
    ["@label"] = { link = "Label" },
    ["@include"] = { link = "Include" },
    ["@exception"] = { link = "Exception" },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@type.qualifier"] = { link = "Type" },
    ["@type.definition"] = { link = "Typedef" },
    ["@storageclass"] = { link = "StorageClass" },
    ["@attribute"] = { link = "Identifier" },
    ["@field"] = { link = "Identifier" },
    ["@property"] = { link = "Identifier" },
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { link = "Special" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Special" },
    ["@constant.macro"] = { link = "Define" },
    ["@namespace"] = { link = "Include" },
    ["@symbol"] = { link = "Identifier" },
    ["@text"] = { link = "FleetFg1" },
    ["@text.title"] = { link = "Title" },
    ["@text.literal"] = { link = "String" },
    ["@text.uri"] = { link = "Underlined" },
    ["@text.math"] = { link = "Special" },
    ["@text.environment"] = { link = "Macro" },
    ["@text.environment.name"] = { link = "Type" },
    ["@text.reference"] = { link = "Constant" },
    ["@text.todo"] = { link = "Todo" },
    ["@text.note"] = { link = "SpecialComment" },
    ["@text.warning"] = { link = "WarningMsg" },
    ["@text.danger"] = { link = "ErrorMsg" },
    ["@text.diff.add"] = { link = "diffAdded" },
    ["@text.diff.delete"] = { link = "diffRemoved" },
    ["@tag"] = { link = "Tag" },
    ["@tag.attribute"] = { link = "Identifier" },
    ["@tag.delimiter"] = { link = "Delimiter" },

    -- nvim-treesitter (0.8 overrides)
    ["@text.strong"] = { bold = config.bold },
    ["@text.strike"] = { strikethrough = config.strikethrough },
    ["@text.emphasis"] = { italic = config.italic },
    ["@text.underline"] = { underline = config.underline },
    ["@keyword.operator"] = { link = "FleetRed" },
    -- gitcommit
    gitcommitSelectedFile = { link = "FleetGreen" },
    gitcommitDiscardedFile = { link = "FleetRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "FleetGreenSign" },
    GitSignsChange = { link = "FleetAquaSign" },
    GitSignsDelete = { link = "FleetRedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = palette.neutral_aqua },
    NvimTreeRootFolder = { fg = palette.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = palette.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = palette.light2 },
    NvimTreeExecFile = { fg = palette.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = palette.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = palette.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = palette.neutral_purple },
    NvimTreeIndentMarker = { fg = palette.dark3 },
    NvimTreeGitDirty = { fg = palette.neutral_yellow },
    NvimTreeGitStaged = { fg = palette.neutral_yellow },
    NvimTreeGitMerge = { fg = palette.neutral_purple },
    NvimTreeGitRenamed = { fg = palette.neutral_purple },
    NvimTreeGitNew = { fg = palette.neutral_yellow },
    NvimTreeGitDeleted = { fg = palette.neutral_red },
    NvimTreeWindowPicker = { bg = palette.faded_aqua },
    -- termdebug
    debugPC = { bg = palette.faded_blue },
    debugBreakpoint = { link = "FleetRedSign" },
    -- vim-startify
    StartifyBracket = { link = "FleetFg3" },
    StartifyFile = { link = "FleetFg1" },
    StartifyNumber = { link = "FleetBlue" },
    StartifyPath = { link = "FleetGray" },
    StartifySlash = { link = "FleetGray" },
    StartifySection = { link = "FleetYellow" },
    StartifySpecial = { link = "FleetBg2" },
    StartifyHeader = { link = "FleetOrange" },
    StartifyFooter = { link = "FleetBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "FleetAqua" },
    DirvishArg = { link = "FleetYellow" },
    -- netrw
    netrwDir = { link = "FleetAqua" },
    netrwClassify = { link = "FleetAqua" },
    netrwLink = { link = "FleetGray" },
    netrwSymLink = { link = "FleetFg1" },
    netrwExe = { link = "FleetYellow" },
    netrwComment = { link = "FleetGray" },
    netrwList = { link = "FleetBlue" },
    netrwHelpCmd = { link = "FleetAqua" },
    netrwCmdSep = { link = "FleetFg3" },
    netrwVersion = { link = "FleetGreen" },
    -- nerdtree
    NERDTreeDir = { link = "FleetAqua" },
    NERDTreeDirSlash = { link = "FleetAqua" },
    NERDTreeOpenable = { link = "FleetOrange" },
    NERDTreeClosable = { link = "FleetOrange" },
    NERDTreeFile = { link = "FleetFg1" },
    NERDTreeExecFile = { link = "FleetYellow" },
    NERDTreeUp = { link = "FleetGray" },
    NERDTreeCWD = { link = "FleetGreen" },
    NERDTreeHelp = { link = "FleetFg1" },
    NERDTreeToggleOn = { link = "FleetGreen" },
    NERDTreeToggleOff = { link = "FleetRed" },
    -- coc.nvim
    CocErrorSign = { link = "FleetRedSign" },
    CocWarningSign = { link = "FleetOrangeSign" },
    CocInfoSign = { link = "FleetBlueSign" },
    CocHintSign = { link = "FleetAquaSign" },
    CocErrorFloat = { link = "FleetRed" },
    CocWarningFloat = { link = "FleetOrange" },
    CocInfoFloat = { link = "FleetBlue" },
    CocHintFloat = { link = "FleetAqua" },
    CocDiagnosticsError = { link = "FleetRed" },
    CocDiagnosticsWarning = { link = "FleetOrange" },
    CocDiagnosticsInfo = { link = "FleetBlue" },
    CocDiagnosticsHint = { link = "FleetAqua" },
    CocSelectedText = { link = "FleetRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "FleetGray" },
    CocErrorHighlight = { link = "FleetRedUnderline" },
    CocWarningHighlight = { link = "FleetOrangeUnderline" },
    CocInfoHighlight = { link = "FleetBlueUnderline" },
    CocHintHighlight = { link = "FleetAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "FleetFg1" },
    TelescopeSelection = { link = "FleetOrangeBold" },
    TelescopeSelectionCaret = { link = "FleetRed" },
    TelescopeMultiSelection = { link = "FleetGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "FleetBlue" },
    TelescopePromptPrefix = { link = "FleetRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "FleetFg0" },
    CmpItemAbbrDeprecated = { link = "FleetFg1" },
    CmpItemAbbrMatch = { link = "FleetBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "FleetBlueUnderline" },
    CmpItemMenu = { link = "FleetGray" },
    CmpItemKindText = { link = "FleetOrange" },
    CmpItemKindMethod = { link = "FleetBlue" },
    CmpItemKindFunction = { link = "FleetBlue" },
    CmpItemKindConstructor = { link = "FleetYellow" },
    CmpItemKindField = { link = "FleetBlue" },
    CmpItemKindClass = { link = "FleetYellow" },
    CmpItemKindInterface = { link = "FleetYellow" },
    CmpItemKindModule = { link = "FleetBlue" },
    CmpItemKindProperty = { link = "FleetBlue" },
    CmpItemKindValue = { link = "FleetOrange" },
    CmpItemKindEnum = { link = "FleetYellow" },
    CmpItemKindKeyword = { link = "FleetPurple" },
    CmpItemKindSnippet = { link = "FleetGreen" },
    CmpItemKindFile = { link = "FleetBlue" },
    CmpItemKindEnumMember = { link = "FleetAqua" },
    CmpItemKindConstant = { link = "FleetOrange" },
    CmpItemKindStruct = { link = "FleetYellow" },
    CmpItemKindTypeParameter = { link = "FleetYellow" },
    diffAdded = { link = "FleetGreen" },
    diffRemoved = { link = "FleetRed" },
    diffChanged = { link = "FleetAqua" },
    diffFile = { link = "FleetOrange" },
    diffNewFile = { link = "FleetYellow" },
    diffLine = { link = "FleetBlue" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "FleetBlue" },
    NavicIconsModule = { link = "FleetOrange" },
    NavicIconsNamespace = { link = "FleetBlue" },
    NavicIconsPackage = { link = "FleetAqua" },
    NavicIconsClass = { link = "FleetYellow" },
    NavicIconsMethod = { link = "FleetBlue" },
    NavicIconsProperty = { link = "FleetAqua" },
    NavicIconsField = { link = "FleetPurple" },
    NavicIconsConstructor = { link = "FleetBlue" },
    NavicIconsEnum = { link = "FleetPurple" },
    NavicIconsInterface = { link = "FleetGreen" },
    NavicIconsFunction = { link = "FleetBlue" },
    NavicIconsVariable = { link = "FleetPurple" },
    NavicIconsConstant = { link = "FleetOrange" },
    NavicIconsString = { link = "FleetGreen" },
    NavicIconsNumber = { link = "FleetOrange" },
    NavicIconsBoolean = { link = "FleetOrange" },
    NavicIconsArray = { link = "FleetOrange" },
    NavicIconsObject = { link = "FleetOrange" },
    NavicIconsKey = { link = "FleetAqua" },
    NavicIconsNull = { link = "FleetOrange" },
    NavicIconsEnumMember = { link = "FleetYellow" },
    NavicIconsStruct = { link = "FleetPurple" },
    NavicIconsEvent = { link = "FleetYellow" },
    NavicIconsOperator = { link = "FleetRed" },
    NavicIconsTypeParameter = { link = "FleetRed" },
    NavicText = { link = "FleetWhite" },
    NavicSeparator = { link = "FleetWhite" },
    -- html
    htmlTag = { link = "FleetAquaBold" },
    htmlEndTag = { link = "FleetAquaBold" },
    htmlTagName = { link = "FleetBlue" },
    htmlArg = { link = "FleetOrange" },
    htmlTagN = { link = "FleetFg1" },
    htmlSpecialTagName = { link = "FleetBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "FleetRed" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = config.italic },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = config.italic,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = config.italic,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.italic },
    -- xml
    xmlTag = { link = "FleetAquaBold" },
    xmlEndTag = { link = "FleetAquaBold" },
    xmlTagName = { link = "FleetBlue" },
    xmlEqual = { link = "FleetBlue" },
    docbkKeyword = { link = "FleetAquaBold" },
    xmlDocTypeDecl = { link = "FleetGray" },
    xmlDocTypeKeyword = { link = "FleetPurple" },
    xmlCdataStart = { link = "FleetGray" },
    xmlCdataCdata = { link = "FleetPurple" },
    dtdFunction = { link = "FleetGray" },
    dtdTagName = { link = "FleetPurple" },
    xmlAttrib = { link = "FleetOrange" },
    xmlProcessingDelim = { link = "FleetGray" },
    dtdParamEntityPunct = { link = "FleetGray" },
    dtdParamEntityDPunct = { link = "FleetGray" },
    xmlAttribPunct = { link = "FleetGray" },
    xmlEntity = { link = "FleetRed" },
    xmlEntityPunct = { link = "FleetRed" },
    -- clojure
    clojureKeyword = { link = "FleetBlue" },
    clojureCond = { link = "FleetOrange" },
    clojureSpecial = { link = "FleetOrange" },
    clojureDefine = { link = "FleetOrange" },
    clojureFunc = { link = "FleetYellow" },
    clojureRepeat = { link = "FleetYellow" },
    clojureCharacter = { link = "FleetAqua" },
    clojureStringEscape = { link = "FleetAqua" },
    clojureException = { link = "FleetRed" },
    clojureRegexp = { link = "FleetAqua" },
    clojureRegexpEscape = { link = "FleetAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "FleetFg3" },
    clojureAnonArg = { link = "FleetYellow" },
    clojureVariable = { link = "FleetBlue" },
    clojureMacro = { link = "FleetOrange" },
    clojureMeta = { link = "FleetYellow" },
    clojureDeref = { link = "FleetYellow" },
    clojureQuote = { link = "FleetYellow" },
    clojureUnquote = { link = "FleetYellow" },
    -- C
    cOperator = { link = "FleetPurple" },
    cppOperator = { link = "FleetPurple" },
    cStructure = { link = "FleetOrange" },
    -- python
    pythonBuiltin = { link = "FleetOrange" },
    pythonBuiltinObj = { link = "FleetOrange" },
    pythonBuiltinFunc = { link = "FleetOrange" },
    pythonFunction = { link = "FleetAqua" },
    pythonDecorator = { link = "FleetRed" },
    pythonInclude = { link = "FleetBlue" },
    pythonImport = { link = "FleetBlue" },
    pythonRun = { link = "FleetBlue" },
    pythonCoding = { link = "FleetBlue" },
    pythonOperator = { link = "FleetRed" },
    pythonException = { link = "FleetRed" },
    pythonExceptions = { link = "FleetPurple" },
    pythonBoolean = { link = "FleetPurple" },
    pythonDot = { link = "FleetFg3" },
    pythonConditional = { link = "FleetRed" },
    pythonRepeat = { link = "FleetRed" },
    pythonDottedName = { link = "FleetGreenBold" },
    -- CSS
    cssBraces = { link = "FleetBlue" },
    cssFunctionName = { link = "FleetYellow" },
    cssIdentifier = { link = "FleetOrange" },
    cssClassName = { link = "FleetGreen" },
    cssColor = { link = "FleetBlue" },
    cssSelectorOp = { link = "FleetBlue" },
    cssSelectorOp2 = { link = "FleetBlue" },
    cssImportant = { link = "FleetGreen" },
    cssVendor = { link = "FleetFg1" },
    cssTextProp = { link = "FleetAqua" },
    cssAnimationProp = { link = "FleetAqua" },
    cssUIProp = { link = "FleetYellow" },
    cssTransformProp = { link = "FleetAqua" },
    cssTransitionProp = { link = "FleetAqua" },
    cssPrintProp = { link = "FleetAqua" },
    cssPositioningProp = { link = "FleetYellow" },
    cssBoxProp = { link = "FleetAqua" },
    cssFontDescriptorProp = { link = "FleetAqua" },
    cssFlexibleBoxProp = { link = "FleetAqua" },
    cssBorderOutlineProp = { link = "FleetAqua" },
    cssBackgroundProp = { link = "FleetAqua" },
    cssMarginProp = { link = "FleetAqua" },
    cssListProp = { link = "FleetAqua" },
    cssTableProp = { link = "FleetAqua" },
    cssFontProp = { link = "FleetAqua" },
    cssPaddingProp = { link = "FleetAqua" },
    cssDimensionProp = { link = "FleetAqua" },
    cssRenderProp = { link = "FleetAqua" },
    cssColorProp = { link = "FleetAqua" },
    cssGeneratedContentProp = { link = "FleetAqua" },
    -- javascript
    javaScriptBraces = { link = "FleetFg1" },
    javaScriptFunction = { link = "FleetAqua" },
    javaScriptIdentifier = { link = "FleetAquad" },
    javaScriptMember = { link = "FleetAqua" },
    javaScriptNumber = { link = "FleetPurple" },
    javaScriptNull = { link = "FleetPurple" },
    javaScriptParens = { link = "FleetFg3" },
    -- typescript
    typescriptReserved = { link = "FleetAqua" },
    typescriptLabel = { link = "FleetAqua" },
    typescriptFuncKeyword = { link = "FleetAqua" },
    typescriptIdentifier = { link = "FleetOrange" },
    typescriptBraces = { link = "FleetFg1" },
    typescriptEndColons = { link = "FleetFg1" },
    typescriptDOMObjects = { link = "FleetFg1" },
    typescriptAjaxMethods = { link = "FleetFg1" },
    typescriptLogicSymbols = { link = "FleetFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "FleetFg1" },
    typescriptParens = { link = "FleetFg3" },
    typescriptOpSymbols = { link = "FleetFg3" },
    typescriptHtmlElemProperties = { link = "FleetFg1" },
    typescriptNull = { link = "FleetPurple" },
    typescriptInterpolationDelimiter = { link = "FleetAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "FleetAqua" },
    purescriptModuleName = { link = "FleetFg1" },
    purescriptWhere = { link = "FleetAqua" },
    purescriptDelimiter = { link = "FleetFg4" },
    purescriptType = { link = "FleetFg1" },
    purescriptImportKeyword = { link = "FleetAqua" },
    purescriptHidingKeyword = { link = "FleetAqua" },
    purescriptAsKeyword = { link = "FleetAqua" },
    purescriptStructure = { link = "FleetAqua" },
    purescriptOperator = { link = "FleetAqua" },
    purescriptTypeVar = { link = "FleetFg1" },
    purescriptConstructor = { link = "FleetFg1" },
    purescriptFunction = { link = "FleetFg1" },
    purescriptConditional = { link = "FleetOrange" },
    purescriptBacktick = { link = "FleetOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "FleetFg3" },
    coffeeSpecialOp = { link = "FleetFg3" },
    coffeeCurly = { link = "FleetOrange" },
    coffeeParen = { link = "FleetFg3" },
    coffeeBracket = { link = "FleetOrange" },
    -- ruby
    rubyStringDelimiter = { link = "FleetGreen" },
    rubyInterpolationDelimiter = { link = "FleetAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "FleetRed" },
    objcDirective = { link = "FleetBlue" },
    -- go
    goDirective = { link = "FleetGreen" },
    goConstants = { link = "FleetNeutralPurple" },
    goDeclaration = { link = "FleetAqua" },
    goDeclType = { link = "FleetFg1" },
    goBuiltins = { link = "FleetAqua" },
    -- lua
    luaIn = { link = "FleetRed" },
    luaFunction = { link = "FleetAqua" },
    luaTable = { link = "FleetOrange" },
    -- moonscript
    moonSpecialOp = { link = "FleetFg3" },
    moonExtendedOp = { link = "FleetFg3" },
    moonFunction = { link = "FleetFg3" },
    moonObject = { link = "FleetYellow" },
    -- java
    javaAnnotation = { link = "FleetAqua" },
    javaDocTags = { link = "FleetAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "FleetFg3" },
    javaParen1 = { link = "FleetFg3" },
    javaParen2 = { link = "FleetFg3" },
    javaParen3 = { link = "FleetFg3" },
    javaParen4 = { link = "FleetFg3" },
    javaParen5 = { link = "FleetFg3" },
    javaOperator = { link = "FleetOrange" },
    javaVarArg = { link = "FleetGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "FleetGreen" },
    elixirInterpolationDelimiter = { link = "FleetAqua" },
    elixirModuleDeclaration = { link = "FleetYellow" },
    -- scala
    scalaNameDefinition = { link = "FleetFg1" },
    scalaCaseFollowing = { link = "FleetFg1" },
    scalaCapitalWord = { link = "FleetFg1" },
    scalaTypeExtension = { link = "FleetFg1" },
    scalaKeyword = { link = "FleetRed" },
    scalaKeywordModifier = { link = "FleetRed" },
    scalaSpecial = { link = "FleetAqua" },
    scalaOperator = { link = "FleetFg1" },
    scalaTypeDeclaration = { link = "FleetYellow" },
    scalaTypeTypePostDeclaration = { link = "FleetYellow" },
    scalaInstanceDeclaration = { link = "FleetFg1" },
    scalaInterpolation = { link = "FleetAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = config.italic },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = config.italic },
    markdownH1 = { link = "FleetGreenBold" },
    markdownH2 = { link = "FleetGreenBold" },
    markdownH3 = { link = "FleetYellowBold" },
    markdownH4 = { link = "FleetYellowBold" },
    markdownH5 = { link = "FleetYellow" },
    markdownH6 = { link = "FleetYellow" },
    markdownCode = { link = "FleetAqua" },
    markdownCodeBlock = { link = "FleetAqua" },
    markdownCodeDelimiter = { link = "FleetAqua" },
    markdownBlockquote = { link = "FleetGray" },
    markdownListMarker = { link = "FleetGray" },
    markdownOrderedListMarker = { link = "FleetGray" },
    markdownRule = { link = "FleetGray" },
    markdownHeadingRule = { link = "FleetGray" },
    markdownUrlDelimiter = { link = "FleetFg3" },
    markdownLinkDelimiter = { link = "FleetFg3" },
    markdownLinkTextDelimiter = { link = "FleetFg3" },
    markdownHeadingDelimiter = { link = "FleetOrange" },
    markdownUrl = { link = "FleetPurple" },
    markdownUrlTitleDelimiter = { link = "FleetGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "FleetBlue" },
    haskellIdentifier = { link = "FleetAqua" },
    haskellSeparator = { link = "FleetFg4" },
    haskellDelimiter = { link = "FleetOrange" },
    haskellOperators = { link = "FleetPurple" },
    haskellBacktick = { link = "FleetOrange" },
    haskellStatement = { link = "FleetPurple" },
    haskellConditional = { link = "FleetPurple" },
    haskellLet = { link = "FleetRed" },
    haskellDefault = { link = "FleetRed" },
    haskellWhere = { link = "FleetRed" },
    haskellBottom = { link = "FleetRedBold" },
    haskellImportKeywords = { link = "FleetPurpleBold" },
    haskellDeclKeyword = { link = "FleetOrange" },
    haskellDecl = { link = "FleetOrange" },
    haskellDeriving = { link = "FleetPurple" },
    haskellAssocType = { link = "FleetAqua" },
    haskellNumber = { link = "FleetAqua" },
    haskellPragma = { link = "FleetRedBold" },
    haskellTH = { link = "FleetAquaBold" },
    haskellForeignKeywords = { link = "FleetGreen" },
    haskellKeyword = { link = "FleetRed" },
    haskellFloat = { link = "FleetAqua" },
    haskellInfix = { link = "FleetPurple" },
    haskellQuote = { link = "FleetGreenBold" },
    haskellShebang = { link = "FleetYellowBold" },
    haskellLiquid = { link = "FleetPurpleBold" },
    haskellQuasiQuoted = { link = "FleetBlueBold" },
    haskellRecursiveDo = { link = "FleetPurple" },
    haskellQuotedType = { link = "FleetRed" },
    haskellPreProc = { link = "FleetFg4" },
    haskellTypeRoles = { link = "FleetRedBold" },
    haskellTypeForall = { link = "FleetRed" },
    haskellPatternKeyword = { link = "FleetBlue" },
    -- json
    jsonKeyword = { link = "FleetGreen" },
    jsonQuote = { link = "FleetGreen" },
    jsonBraces = { link = "FleetFg1" },
    jsonString = { link = "FleetFg1" },
    -- mail
    mailQuoted1 = { link = "FleetAqua" },
    mailQuoted2 = { link = "FleetPurple" },
    mailQuoted3 = { link = "FleetYellow" },
    mailQuoted4 = { link = "FleetGreen" },
    mailQuoted5 = { link = "FleetRed" },
    mailQuoted6 = { link = "FleetOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "FleetFg1" },
    csEndColon = { link = "FleetFg1" },
    csLogicSymbols = { link = "FleetFg1" },
    csParens = { link = "FleetFg3" },
    csOpSymbols = { link = "FleetFg3" },
    csInterpolationDelimiter = { link = "FleetFg3" },
    csInterpolationAlignDel = { link = "FleetAquaBold" },
    csInterpolationFormat = { link = "FleetAqua" },
    csInterpolationFormatDel = { link = "FleetAquaBold" },
    -- rust btw
    rustSigil = { link = "FleetOrange" },
    rustEscape = { link = "FleetAqua" },
    rustStringContinuation = { link = "FleetAqua" },
    rustEnum = { link = "FleetAqua" },
    rustStructure = { link = "FleetAqua" },
    rustModPathSep = { link = "FleetFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "FleetAqua" },
    -- ocaml
    ocamlOperator = { link = "FleetFg1" },
    ocamlKeyChar = { link = "FleetOrange" },
    ocamlArrow = { link = "FleetOrange" },
    ocamlInfixOpKeyword = { link = "FleetRed" },
    ocamlConstructor = { link = "FleetOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "FleetFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "FleetFg1" },
    LspSagaAutoPreview = { link = "FleetOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "FleetAqua" },
    LspSagaDefPreviewBorder = { link = "FleetBlue" },
    LspSagaHoverBorder = { link = "FleetOrange" },
    LspSagaRenameBorder = { link = "FleetBlue" },
    LspSagaDiagnosticSource = { link = "FleetOrange" },
    LspSagaDiagnosticBorder = { link = "FleetPurple" },
    LspSagaDiagnosticHeader = { link = "FleetGreen" },
    LspSagaSignatureHelpBorder = { link = "FleetGreen" },
    SagaShadow = { link = "FleetBg0" },

    -- dashboard-nvim
    DashboardShortCut = { link = "FleetOrange" },
    DashboardHeader = { link = "FleetAqua" },
    DashboardCenter = { link = "FleetYellow" },
    DashboardFooter = { fg = colors.purple, italic = config.italic },
    -- mason
    MasonHighlight = { fg = palette.neutral_blue },
    MasonHighlightBlock = { fg = palette.dark0, bg = palette.neutral_blue },
    MasonHighlightBlockBold = { fg = palette.dark0, bg = palette.neutral_blue, bold = true },
    MasonHighlightSecondary = { fg = palette.neutral_yellow },
    MasonHighlightBlockSecondary = { fg = palette.dark0, bg = palette.neutral_yellow },
    MasonHighlightBlockBoldSecondary = { fg = palette.dark0, bg = palette.neutral_yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = palette.light4 },
    MasonMutedBlock = { fg = palette.dark0, bg = palette.light4 },
    MasonMutedBlockBold = { fg = palette.dark0, bg = palette.light4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "FleetFg1" },
    CarbonExe = { link = "FleetYellow" },
    CarbonSymlink = { link = "FleetAqua" },
    CarbonBrokenSymlink = { link = "FleetRed" },
    CarbonIndicator = { link = "FleetGray" },
    CarbonDanger = { link = "FleetRed" },
    CarbonPending = { link = "FleetYellow" },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] and not vim.tbl_isempty(hl) then
      groups[group].link = nil
    end
    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return groups
