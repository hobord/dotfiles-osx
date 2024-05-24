local config = {}

config.setup = function()
  local global = require('core.global')
  local path_sep = global.is_windows and '\\' or '/'
  local snippets_path = global.vim_path .. path_sep .. 'snippets/friendly-snippets'
  local ls = require("luasnip")
  ls.config.set_config({
    history = true,
    ---- Update more often, :h events for more info.
    updateevents = "TextChanged,TextChangedI",
    --ext_opts = {
    --[types.choiceNode] = {
    --active = {
    --virt_text = { { "choiceNode", "Comment" } },
    --},
    --},
    --},
    ---- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 300,
    ---- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = true,
  })

  ---- You can also use lazy loading so you only get in memory snippets of languages you use
  -- print(snippets_path)
  require("luasnip/loaders/from_vscode").lazy_load({ paths = snippets_path })

  require 'luasnip'.filetype_extend("go", { "go" })

  vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
  vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
  vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true })
  -- inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
  -- imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
  -- imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
  -- vim.cmd [[
  --   snoremap <silent> <s-c-k> <cmd>lua require('luasnip').jump(1)<CR>
  --   snoremap <silent> <s-c-j> <cmd>lua require('luasnip').jump(-1)<CR>
  -- ]]
end

return config
