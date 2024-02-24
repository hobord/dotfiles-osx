if (not vim.g.vscode) then
  -- require('modules.modules')
  require('modules.lazy')
  require('modules.map')
  require('modules.mouse')
else
  require('modules.vscode')
end
