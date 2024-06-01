local vim = vim
-- vim.api.nvim_command("command! BW :bn|:bd#")

vim.api.nvim_command("command! FormatJSON %!jq .")
vim.api.nvim_command("command! CompactJSON %!jq -r tostring")
vim.api.nvim_create_user_command("VscodeLoadLaunchJS", function()
  require("dap.ext.vscode").load_launchjs()
end, { nargs = 0 })

vim.api.nvim_command("command! Terminal ToggleTerm")
vim.api.nvim_command("command! Terminal2 ToggleTerm 2")
vim.api.nvim_command("command! Terminal3 ToggleTerm 3")
