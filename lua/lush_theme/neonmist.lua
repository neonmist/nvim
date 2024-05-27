--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	local purple = "#B9B0FF"
	local orange = "#ffdea2"
	local red = "#FF9A9A"
	local green = "#A3E7B6"
	local blue = "#A6C8FF"
	local cyan = "#6ddaf5"
	local pink = "#FFB3D9"
	local yellow = "#FFF3B5"
	local background_lighter_3 = "#3C3B56"
	local background_lighter_2 = "#333249"
	local background_lighter_1 = "#2B2A3D"
	local background_primary = "#252335"
	local background_darker_1 = "#1E1D2A"
	local background_darker_2 = "#171623"
	local overlay_1 = "#3C3B56"
	local overlay_2 = "#4D4B68"
	local overlay_3 = "#5E5C7A"
	local text = "#D1D1E0"
	local subtext_1 = "#CCCCCC"
	local subtext_2 = "#999999"

	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--
		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor({ bg = background_primary }), -- Character under the cursor
		CurSearch({ bg = orange, fg = background_primary }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		lCursor({ bg = text, fg = background_primary }), -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine     { }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = purple }), -- Directory names (and other special names in listings)
		DiffAdd({ bg = green, fg = text }), -- Diff mode: Added line |diff.txt|
		DiffChange({ bg = overlay_2, fg = text }), -- Diff mode: Changed line |diff.txt|
		DiffDelete({ fg = red }), -- Diff mode: Deleted line |diff.txt|
		DiffText({ bg = cyan, fg = background_primary }), -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer({ fg = background_lighter_3 }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		TermCursor({ bg = overlay_3, fg = background_primary }), -- Cursor in a focused terminal
		TermCursorNC({ fg = overlay_2 }), -- Cursor in an unfocused terminal
		ErrorMsg({ fg = red }), -- Error messages on the command line
		VertSplit({ fg = text }), -- Column separating vertically split windows
		Folded({ bg = background_lighter_2, fg = subtext_2 }), -- Line used for closed folds
		FoldColumn({ fg = subtext_2 }), -- 'foldcolumn'
		SignColumn({ fg = subtext_2 }), -- Column where |signs| are displayed
		IncSearch({ bg = orange, fg = background_primary }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute({ bg = yellow, fg = background_primary }), -- |:substitute| replacement text highlighting
		LineNr({ fg = subtext_2 }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNrAbove({ fg = subtext_2 }), -- Line number for when the 'relativenumber' option is set, above the cursor line
		LineNrBelow({ fg = subtext_2 }), -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr({ fg = subtext_1 }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineFold({ fg = subtext_1 }), -- Like FoldColumn when 'cursorline' is set for the cursor line
		CursorLineSign({ fg = subtext_1 }), -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ bg = overlay_2, fg = subtext_2 }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg({ fg = green }), -- 'showmode' message (e.g., "-- INSERT -- ")
		MsgArea({ fg = overlay_3 }), -- Area for messages and cmdline
		MsgSeparator({ bg = overlay_3, fg = background_primary }), -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg({ fg = blue }), -- |more-prompt|
		NonText({ fg = background_lighter_3 }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ fg = text }), -- Normal text
		NormalFloat({ fg = overlay_3, bg = background_darker_2 }), -- Normal text in floating windows.
		FloatBorder({ fg = overlay_3, bg = background_darker_2 }), -- Border of floating windows.
		FloatTitle({ fg = text }), -- Title of floating windows.
		NormalNC({ fg = subtext_2 }), -- normal text in non-current windows
		Pmenu({ fg = subtext_2, bg = background_darker_1 }), -- Popup menu: Normal item.
		PmenuSel({ fg = background_primary, bg = text }), -- Popup menu: Selected item.
		PmenuKind({ fg = subtext_2, bg = background_darker_2 }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ fg = background_primary, bg = text }), -- Popup menu: Selected item "kind"
		PmenuExtra({ fg = text, bg = background_darker_2 }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ fg = background_primary, bg = text }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ fg = subtext_2, bg = background_darker_2 }), -- Popup menu: Scrollbar.
		PmenuThumb({ fg = subtext_2, bg = overlay_1 }), -- Popup menu: Thumb of the scrollbar.
		Question({ fg = blue }), -- |hit-enter| prompt and yes/no questions
		QuickFixLine({ fg = blue }), -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ fg = background_primary, bg = orange }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey({ fg = subtext_2 }), -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad({ fg = subtext_1 }), -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap({ fg = subtext_1 }), -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal({ fg = subtext_1 }), -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare({ fg = subtext_1 }), -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine({ fg = text, bg = background_lighter_3 }), -- Status line of current window
		StatusLineNC({ bg = background_darker_2, fg = subtext_2 }), -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine({ bg = background_darker_2, fg = subtext_2 }), -- Tab pages line, not active tab page label
		TabLineFill({ bg = background_darker_2, fg = subtext_2 }), -- Tab pages line, where there are no labels
		TabLineSel({ fg = subtext_2 }), -- Tab pages line, active tab page label
		Title({ fg = text }), -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = background_lighter_3 }), -- Visual mode selection
		VisualNOS({ bg = background_lighter_3 }), -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg({ fg = orange }), -- Warning messages
		Whitespace({ fg = background_primary }), -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator({ fg = overlay_3 }), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu({ bg = subtext_2, fg = background_primary }), -- Current match in 'wildmenu' completion
		WinBar({ fg = overlay_1, bg = background_darker_2 }), -- Window bar of current window
		WinBarNC({ fg = overlay_1, bg = background_darker_2 }), -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment({ fg = subtext_2 }), -- Any comment

		Constant({ fg = orange }), -- (*) Any constant
		String({ fg = green }), --   A string constant: "this is a string"
		Character({ fg = orange }), --   A character constant: 'c', '\n'
		Number({ fg = orange }), --   A number constant: 234, 0xff
		Boolean({ fg = red }), --   A boolean constant: TRUE, false
		Float({ fg = orange }), --   A floating point constant: 2.3e10

		Identifier({ fg = blue }), -- (*) Any variable name
		Function({ fg = purple }), --   Function name (also: methods for classes)

		Statement({ fg = text }), -- (*) Any statement
		Conditional({ fg = purple }), --   if, then, else, endif, switch, etc.
		Repeat({ fg = purple }), --   for, do, while, etc.
		Label({ fg = purple }), --   case, default, etc.
		Operator({ fg = blue }), --   "sizeof", "+", "*", etc.
		Keyword({ fg = orange }), --   any other keyword
		Exception({ fg = red }), --   try, catch, throw

		-- PreProc        { }, -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = orange }), -- (*) int, long, char, etc.
		StorageClass({ fg = orange }), --   static, register, volatile, etc.
		Structure({ fg = red }), --   struct, union, enum, etc.
		Typedef({ fg = orange }), --   A typedef

		Special({ fg = blue }), -- (*) Any special symbol
		SpecialChar({ fg = blue }), --   Special character in a constant
		Tag({ fg = blue }), --   You can use CTRL-] on this
		Delimiter({ fg = blue }), --   Character that needs attention
		SpecialComment({ fg = blue }), --   Special things inside a comment (e.g. '\n')
		Debug({ fg = blue }), --   Debugging statements

		Underlined({ gui = "underline", fg = blue }), -- Text that stands out, HTML links
		Ignore({ fg = subtext_2 }), -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error({ bg = red, fg = text }), -- Any erroneous construct
		Todo({ fg = subtext_1 }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		LspReferenceText({ fg = overlay_3, bg = background_darker_2 }), -- Used for highlighting "text" references
		LspReferenceRead({ fg = overlay_3, bg = background_darker_2 }), -- Used for highlighting "read" references
		LspReferenceWrite({ fg = overlay_3, bg = background_darker_2 }), -- Used for highlighting "write" references
		LspCodeLens({ fg = background_lighter_3 }), -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		LspCodeLensSeparator({ fg = background_lighter_3 }), -- Used to color the seperator between two or more code lens.
		LspSignatureActiveParameter({ fg = overlay_3, bg = background_darker_2 }), -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticError({ fg = red }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = orange }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = cyan }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = blue }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = green }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError({ fg = red }), -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn({ fg = orange }), -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo({ fg = cyan }), -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint({ fg = blue }), -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk({ fg = green }), -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError({}), -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn({}), -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo({}), -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint({}), -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk({}), -- Used to underline "Ok" diagnostics.
		DiagnosticFloatingError({ fg = red }), -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		DiagnosticFloatingWarn({ fg = orange }), -- Used to color "Warn" diagnostic messages in diagnostics float.
		DiagnosticFloatingInfo({ fg = cyan }), -- Used to color "Info" diagnostic messages in diagnostics float.
		DiagnosticFloatingHint({ fg = blue }), -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticFloatingOk({ fg = green }), -- Used to color "Ok" diagnostic messages in diagnostics float.
		DiagnosticSignError({ fg = red }), -- Used for "Error" signs in sign column.
		DiagnosticSignWarn({ fg = orange }), -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo({ fg = cyan }), -- Used for "Info" signs in sign column.
		DiagnosticSignHint({ fg = blue }), -- Used for "Hint" signs in sign column.
		DiagnosticSignOk({ fg = green }), -- Used for "Ok" signs in sign column.

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		sym("@text.literal")({ fg = subtext_2 }), -- Comment
		sym("@text.reference")({}), -- Identifier
		sym("@text.title")({ fg = text }), -- Title
		sym("@text.uri")({ fg = blue }), -- Underlined
		sym("@text.underline")({}), -- Underlined
		sym("@text.todo")({ fg = subtext_1 }), -- Todo
		sym("@comment")({ fg = subtext_2 }), -- Comment
		sym("@punctuation")({ fg = blue }), -- Delimiter
		sym("@constant")({ fg = purple }), -- Constant
		sym("@constant.builtin")({ fg = purple }), -- Special
		sym("@constant.macro")({ fg = blue }), -- Define
		sym("@define")({ fg = text }), -- Define
		sym("@macro")({ fg = blue }), -- Macro
		sym("@string")({ fg = green }), -- String
		sym("@string.escape")({ fg = blue }), -- SpecialChar
		sym("@string.special")({ fg = blue }), -- SpecialChar
		sym("@character")({ fg = purple }), -- Character
		sym("@character.special")({ fg = purple }), -- SpecialChar
		sym("@number")({ fg = orange }), -- Number
		sym("@boolean")({ fg = orange }), -- Boolean
		sym("@float")({ fg = orange }), -- Float
		sym("@function")({ fg = purple }), -- Function
		sym("@function.builtin")({ fg = blue }), -- Special
		sym("@function.macro")({ fg = purple }), -- Macro
		sym("@parameter")({ fg = subtext_2 }), -- Identifier
		sym("@method")({ fg = subtext_2 }), -- Function
		sym("@field")({ fg = subtext_2 }), -- Identifier
		sym("@property")({ fg = subtext_2 }), -- Identifier
		sym("@constructor")({ fg = purple }), -- Special
		sym("@conditional")({ fg = purple }), -- Conditional
		sym("@repeat")({ fg = purple }), -- Repeat
		sym("@label")({ fg = blue }), -- Label
		sym("@operator")({ fg = text }), -- Operator
		sym("@keyword")({ fg = orange }), -- Keyword
		sym("@exception")({ fg = subtext_2 }), -- Exception
		sym("@variable")({ fg = text }), -- Identifier
		sym("@type")({ fg = orange }), -- Type
		sym("@type.definition")({ fg = orange }), -- Typedef
		sym("@storageclass")({ fg = subtext_2 }), -- StorageClass
		sym("@structure")({ fg = subtext_2 }), -- Structure
		sym("@namespace")({ fg = subtext_2 }), -- Identifier
		sym("@include")({ fg = subtext_2 }), -- Include
		sym("@preproc")({ fg = subtext_2 }), -- PreProc
		sym("@debug")({ fg = subtext_2 }), -- Debug
		sym("@tag")({ fg = blue }), -- Tag
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
