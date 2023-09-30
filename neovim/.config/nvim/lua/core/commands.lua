local vim = vim
-- vim.api.nvim_command("command! BW :bn|:bd#")

vim.api.nvim_command("command! FormatJSON %!jq .")
vim.api.nvim_command("command! CompactJSON %!jq -r tostring")
