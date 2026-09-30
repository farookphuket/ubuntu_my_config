local opt = vim.opt

-- line number
opt.number = true
opt.relativenumber = true

-- tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- ui
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"

-- clipboard
-- บังคับใช้ OSC 52 สำหรับ Copy/Paste ผ่าน SSH + Tmux
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

opt.clipboard = "unnamedplus"

-- split
opt.splitright = true
opt.splitbelow = true

-- mouse
opt.mouse = "a"

-- encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
