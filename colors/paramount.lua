vim.cmd("hi clear")

if vim.fn.exists("syntax on") ~= 0 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "paramount"

local s = {
	black = { gui = "#000000", cterm = "232" },
	medium_gray = { gui = "#767676", cterm = 243 },
	white = { gui = "#F1F1F1", cterm = "15" },
	actual_white = { gui = "#FFFFFF", cterm = "231" },
	subtle_black = { gui = "#303030", cterm = "236" },
	light_black = { gui = "#262626", cterm = "235" },
	lighter_black = { gui = "#4E4E4E", cterm = "239" },
	light_gray = { gui = "#A8A8A8", cterm = "248" },
	lighter_gray = { gui = "#C6C6C6", cterm = "251" },
	lightest_gray = { gui = "#EEEEEE", cterm = "255" },
	pink = { gui = "#fb007a", cterm = "9" },
	dark_red = { gui = "#C30771", cterm = "1" },
	light_red = { gui = "#E32791", cterm = "1" },
	orange = { gui = "#D75F5F", cterm = "167" },
	darker_blue = { gui = "#005F87", cterm = "18" },
	dark_blue = { gui = "#008EC4", cterm = "32" },
	blue = { gui = "#20BBFC", cterm = "12" },
	light_blue = { gui = "#b6d6fd", cterm = "153" },
	dark_cyan = { gui = "#20A5BA", cterm = "6" },
	light_cyan = { gui = "#4FB8CC", cterm = "14" },
	dark_green = { gui = "#10A778", cterm = "2" },
	light_green = { gui = "#5FD7A7", cterm = "10" },
	dark_purple = { gui = "#af5fd7", cterm = "134" },
	light_purple = { gui = "#a790d5", cterm = "140" },
	yellow = { gui = "#F3E430", cterm = "11" },
	light_yellow = { gui = "#ffff87", cterm = "228" },
	dark_yellow = { gui = "#A89C14", cterm = "3" },
	background = { gui = "NONE", cterm = "69" },
	gitSigns = {
		add = { gui = "#266d6a", cterm = "69" },
		change = { gui = "#536c9e", cterm = "69" },
		delete = { gui = "#b2555b", cterm = "69" },
	},
}

if vim.fn.exists("&background") == 1 and vim.o.background == "dark" then
	s.bg = s.black
	s.bg_subtle = s.lighter_black
	s.bg_very_subtle = s.subtle_black
	s.norm = s.lighter_gray
	s.norm_subtle = s.medium_gray
	s.purple = s.light_purple
	s.cyan = s.light_cyan
	s.green = s.light_green
	s.red = s.light_red
	s.visual = s.light_purple
	s.yellow = s.light_yellow
else
	s.bg = s.actual_white
	s.bg_subtle = s.light_gray
	s.bg_very_subtle = s.lightest_gray
	s.norm = s.light_black
	s.norm_subtle = s.medium_gray
	s.purple = s.dark_purple
	s.cyan = s.dark_cyan
	s.green = s.dark_green
	s.red = s.dark_red
	s.visual = s.dark_purple
	s.yellow = s.dark_yellow
end

function s:highlight(group, style)
	vim.cmd(
		"highlight "
			.. group
			.. " guifg="
			.. (style.fg and style.fg.gui or "NONE")
			.. " guibg="
			.. (style.bg and style.bg.gui or "NONE")
			.. " guisp="
			.. (style.sp and style.sp.gui or "NONE")
			.. " gui="
			.. (style.gui or "NONE")
			.. " ctermfg="
			.. (style.fg and style.fg.cterm or "NONE")
			.. " ctermbg="
			.. (style.bg and style.bg.cterm or "NONE")
			.. " cterm="
			.. (style.cterm or "NONE")
	)
end

s:highlight("Cursor", { bg = s.purple, fg = s.norm })
s:highlight("Comment", { fg = s.bg_subtle, gui = "italic" })

s:highlight("Constant", { fg = s.purple })
vim.cmd("hi! link Character Constant")
vim.cmd("hi! link Number Constant")
vim.cmd("hi! link Boolean Constant")
vim.cmd("hi! link Float Constant")
vim.cmd("hi! link String Constant")

s:highlight("Identifier", { fg = s.dark_blue })
vim.cmd("hi! link Identifier Normal")
vim.cmd("hi! link Function Identifier")

s:highlight("Statement", { fg = s.norm_subtle })
vim.cmd("hi! link Conditional Statement")
vim.cmd("hi! link Repeat Statement")
vim.cmd("hi! link Label Statement")
vim.cmd("hi! link Exception Statement")
vim.cmd("hi! link @include Statement")

s:highlight("Keyword", { fg = s.purple })

s:highlight("Operator", { fg = s.norm, cterm = "bold", gui = "bold" })

vim.cmd("hi! link PreProc Include")
vim.cmd("hi! link PreProc Define")
vim.cmd("hi! link PreProc Macro")
vim.cmd("hi! link PreProc PreCondit")

s:highlight("Type", { fg = s.norm })
vim.cmd("hi! link Type StorageClass")
vim.cmd("hi! link Type Structure")
vim.cmd("hi! link Type Typedef")

s:highlight("Special", { fg = s.norm_subtle, gui = "italic" })
vim.cmd("hi! link Special SpecialChar")
vim.cmd("hi! link Special Tag")
vim.cmd("hi! link Special Delimiter")
vim.cmd("hi! link Special SpecialComment")
vim.cmd("hi! link Special Debug")

