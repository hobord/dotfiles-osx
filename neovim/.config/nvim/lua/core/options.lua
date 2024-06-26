local global = require('core.global')

local function bind_option(options)
  for k, v in pairs(options) do
    if v == true or v == false then
      vim.cmd('set ' .. k)
    else
      vim.cmd('set ' .. k .. '=' .. v)
    end
  end
end

local function load_options()
  local global_local = {
    termguicolors  = true,
    mouse          = "a", -- nv";
    errorbells     = true,
    visualbell     = true,
    hidden         = true,
    fileformats    = "unix,mac,dos",
    magic          = true,
    virtualedit    = "block",
    encoding       = "utf-8",
    viewoptions    = "folds,cursor,curdir,slash,unix",
    sessionoptions = "curdir,help,tabpages,winsize",
    clipboard      = "unnamedplus",
    wildignorecase = true,
    wildignore     =
    ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
    backup         = false,
    writebackup    = false,
    undofile       = true,
    swapfile       = false,
    directory      = global.cache_dir .. "swag/",
    undodir        = global.cache_dir .. "undo/",
    backupdir      = global.cache_dir .. "backup/",
    viewdir        = global.cache_dir .. "view/",
    spellfile      = global.cache_dir .. "spell/en.uft-8.add",
    history        = 2000,
    shada          = "!,'300,<50,@100,s10,h",
    backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
    smarttab       = true,
    shiftround     = true,
    timeout        = true,
    ttimeout       = true,
    timeoutlen     = 500,
    ttimeoutlen    = 10,
    updatetime     = 100,
    redrawtime     = 1500,
    ignorecase     = true,
    smartcase      = true,
    infercase      = true,
    incsearch      = true,
    wrapscan       = true,
    complete       = ".,w,b,k",
    inccommand     = "nosplit",
    grepformat     = "%f:%l:%c:%m",
    grepprg        = 'rg --hidden --vimgrep --smart-case --',
    breakat        = [[\ \	;:,!?]],
    startofline    = false,
    whichwrap      = "h,l,<,>,[,],~",
    splitbelow     = true,
    splitright     = true,
    switchbuf      = "useopen",
    backspace      = "indent,eol,start",
    diffopt        = "filler,iwhite,internal,algorithm:patience",
    completeopt    = "menu,menuone,noselect",
    jumpoptions    = "stack",
    showmode       = false,
    shortmess      = "aoOTIcF",
    scrolloff      = 5, -- 999;
    sidescrolloff  = 5,
    ruler          = false,
    list           = false, -- show/hide spaces,tabs
    winwidth       = 30,
    winminwidth    = 10,
    pumheight      = 15,
    helpheight     = 12,
    previewheight  = 12,
    showcmd        = false,
    cmdheight      = 0,
    cmdwinheight   = 5,
    equalalways    = false,
    display        = "lastline",
    showbreak      = "↳  ",
    listchars      = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
    pumblend       = 10,
    winblend       = 10,
    foldmethod     = "syntax",
    foldlevelstart = 99,
    foldlevel      = 99,
    wrap           = false,
    fdc            = '1', -- 4
    matchpairs     = "(:),{:},[:],<:>",
    laststatus     = 3,
    -- winbar         = "%{%v:lua.require'modules.ui.winbar'.statusline()%}";
    showtabline    = 0,
    foldcolumn     = "0",
    syntax         = "ON",
    --    selection      = "exclusive",
    -- guicursor      =
    -- "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
  }

  vim.opt.guicursor = {
    'n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
    'r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100'
  }

  vim.g.markdown_fenced_languages = { 'python', 'cpp', 'go', 'typescript', 'sql', 'html', 'javascript', 'rust', 'vim',
    'lua', 'sh', 'bash', 'toml', 'yaml', 'css', 'json', 'dockerfile' }
  --t_ZH           = "^[[3m";
  --t_ZR           = "^[[23m";

  local bw_local = {
    synmaxcol      = 2500,
    formatoptions  = "1jcroql",
    textwidth      = 80,
    expandtab      = true,
    autoindent     = true,
    tabstop        = 2,
    shiftwidth     = 2,
    softtabstop    = -1,
    breakindentopt = "shift:2,min:20",
    linebreak      = true,
    number         = true,
    relativenumber = false,
    nornu          = true,
    colorcolumn    = "0",
    foldenable     = true,
    foldlevelstart = 99,
    foldlevel      = 99,
    signcolumn     = "yes",
    conceallevel   = 2,
    concealcursor  = "niv",
    laststatus     = 3,
  }

  -- vim.g.copilot_no_tab_map = true;


  if global.is_mac then
    vim.g.clipboard = {
      name = "macOS-clipboard",
      copy = {
        ["+"] = "pbcopy",
        ["*"] = "pbcopy",
      },
      paste = {
        ["+"] = "pbpaste",
        ["*"] = "pbpaste",
      },
      cache_enabled = 0
    }
    vim.g.python_host_prog = 'python'
    vim.g.python3_host_prog = 'python3'
  end

  for name, value in pairs(global_local) do
    vim.o[name] = value
  end

  bind_option(bw_local)
end

load_options()
vim.cmd('')
