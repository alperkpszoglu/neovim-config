-- Use the system clipboard for all yank/delete/put operations
vim.opt.clipboard = "unnamedplus"

-- Use PowerShell 7 instead of cmd.exe for :! and :terminal
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag =
	"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

vim.g.mapleader = " "

vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.scrolloff = 8

-- Auto-source project-local .nvim.lua files (e.g. dap.configurations.cs per project)
vim.opt.exrc = true