s:highlight("Underlined", { fg = s.norm, gui = "underline", cterm = "underline" })
s:highlight("Ignore", { fg = s.bg })
s:highlight("Error", { fg = s.actual_white, bg = s.red, cterm = "bold" })
s:highlight("Todo", { fg = s.purple, gui = "underline", cterm = "underline" })
s:highlight("SpecialKey", { fg = s.light_green })
s:highlight("NonText", { fg = s.medium_gray })
s:highlight("Directory", { fg = s.dark_blue })
s:highlight("ErrorMsg", { fg = s.red })
s:highlight("IncSearch", { bg = s.yellow, fg = s.light_black })
s:highlight("Search", { bg = s.light_green, fg = s.light_black })
s:highlight("MoreMsg", { fg = s.medium_gray, cterm = "bold", gui = "bold" })
vim.cmd("hi! link ModeMsg MoreMsg")
s:highlight("LineNr", { fg = s.bg_subtle })
s:highlight("CursorLineNr", { fg = s.purple, bg = s.bg_very_subtle })
s:highlight("Question", { fg = s.red })
s:highlight("StatusLine", { bg = s.bg_very_subtle })
s:highlight("StatusLineNC", { bg = s.bg_very_subtle, fg = s.medium_gray })
s:highlight("VertSplit", { bg = s.bg_very_subtle, fg = s.bg_very_subtle })
s:highlight("Title", { fg = s.dark_blue })
s:highlight("Visual", { fg = s.norm, bg = s.visual })
s:highlight("VisualNOS", { bg = s.bg_subtle })
s:highlight("WarningMsg", { fg = s.yellow })
s:highlight("WildMenu", { fg = s.bg, bg = s.norm })
s:highlight("Folded", { fg = s.medium_gray })
s:highlight("FoldColumn", { fg = s.bg_subtle })
s:highlight("DiffAdd", { fg = s.green })
s:highlight("DiffDelete", { fg = s.red })
s:highlight("DiffChange", { fg = s.dark_yellow })
s:highlight("DiffText", { fg = s.dark_blue })
s:highlight("SignColumn", { fg = s.light_green })

if vim.fn.has("gui_running") == 1 then
	s:highlight("SpellBad", { gui = "underline", sp = s.red })
	s:highlight("SpellCap", { gui = "underline", sp = s.light_green })
	s:highlight("SpellRare", { gui = "underline", sp = s.pink })
	s:highlight("SpellLocal", { gui = "underline", sp = s.dark_green })
else
	s:highlight("SpellBad", { cterm = "underline", fg = s.red })
	s:highlight("SpellCap", { cterm = "underline", fg = s.light_green })
	s:highlight("SpellRare", { cterm = "underline", fg = s.pink })
	s:highlight("SpellLocal", { cterm = "underline", fg = s.dark_green })
end

s:highlight("Pmenu", { fg = s.norm, bg = s.bg_subtle })
s:highlight("PmenuSel", { fg = s.norm, bg = s.purple })
s:highlight("PmenuSbar", { fg = s.norm, bg = s.bg_subtle })
s:highlight("PmenuThumb", { fg = s.norm, bg = s.bg_subtle })
s:highlight("TabLine", { fg = s.norm, bg = s.bg_very_subtle })
s:highlight("TabLineSel", { fg = s.purple, bg = s.bg_subtle, gui = "bold", cterm = "bold" })
s:highlight("TabLineFill", { fg = s.norm, bg = s.bg_very_subtle })
s:highlight("CursorColumn", { bg = s.bg_very_subtle })
s:highlight("CursorLine", { bg = s.bg_very_subtle })
s:highlight("ColorColumn", { bg = s.bg_subtle })

s:highlight("MatchParen", { bg = s.bg_subtle, fg = s.norm })
s:highlight("qfLineNr", { fg = s.medium_gray })

s:highlight("htmlH1", { bg = s.bg, fg = s.norm })
s:highlight("htmlH2", { bg = s.bg, fg = s.norm })
s:highlight("htmlH3", { bg = s.bg, fg = s.norm })
s:highlight("htmlH4", { bg = s.bg, fg = s.norm })
s:highlight("htmlH5", { bg = s.bg, fg = s.norm })
s:highlight("htmlH6", { bg = s.bg, fg = s.norm })

s:highlight("SyntasticWarningSign", { fg = s.yellow })
s:highlight("SyntasticWarning", { bg = s.yellow, fg = s.black, gui = "bold", cterm = "bold" })
s:highlight("SyntasticErrorSign", { fg = s.red })
s:highlight("SyntasticError", { bg = s.red, fg = s.white, gui = "bold", cterm = "bold" })

-- Neomake
vim.cmd("hi link NeomakeWarningSign SyntasticWarningSign")
vim.cmd("hi link NeomakeErrorSign SyntasticErrorSign")

-- ALE
vim.cmd("hi link ALEWarningSign SyntasticWarningSign")
vim.cmd("hi link ALEErrorSign SyntasticErrorSign")

-- Signify, git-gutter
vim.cmd("hi link SignifySignAdd LineNr")
vim.cmd("hi link SignifySignDelete LineNr")
vim.cmd("hi link SignifySignChange LineNr")
vim.cmd("hi link GitGutterAdd LineNr")
vim.cmd("hi link GitGutterDelete LineNr")
vim.cmd("hi link GitGutterChange LineNr")
vim.cmd("hi link GitGutterChangeDelete LineNr")

s:highlight("WinSeparator", { bg = "NONE", fg = s.light_black })

s:highlight("DiagnosticError", { fg = s.orange, bg = "NONE" })

s:highlight("GitSignsAdd", { fg = s.gitSigns.add })
s:highlight("GitSignsChange", { fg = s.gitSigns.change })
s:highlight("GitSignsDelete", { fg = s.gitSigns.delete })
