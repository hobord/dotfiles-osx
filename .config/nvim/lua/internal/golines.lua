local uv,api = vim.loop,vim.api
local stdin = uv.new_pipe(true)
local stdout = uv.new_pipe(false)
local stderr = uv.new_pipe(false)

function go_organize_imports_sync(timeoutms)
    --local context = {source = {organizeImports = true}}
    --vim.validate {context = {context, 't', true}}

    --local params = vim.lsp.util.make_range_params()
    --params.context = context

    --local method = 'textDocument/codeAction'
    --local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)

    ---- imports is indexed with clientid so we cannot rely on index always is 1
    --for _, v in next, resp, nil do
      --local result = v.result
      --if result and result[1] then
        --local edit = result[1].edit
        --vim.lsp.util.apply_workspace_edit(edit)
      --end
    --end
    -- Always do formating
    vim.lsp.buf.formatting()
end

local golines_format = function()
  go_organize_imports_sync(1000)
end

return { golines_format = golines_format }
