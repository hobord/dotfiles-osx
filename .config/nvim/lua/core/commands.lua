
local vim = vim
vim.api.nvim_command("command! BW :bn|:bd#")
vim.api.nvim_command("command! LF FloatermNew lf")
vim.api.nvim_command("command! Vifm FloatermNew --name=vifm --title=vifm --height=0.9 --width=0.9 --autoclose=2 vifm")
vim.api.nvim_command("command! Gitui FloatermNew --name=gitui --title=gitui --height=0.9 --width=0.9 --autoclose=2 gitui")
vim.api.nvim_command('command! Debuger :lua require("dapui").toggle()')



