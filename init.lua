local cmd, fn, call = vim.cmd, vim.fn, vim.call
local opt, g, b, bo = vim.o, vim.g, vim.b, vim.bo
local api, lsp, diagnostic = vim.api, vim.lsp, vim.diagnostic

-- Should be loaded before any other plugin
-- Remove once https://github.com/neovim/neovim/pull/15436 gets merged
require('impatient')

require('packer').init({
  autoremove = true
})

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'                  -- Makes actions like `:Gpush` asynchronous
  use 'tpope/vim-dispatch'
  use 'tpope/vim-eunuch'
  use 'tpope/vim-abolish'
  use { 'inkarkat/vim-visualrepeat', requires = 'inkarkat/vim-ingo-library' }
  use 'milkypostman/vim-togglelist'         -- Mapping to toggle QuickFix window
  use 'kana/vim-niceblock'                  -- Improves visual mode
  use 'kana/vim-textobj-syntax'
  use 'haya14busa/vim-textobj-function-syntax'
  use 'PeterRincker/vim-argumentative'      -- Adds mappings for swapping arguments
  use 'AndrewRadev/splitjoin.vim'
  use 'junegunn/vim-easy-align'
  use 'dkarter/bullets.vim'                 -- Autocomplete markdown lists, etc.
  use 'Julian/vim-textobj-variable-segment' -- camelCase and snake_case text objects
  use 'wsdjeg/vim-fetch'                    -- Line and column position when opening file
  use 'meain/vim-printer'
  use 'camspiers/lens.vim'                  -- Automatic window resizing
  use 'Ron89/thesaurus_query.vim'           -- Synonyms and antonyms of a given word
  use 'mbbill/undotree'
  use 'breuckelen/vim-resize'               -- Resizing with arrow keys
  use 'junegunn/vim-peekaboo'               -- Register selection window
  use { 'RishabhRD/nvim-cheat.sh', requires = 'RishabhRD/popfix' }
  use { 'RRethy/vim-hexokinase', run = 'make' } -- Displays the colours (rgb, etc.) in files
  use 'mhinz/vim-startify'                  -- Nicer start screen
  use 'DanilaMihailov/beacon.nvim'          -- Flash the cursor location on jump
  use 'lukas-reineke/indent-blankline.nvim'
  use 'coreyja/fzf.devicon.vim'
  use 'Xuyuanp/scrollbar.nvim'
  use 'kyazdani42/nvim-web-devicons'        -- Nerdfont icons
  use 'kyazdani42/nvim-tree.lua'            -- File explorer
  use 'romgrk/barbar.nvim'                  -- Sexiest buffer tabline
  use 'mhartington/formatter.nvim'          -- Auto formatting
  use 'karb94/neoscroll.nvim'               -- Smooth scrolling animations
  use 'famiu/feline.nvim'                   -- Statusline creation framework
  use 'SmiteshP/nvim-gps'                   -- Display current scope in statusline
  use 'j-hui/fidget.nvim'                   -- LSP progress in the bottom right corner
  use 'lewis6991/gitsigns.nvim'             -- Git status in sign column

  use 'neovim/nvim-lspconfig'               -- Enables built-in LSP
  use 'williamboman/nvim-lsp-installer'     -- Adds LspInstall command
  use 'L3MON4D3/LuaSnip'                    -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-nvim-lua'
  use { 'tzachar/cmp-tabnine', run = './install.sh' }
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'                -- VSCode-like completion icons
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'melkster/friendly-snippets'          -- Snippet collection
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-treesitter/playground'
  use 'nvim-lua/lsp-status.nvim'
  use 'folke/trouble.nvim'
  use 'b0o/schemastore.nvim'
  use 'jvgrootveld/telescope-zoxide'
  use 'dhruvmanila/telescope-bookmarks.nvim'
  use 'nvim-telescope/telescope-cheat.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sqlite.lua' }
  use 'JoseConseco/telescope_sessions_picker.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
  }
  use 'stevearc/dressing.nvim'              -- Improves default `vim.ui` interfaces
  use 'MunifTanjim/nui.nvim'                -- UI component library
  use 'milisims/nvim-luaref'                -- Vim :help reference for lua
  use 'folke/lua-dev.nvim'                  -- Lua signature help, docs and completion
  use 'ethanholz/nvim-lastplace'            -- Reopen files at last edit position
  use 'monaqa/dial.nvim'                    -- Enhanced increment/decrement
  use { 'numToStr/Comment.nvim', branch = 'plug' } -- TODO: remove `branch` once merged
  use 'NTBBloodbath/rest.nvim'              -- For sending HTTP requests
  use 'mfussenegger/nvim-dap'               -- Debugger client
  use 'rcarriga/nvim-dap-ui'                -- UI for nvim-dap
  use 'Pocco81/DAPInstall.nvim'             -- Installing and managing debuggers
  use 'jbyuki/one-small-step-for-vimkind'   -- Lua plugin debug adapter
  use 'ful1e5/onedark.nvim'
  use 'ThePrimeagen/refactoring.nvim'
  use 'Darazaki/indent-o-matic'             -- Automatic indentation detection
  use 'lewis6991/impatient.nvim'            -- Improve startup time for Neovim
  use 'jakelinnzy/autocmd-lua'              -- Lua autocommands
  use 'bfredl/nvim-miniyank'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'unblevable/quick-scope'
  use 'andymass/vim-matchup'                -- Ads additional `%` commands
  use 'windwp/nvim-autopairs'               -- Auto-close brackets, etc.
  use 'junegunn/fzf.vim'
  use 'vim-scripts/capslock.vim'            -- Adds caps lock mapping to insert mode
  use 'vim-scripts/StripWhiteSpaces'
  use 'inkarkat/vim-CountJump'              -- Dependency for ConflictMotions
  use { 'inkarkat/vim-ConflictMotions', requires = 'inkarkat/vim-ingo-library' }
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-function'
  use 'kana/vim-textobj-line'
  use 'kana/vim-textobj-entire'
  use 'lervag/vimtex'
  use 'AndrewRadev/dsf.vim'
  use 'michaeljsmith/vim-indent-object'
  use 'wellle/targets.vim'                  -- Adds arguments, etc. as text objects
  use 'romainl/vim-cool'                    -- Better search highlighting behaviour
  use 'plasticboy/vim-markdown'             -- Adds extra features to markdown
  use 'coachshea/vim-textobj-markdown'
  use 'tommcdo/vim-exchange'                -- Swapping two text objects
  use 'itchyny/vim-highlighturl'            -- Highlights URLs everywhere
  use 'AndrewRadev/bufferize.vim'           -- Send command output to temporary buffer
  use { 'xolox/vim-session', requires = 'xolox/vim-misc' }
  use 'rhysd/vim-grammarous'                -- LanguageTool grammar checking
  use 'github/copilot.vim'                  -- GitHub Copilot
  use 'tvaintrob/bicep.vim'                 -- Syntax highlight for Bicep files
  use 'luukvbaal/stabilize.nvim'            -- Stabilize windows when opening/closing windows
  use 'sindrets/diffview.nvim'              -- Git diff for each file and file history
  use 'ggandor/lightspeed.nvim'             -- Moving cursor anywhere in any window
  use 'sindrets/winshift.nvim'              -- Improved window movement
  use 'rcarriga/nvim-notify'                -- Floating notifications popups
  use 'NarutoXY/dim.lua'                    -- It's kinda buggy
  use 'akinsho/toggleterm.nvim'             -- For toggling built-in terminal
  use 'kevinhwang91/nvim-bqf'               -- Better quickfix
  use 'TimUntersberger/neogit'              -- Git wrapper
end)

if fn.filereadable('~/.config/nvim/config.vim') then
  cmd 'source ~/.config/nvim/config.vim'
end

local function t(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

local function map(modes, lhs, rhs, opts)
  if type(opts) == 'string' then
    opts = { desc = opts }
  end
  vim.keymap.set(modes, lhs, rhs, opts)
end

local function feedkeys(keys, mode)
  if mode == nil then mode = 'i' end
  return api.nvim_feedkeys(t(keys), mode, true)
end

local function error(message)
  api.nvim_echo({{ message, 'Error' }}, false, {})
end

local function autocmd(event, opts)
  if opts.group then
    api.nvim_create_augroup(opts.group, {})
  else
    opts.group = 'DefaultAugroup'
    api.nvim_create_augroup('DefaultAugroup', {})
  end

  vim.api.nvim_create_autocmd(event, opts)
end

------------
-- Packer --
------------
autocmd('BufWritePost', {
  pattern = 'config.lua',
  command = 'source <afile> | PackerCompile',
  group   = 'Packer'
})

-------------------
-- LSP Installer --
-------------------
local function make_opts(snippets)
  if snippets == nil then snippets = true end
  local capabilities = lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = snippets
  return { capabilities = capabilities } -- enable snippet support
end

-- Typescript LSP config
local typescript_settings = {
  init_options = require('nvim-lsp-ts-utils').init_options,
  on_attach = function(client)
    local ts_utils = require('nvim-lsp-ts-utils')
    ts_utils.setup({
      update_imports_on_move = true,
      require_confirmation_on_move = true,
      inlay_hints_highlight = 'NvimLspTSUtilsInlineHint'
    })
    ts_utils.setup_client(client)

    local opts = { buffer = true }
    map('n', '<leader>lo', '<cmd>TSLspOrganize<CR>', opts)
    map('n', '<leader>lr', '<cmd>TSLspRenameFile<CR>', opts)
    map('n', '<leader>li', '<cmd>TSLspImportAll<CR>', opts)
    map('n', '<leader>lI', '<cmd>TSLspImportCurrent<CR>', opts)
    map('n', '<leader>lh', '<cmd>TSLspToggleInlayHints<CR>', opts)
  end,
}

-- Lua LSP config
local lua_settings = require('lua-dev').setup {
  lspconfig = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {'use'}, -- For when i eventually switch to packer
        }
      }
    }
  }
}

-- YAML LSP config
local yaml_settings = {
  yaml = {
    schemaStore = {
      url = 'https://www.schemastore.org/api/json/catalog.json',
      enable = true
    }
  }
}

-- Zsh/Bash LSP config
local bash_settings = {
  filetypes = {'sh', 'zsh'}
}

-- Json

local json_settings = {
  json = {
    schemas = require('schemastore').json.schemas()
  }
}

require('nvim-lsp-installer').on_server_ready(function(server)
  local opts = make_opts()
  if server.name == 'sumneko_lua' then
    opts = lua_settings
  elseif server.name == 'bashls' then
    opts = bash_settings
  elseif server.name == 'tsserver' then
    opts = typescript_settings
  elseif server.name == 'yaml' then
    opts.settings = yaml_settings
  elseif server.name == 'jsonls' then
    opts.settings = json_settings
  end
  server:setup(opts)
  cmd 'do User LspAttachBuffers'
end)

----------------
-- LSP Config --
----------------
lsp.handlers['textDocument/hover'] = lsp.with(
  lsp.handlers.hover,
  { border = 'single' }
)

lsp.handlers['textDocument/signatureHelp'] = lsp.with(
  lsp.handlers.signature_help,
  { border = 'single' }
)

-------------
-- LSPKind --
-------------
local lspkind = require('lspkind')
lspkind.init {
  symbol_map = {
    Class     = '',
    Interface = '',
    Module    = '',
    Enum      = '',
    Text      = '',
    Struct    = ''
  }
}

require('trouble').setup {
  auto_preview = false,
  use_diagnostic_signs = true,
  auto_close = true,
  action_keys = {
    close = {'q', '<C-q>', '<C-c>'},
    cancel = '<esc>',
    refresh = 'R',
    jump = {'<Space>'},
    open_split = {'<c-s>'},
    open_vsplit = {'<c-v>'},
    open_tab = {'<c-t>'},
    jump_close = {'<CR>'},
    toggle_mode = 'm',
    toggle_preview = 'P',
    hover = {'gh'},
    preview = 'p',
    close_folds = {'h', 'zM', 'zm'},
    open_folds = {'l', 'zR', 'zr'},
    toggle_fold = {'zA', 'za'},
    previous = 'k',
    next = 'j'
  },
}
map('n', '<leader>E', '<cmd>TroubleToggle<CR>')

-------------
-- Luasnip --
-------------
local luasnip = require('luasnip')
local s = luasnip.snippet
local sn = luasnip.snippet_node
local tn = luasnip.text_node
local i = luasnip.insert_node
local d = luasnip.dynamic_node

luasnip.config.setup { history = true }
luasnip.filetype_extend('all', {'global'})
require('luasnip/loaders/from_vscode').lazy_load {
  paths = {
    '~/.local/share/nvim/site/pack/packer/start/friendly-snippets/',
    '~/.config/nvim/snippets'
  }
}

local function clipboad_oneline()
  local clipboard, _ = fn.getreg('+'):gsub('\n', ' ')
  return clipboard
end

local luasnip_clipboard = function()
  return sn(nil, i(1, clipboad_oneline()))
end

local luasnip_plug = function()
  local repo = clipboad_oneline():gsub('.*github.com/([^/]*/[^/]*).*', '%1', 1)
  return sn(nil,  i(1, repo) )
end

luasnip.add_snippets('markdown', {
  s({
    trig = 'link',
    name = 'hyperlink',
    dscr = 'Hyperlink with the content in the clipboard (by default)'
  }, {
    tn '[', i(1, 'text'), tn ']',
    tn '(',
    d(2, luasnip_clipboard),
    tn ') ',
  })
})
luasnip.add_snippets('vim', {
  s({
    trig = 'plug',
    name = 'vim-plug plugin',
    dscr = 'Vim-plug plugin with the content in the clipboard (by default)'
  }, {
    tn "Plug '", d(1, luasnip_plug), tn "'",
  })
})

local function right_or_snip_next()
  if luasnip.in_snippet() and luasnip.jumpable(1) then
    luasnip.jump(1)
  elseif fn.mode() == 'i' then
    feedkeys('<Right>')
  end
end

local function left_or_snip_prev()
  if luasnip.in_snippet() and luasnip.jumpable(-1) then
    luasnip.jump(-1)
  elseif fn.mode() == 'i' then
    feedkeys('<Left>')
  end
end


local function toggle_active_choice()
  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end

map({'i', 's'}, '<M-l>', right_or_snip_next, '<Right> or next snippet')
map({'i', 's'}, '<M-h>', left_or_snip_prev, '<Left> or previous snippet')
map({'i', 's'}, '<M-space>', toggle_active_choice, 'Toggle active snippet choice')

---------
-- Cmp --
---------
opt.completeopt = 'menuone,noselect'
local cmp = require('cmp')
local cmp_disabled = cmp.config.disable
local cmp_insert = { behavior = cmp.SelectBehavior.Insert }

local function cmp_map(rhs, modes)
  if (modes == nil) then
    modes = {'i', 'c'}
  else if (type(modes) ~= 'table')
    then modes = {modes} end
  end
  return cmp.mapping(rhs, modes)
end

local function toggle_complete()
  return function()
    if cmp.visible() then
      cmp.close()
    else
      cmp.complete()
    end
  end
end

local function complete()
  local copilot_keys = fn['copilot#Accept']('')
  if cmp.visible() then
    cmp.mapping.confirm({select = true})()
  elseif luasnip.expandable() then
    luasnip.expand()
  elseif copilot_keys ~= '' then
    feedkeys(copilot_keys)
  else
    cmp.complete()
  end
end

local function cmdline_complete()
  if cmp.visible() then
    cmp.mapping.confirm({select = true})()
  else
    cmp.complete()
  end
end

local function visible_buffers()
  local bufs = {}
  for _, win in ipairs(api.nvim_list_wins()) do
    bufs[api.nvim_win_get_buf(win)] = true
  end
  return vim.tbl_keys(bufs)
end

local function join(tbl1, tbl2)
  local tbl3 = {}
  for _, item in ipairs(tbl1) do
    table.insert(tbl3, item)
  end
  for _, item in ipairs(tbl2) do
    table.insert(tbl3, item)
  end
  return tbl3
end

cmp.PreselectMode = true

local sources = {
  { name = 'luasnip' },
  { name = 'nvim_lsp' },
  { name = 'nvim_lua' },
  { name = 'nvim_lsp_signature_help' },
  { name = 'path', option = { trailing_slash = true } },
  {
    name = 'buffer',
    option = {
      get_bufnrs = visible_buffers, -- Suggest words from all visible buffers
    },
  }
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-j>'] = cmp_map(cmp.mapping.select_next_item(cmp_insert)),
    ['<C-k>'] = cmp_map(cmp.mapping.select_prev_item(cmp_insert)),
    ['<C-b>'] = cmp_map(cmp.mapping.scroll_docs(-4)),
    ['<C-f>'] = cmp_map(cmp.mapping.scroll_docs(4)),
    ['<C-Space>'] = cmp_map(toggle_complete(), {'i', 'c', 's'}),
    ['<Tab>'] = cmp.mapping({
      i = complete,
      c = cmdline_complete,
    }),
    ['<C-y>'] = cmp_disabled,
    ['<C-n>'] = cmp_disabled,
    ['<C-p>'] = cmp_disabled,
  },
  sources = cmp.config.sources(sources),
  formatting = {
    format = lspkind.cmp_format()
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  }
})

autocmd('FileType', {
  pattern = { 'markdown', 'text', 'tex', 'gitcommit' },
  callback = function()
    cmp.setup.buffer({
      sources = cmp.config.sources(join({{ name = 'cmp_tabnine' }}, sources))
    })
  end,
  group = 'TabNine'
})

-- Use buffer source for `/` (searching)
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for `:`
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' }
  })
})

-------------
-- Tabnine --
-------------
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_num_results = 5;
  ignored_file_types = {};
})

-------------
-- Copilot --
-------------
map('i', '<C-l>', 'copilot#Accept("")', { expr = true })
map('i', '<C-f>', 'copilot#Accept("")', { expr = true })
map('i', '<M-.>', '<Plug>(copilot-next)')
map('i', '<M-,>', '<Plug>(copilot-previous)')
g.copilot_assume_mapped = true
g.copilot_filetypes = { TelescopePrompt = false, DressingInput = false }

autocmd('InsertEnter', {
  callback = function()
    -- Copilot takes a while to load, so statusline waits for this variable
    -- TODO: try to lazy load instead when vim-plug has been replaced with
    -- packer.nvim
    g.insert_entered = true
  end,
  group = 'Copilot',
})

-----------------
-- ColorScheme --
-----------------
local colors = require('onedark.colors').setup()
local style = require('onedark.types').od.HighlightStyle
local onedark_utils = require('onedark.util')

local barbar_bg = '#1d2026'
local barbar_bg_visible = '#23262d'
local barbar_fg_gray = '#3b4048'

require('onedark').setup {
  hide_end_of_buffer = false,
  dev = true,
  colors = {
    bg_search = colors.bg_visual,
    hint = colors.dev_icons.gray,
    bg_float = colors.bg_highlight,
    git = {
      add = colors.green0,
      change = colors.orange1,
      delete = colors.red1
    }
  },
  overrides = function(c)
    return {
      -- General
      Substitute = { link = 'Search' },
      Title = { fg = c.red0, style = style.Bold },
      Folded = { fg = c.fg_dark, bg = c.bg1 },
      FloatBorder = { fg = c.blue0, bg = c.bg_float  },
      Search = { bg = c.bg_search },
      SpecialKey = { fg = c.blue0 },
      SpecialKeyWin = { link = 'Comment' },
      IncSearch = { bg = c.blue0 },
      WinSeparator = { fg = barbar_bg, style = style.Bold  },
      MatchParen = { fg = nil, bg = nil, style = string.format('%s,%s', style.Bold, style.Underline) },
      CursorLineNr = { fg = c.blue0, bg = c.bg_highlight, style = style.Bold },
      MsgArea = { link = 'Normal' },
      SpellBad = { style = style.Undercurl, sp = c.red1 },
      -- Quickfix
      qfLineNr = { fg = c.fg_gutter },
      -- Treesitter
      TSTagDelimiter = { link = 'TSPunctBracket'},
      TSNote = { fg = c.info, style = style.Bold },
      TSWarning = { fg = c.warning, style = style.Bold },
      TSDanger = { fg = c.error, style = style.Bold },
      Todo = { link = 'TSWarning' },
      -- Markdown/html
      mkdLink = { fg = c.blue0, style = style.Underline },
      htmlBold = { fg = c.orange0, style = style.Bold },
      htmlItalic = { fg = c.purple0, style = style.Italic },
      mkdHeading = { link = 'Title' },
      -- QuickScope
      QuickScopePrimary = { fg = c.red0, style = style.Bold },
      QuickScopeSecondary = { fg = c.orange1, style = style.Bold },
      -- NvimTree
      NvimTreeFolderName = { fg = c.blue0 },
      NvimTreeOpenedFolderName = { fg = c.blue0, style = style.Bold },
      NvimTreeOpenedFile = { style = style.Bold },
      NvimTreeGitDirty = { fg = c.orange1 },
      NvimTreeGitNew = { fg = c.green0 },
      NvimTreeGitIgnored = { fg = c.fg_dark },
      -- Telescope
      TelescopeMatching = { fg = c.blue0, style = style.Bold },
      TelescopePromptPrefix = { fg = c.fg0, style = style.Bold },
      -- LSP
      LspReferenceText = { link = 'Search' },
      LspReferenceRead = { link = 'Search' },
      LspReferenceWrite = { link = 'Search' },
      -- Diagnostics
      DiagnosticUnderlineError = { style = style.Underline, sp = c.error },
      DiagnosticUnderlineWarning = { style = style.Underline, sp = c.warning },
      DiagnosticUnderlineHint = { style = style.Underline, sp = c.hint },
      DiagnosticUnderlineInfo = { style = style.Underline, sp = c.info },
      -- nvim-cmp
      CmpItemAbbrDeprecatedDefault = { fg = onedark_utils.darken(c.fg0, 0.8) },
      CmpItemAbbrMatchFuzzy = { fg = c.fg0, style = style.Bold },
      CmpItemKindSnippetDefault = { fg = c.blue0 },
      CmpItemKindTextDefault = { link = 'Normal' },
      -- nvim-lsp-ts-utils
      NvimLspTSUtilsInlineHint = { fg = c.bg_visual }, -- this gets set too late, i.e. after nvim-lsp-ts-utils is loaded. Can be fixed with packer.nvim's `after`
      -- Fidget
      FidgetTitle = { fg = c.blue0, style = style.Bold },
      -- Barbar
      BufferVisible        = { fg = c.fg0,          bg = barbar_bg_visible },
      BufferVisibleSign    = { fg = barbar_fg_gray, bg = barbar_bg_visible },
      BufferTabpageFill    = { fg = barbar_fg_gray, bg = barbar_bg },
      BufferTabpages       = { fg = c.blue0,        bg = barbar_bg, style = style.Bold },
      BufferVisibleMod     = { fg = c.warning,      bg = barbar_bg },
      BufferVisibleIndex   = { fg = barbar_fg_gray, bg = barbar_bg },
      BufferInactive       = { fg = '#707070',      bg = barbar_bg },
      BufferInactiveSign   = { fg = barbar_fg_gray, bg = barbar_bg },
      BufferInactiveMod    = { fg = c.warning,      bg = barbar_bg },
      BufferInactiveTarget = { fg = 'red',          bg = barbar_bg },
      BufferInactiveIndex  = { fg = barbar_fg_gray, bg = barbar_bg },
      BufferModifiedIndex  = { fg = barbar_fg_gray, bg = barbar_bg },
      -- Grammarous
      GrammarousError = { style = style.Undercurl, sp = c.error },
      -- Scrollbar
      Scrollbar = { fg = c.bg_visual }
    }
  end
}

-- Use different highlights for special keys in cmdline vs other windows
vim.opt.winhighlight = 'SpecialKey:SpecialKeyWin'

------------------
-- LSP Mappings --
------------------
local INFO = vim.diagnostic.severity.INFO
local error_opts = {severity = { min = INFO }, float = { border = 'single' }}
local info_opts = {severity = { max = INFO }, float = { border = 'single' }}
local with_border = {float = { border = 'single' }}

local function lsp_server_has_references()
  for _, client in pairs(vim.lsp.buf_get_clients()) do
    if client.resolved_capabilities.find_references then
      return true
    end
  end
  return false
end

local function clear_lsp_references()
  cmd 'nohlsearch'
  if lsp_server_has_references() then
    lsp.buf.clear_references()
    for _, buffer in pairs(visible_buffers()) do
      lsp.util.buf_clear_references(buffer)
    end
  end
end

local function lsp_references()
  clear_lsp_references()
  vim.lsp.buf.document_highlight()
  require('telescope.builtin').lsp_references({ includeDeclaration = false })
end

-- LSP and diagnostics
map('n',        'gd',        require('telescope.builtin').lsp_definitions, 'vim.lsp.buf.definition')
map('n',        'gi',        require('telescope.builtin').lsp_implementations, 'vim.lsp.buf.implementation')
map('n',        'gD',        require('telescope.builtin').lsp_type_definitions, 'vim.lsp.buf.type_definition')
map('n',        'gh',        lsp.buf.hover, 'vim.lsp.buf.hover')
map('n',        'gs',        lsp.buf.signature_help, 'vim.lsp.buf.signature_help')
map({'i', 's'}, '<M-s>',     lsp.buf.signature_help, 'vim.lsp.buf.signature_help')
map('n',        'gr',        lsp_references, 'vim.lsp.buf.references')
map({'n', 'x'}, '<leader>r', vim.lsp.buf.rename, 'vim.lsp.buf.rename')
map({'n', 'x'}, '<leader>a', lsp.buf.code_action, 'vim.lsp.buf.code_action')
map('n',        '<leader>e', function() return diagnostic.open_float({border = 'single'}) end, 'diagnostic.open_float')
map('n',        ']e',        function() return diagnostic.goto_next(error_opts) end, 'diagnostic.goto_next')
map('n',        '[e',        function() return diagnostic.goto_prev(error_opts) end, 'Previous error')
map('n',        '[h',        function() return diagnostic.goto_prev(info_opts) end, 'Previous info')
map('n',        ']h',        function() return diagnostic.goto_next(info_opts) end, 'Next info')
map('n',        ']d',        function() return diagnostic.goto_next(with_border) end, 'Next diagnostic')
map('n',        '[d',        function() return diagnostic.goto_prev(with_border) end, 'Previous diagnostic')
map('n',        '<C-w>gd',   '<C-w>vgd', {desc = 'LSP go to definition in window split', remap = true})
map('n',        '<C-w>gi',   '<C-w>vgi', {desc = 'LSP go to implementaiton in window split', remap = true})
map('n',        '<C-w>gD',   '<C-w>vgD', {desc = 'LSP go to type definition in window split', remap = true})

-- Sets `bufhidden = delete` if buffer was jumped to
local function quickfix_jump(command)
  if b.buffer_jumped_to then
    bo.bufhidden = 'delete'
  end

  local successful, err_message = pcall(cmd, command)
  if successful then
    b.buffer_jumped_to = true
  else
    error(err_message)
  end
end

local function grep_string()
  vim.ui.input({ prompt = 'Grep string', default = fn.expand("<cword>") },
    function(value)
      if value ~= nil then
        require('telescope.builtin').grep_string({ search = value })
      end
    end)
end

map('n', ']q', function() return quickfix_jump('cnext') end, 'Next quickfix item')
map('n', '[q', function() return quickfix_jump('cprev') end, 'Previous quickfix item')
map('n', ']Q', '<cmd>cbelow<CR>')
map('n', '[Q', '<cmd>cabove<CR>')
map('n', ']l', '<cmd>lbelow<CR>')
map('n', '[l', '<cmd>labove<CR>')

-------------
-- LSPKind --
-------------
require('lspkind').init {
  symbol_map = {
    Class     = '',
    Interface = '',
    Module    = '',
    Enum      = '',
    Text      = '',
    Struct    = ''
  }
}

---------------
-- Telescope --
---------------
local telescope = require('telescope')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values

-- Allows editing multiple files with multi selection
-- Workaround for https://github.com/nvim-telescope/telescope.nvim/issues/1048
local multiopen = function(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if not num_selections or num_selections <= 1 then
    actions.add_selection(prompt_bufnr)
  end
  actions.send_selected_to_qflist(prompt_bufnr)

  local results = vim.fn.getqflist()

  for _, result in ipairs(results) do
    local current_file = vim.fn.bufname()
    local next_file = vim.fn.bufname(result.bufnr)

    if current_file == '' then
      vim.api.nvim_command('edit' .. ' ' .. next_file)
    else
      vim.api.nvim_command(open_cmd .. ' ' .. next_file)
    end
  end

  vim.api.nvim_command('cd .')
end

local function multi_selection_open(prompt_bufnr)
  multiopen(prompt_bufnr, 'edit')
end

local function multi_selection_open_vsplit(prompt_bufnr)
  multiopen(prompt_bufnr, 'vsplit')
end

local function multi_selection_open_split(prompt_bufnr)
  multiopen(prompt_bufnr, 'split')
end

local function multi_selection_open_tab(prompt_bufnr)
  multiopen(prompt_bufnr, 'tabedit')
end

local telescope_multiselect_mappings = {
  i = {
    ['<CR>'] = multi_selection_open,
    ['<C-v>'] = multi_selection_open_vsplit,
    ['<C-s>'] = multi_selection_open_split,
    ['<C-t>'] = multi_selection_open_tab,
  }
}

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<C-p>'] = 'cycle_history_prev',
        ['<C-n>'] = 'cycle_history_next',
        ['<C-b>'] = 'preview_scrolling_up',
        ['<C-f>'] = 'preview_scrolling_down',
        ['<C-q>'] = 'close',
        ['<M-a>'] = 'toggle_all',
        ['<M-q>'] = 'smart_send_to_qflist',
        ['<M-Q>'] = 'smart_add_to_qflist',
        ['<M-l>'] = 'smart_send_to_loclist',
        ['<M-L>'] = 'smart_add_to_loclist',
        ['<M-y>'] = 'open_qflist',
        ['<C-a>'] = function() feedkeys('<Home>') end,
        ['<C-e>'] = function() feedkeys('<End>') end,
        ['<C-u>'] = false
      },
      n = {
        ['<C-q>'] = 'close',
        ['<C-c>'] = 'close',
      }
    },
    layout_config = {
      width = 0.9,
      horizontal = {
        preview_width = 80
      }
    },
    selection_caret = '▶ ',
    multi_icon = '',
    path_display = { 'truncate' },
    prompt_prefix = '   ',
    no_ignore = true,
    file_ignore_patterns = {
      '%.git/', 'node_modules/', '%.npm/', '__pycache__/', '%[Cc]ache/',
      '%.dropbox/', '%.dropbox_trashed/', '%.local/share/Trash/', '%.py[c]',
      '%.sw.?', '~$', '%.tags', '%.gemtags', '%.csv$', '%.tsv$', '%.tmp',
      '%.plist$', '%.pdf$', '%.jpg$', '%.JPG$', '%.jpeg$', '%.png$',
      '%.class$', '%.pdb$', '%.dll$', '%.dat$'
    }
  },
  pickers = {
    find_files = { mappings = telescope_multiselect_mappings },
    grep_string = { mappings = telescope_multiselect_mappings }
  },
  extensions = {
    bookmarks = {
      selected_browser = 'brave',
      url_open_command = 'xdg-open &>/dev/null',
    },
    sessions_picker = {
      sessions_dir = vim.fn.stdpath('data') ..'/sessions/'
    }
  }
}

function _G.telescope_markdowns()
  builtin.find_files({
    search_dirs = { '$MARKDOWNS' },
    prompt_title = 'Markdowns',
    path_display = function(_, path)
      return path:gsub(vim.fn.expand('$MARKDOWNS'), '')
    end,
  })
end

function _G.telescope_config()
  builtin.find_files({
    search_dirs = { '$HOME/.config/nvim/' },
    prompt_title = 'Neovim config',
    no_ignore = true,
    hidden = true,
    path_display = function(_, path)
      -- TODO: refactor this truncation function call
      return path:gsub(vim.fn.expand('$HOME/.config/nvim/'), '')
    end,
  })
end

function _G.telescope_cd(dir)
  if dir == nil then dir = '.' end
  local opts = {cwd = dir}
  local ignore_file = fn.expand('$HOME/') .. '.agignore'

  pickers.new(opts, {
    prompt_title = 'Change Directory',
    finder = finders.new_oneshot_job(
      { 'fd', '-t', 'd', '--hidden', '--ignore-file', ignore_file },
      opts
    ),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, attach_map)
      -- These two mappings fix issue with custom actions
      attach_map('n', '<CR>', 'select_default')
      attach_map('i', '<CR>', 'select_default')
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        if selection ~= nil then
          actions.close(prompt_bufnr)
          -- TODO: allow using tcd on <C-t>
          api.nvim_command('cd ' .. dir .. '/' .. selection[1])
        end
      end)
      return true
    end,
  }):find()
end

map('n', '<C-p>',      function() return builtin.find_files({hidden = true}) end, 'Find files')
map('n', '<leader>f',  grep_string, 'Grep string')
map('n', '<leader>F',  builtin.live_grep, 'Live grep')
map('n', '<leader>B',  builtin.buffers, 'Open buffers')
map('n', '<leader>m',  builtin.oldfiles, 'Recently used files')
map('n', '<leader>th', telescope.extensions.frecency.frecency, 'Frecency')
map('n', '<leader>h',  builtin.help_tags, 'Help tags')
map('n', '<leader>tt', builtin.builtin, 'Builtin telescope commands')
map('n', '<leader>tH', builtin.highlights, 'Highlights')
map('n', '<leader>tm', builtin.keymaps, 'Keymaps')
map('n', '<leader>ts', builtin.lsp_document_symbols, 'LSP document symbols')
map('n', '<leader>tS', builtin.lsp_workspace_symbols, 'LSP workspace symbols')
map('n', '<leader>tw', builtin.lsp_dynamic_workspace_symbols, 'LSP dynamic workspace symbols')
map('n', '<leader>tr', builtin.resume, 'Resume latest telescope session')
map('n', '<leader>tg', builtin.git_files, 'Find git files')

map('n', 'cd',         telescope_cd, 'Change directory')
map('n', 'cD',         function() return telescope_cd('~') end, 'cd from home directory')
map('n', '<M-z>',      telescope.extensions.zoxide.list, 'Change directory with zoxide')
map('n', '<leader>tb', telescope.extensions.bookmarks.bookmarks, 'Bookmarks')
map('n', '<leader>s',  telescope.extensions.sessions_picker.sessions_picker, 'Sessions')
map('n', '<leader>tc', function() return telescope.extensions.cheat.fd({}) end, 'Cheat.sh')
map('n', '<leader>M',  telescope_markdowns, 'Markdowns')
map('n', '<leader>n',  telescope_config, 'Neovim config')
map('n', '<leader>tn', telescope.extensions.notify.notify, 'Notifications')

telescope.load_extension('zoxide')
telescope.load_extension('fzf')
telescope.load_extension('bookmarks')
telescope.load_extension('frecency')
telescope.load_extension('cheat')
telescope.load_extension('refactoring')
telescope.load_extension('notify')
telescope.load_extension('sessions_picker')

--------------
-- Dressing --
--------------
local d_input = require('dressing.input')
require('dressing').setup {
  select = {
    telescope = require('telescope.themes').get_dropdown()
  },
  input = {
    insert_only = false,
    relative = 'editor',
    default_prompt = ' ', -- Doesn't seem to work
  }
}

autocmd('Filetype', {
  pattern = 'DressingInput',
  callback = function()
    feedkeys('<Esc>V<C-g>', 'i') -- Enter input window in select mode
    map({'i', 's'}, '<C-j>', d_input.history_next, { buffer = true })
    map({'i', 's'}, '<C-k>', d_input.history_prev, { buffer = true })
    map({'s', 'n'}, '<C-c>', d_input.close,        { buffer = true })
    map('s',        '<CR>',  d_input.confirm,      { buffer = true })
  end,
  group = 'Dressing'
})

---------------
-- Nvim-tree --
---------------
g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 2
g.nvim_tree_special_files = {}
g.nvim_tree_git_hl = 1
g.nvim_tree_icons = {
  default = '' ,
  git = {
    ignored   = '',
    untracked = '',
    unstaged  = '',
    staged    = '',
    unmerged  = '',
    renamed   = '',
    deleted   = '',
  }
}

local tree_cb = require('nvim-tree.config').nvim_tree_callback
local nvim_tree = require('nvim-tree')

nvim_tree.setup {
  diagnostics = {
    enable = true,
    show_on_dirs = true
  },
  disable_netrw = false,
  update_cwd = true,
  git = {
    ignore = false,
  },
  show_icons = {
    git = true,
    folders = true,
    files = true,
  },
  view = {
    width = 40,
    mappings = {
      list = {
      { key = 'l',       cb = tree_cb('edit') },
      { key = 'h',       cb = tree_cb('close_node') },
      { key = '>',       cb = tree_cb('cd') },
      { key = '<',       cb = tree_cb('dir_up') },
      { key = 'd',       cb = tree_cb('trash') },
      { key = 'D',       cb = tree_cb('remove') },
      { key = '<C-r>',   cb = tree_cb('refresh') },
      { key = 'R',       cb = tree_cb('full_rename') },
      { key = '<Space>', cb = tree_cb('preview') },
      { key = '<C-s>',   cb = tree_cb('split') },
      { key = 'gh',      cb = tree_cb('show_file_info') },
      }
    }
  }
}

autocmd('BufEnter', {
  pattern = 'NvimTree_1',
  command = 'NvimTreeRefresh',
  group   = 'NvimTreeRefresh'
})

map('n', '<leader>`', nvim_tree.toggle, 'Toggle file tree')
map('n', '<leader>~', function() return nvim_tree.find_file(true) end, 'Show current file in file tree')
cmd 'hi! link NvimTreeIndentMarker IndentBlanklineChar'

---------------
-- Autopairs --
---------------
-- Auto insert `()` after completing a function or method
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
  map_char = { tex = '' },
}))

local rule = require('nvim-autopairs.rule')
local autopairs = require('nvim-autopairs')

autopairs.setup {
  map_c_h = true
}
autopairs.add_rules {
  rule('$', '$', 'tex'),
  rule('*', '*', 'markdown'),
}

---------------
-- Formatter --
---------------
local prettier_config = {
  function()
    return {
      exe = 'prettier',
      args = { '--stdin-filepath', api.nvim_buf_get_name(0) },
      stdin = true
    }
  end
}

require('formatter').setup {
  logging = false,
  filetype = {
    javascript = prettier_config,
    typescript = prettier_config,
    typescriptreact = prettier_config,
    yaml = prettier_config,
    json = prettier_config,
    markdown = {
      function()
        return {
          exe = 'prettier',
          args = {'--stdin-filepath', api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    },
    python = {
      function()
        return {
          exe = 'autopep8',
          args = {'-i'},
          stdin = false
        }
      end
    }
  }
}

map('n', '<F2>', function()
  b.format_on_write = (not b.format_on_write and b.format_on_write ~= nil)
  print('Format on write ' .. (b.format_on_write and 'enabled' or 'disabled'))
end, 'Toggle autoformatting on write')

autocmd('BufWritePost', {
  pattern = {'*.js', '*.json', '*.md', '*.py', '*.ts', '*.tsx', '*.yml', '*.yaml'},
  callback = function()
    if b.format_on_write ~= false then
      cmd 'FormatWrite'
    end
  end,
  group = 'FormatOnWrite'
})


-----------------------
-- Nvim-web-devicons --
-----------------------
require('nvim-web-devicons').set_icon {
  md = {
    icon = '',
    color = '#519aba',
    name = 'Markdown'
  },
  tex = {
    icon = '',
    color = '#3D6117',
    name = 'Tex'
  }
}

----------------
-- Treesitter --
----------------
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    disable = {'latex', 'vim'},
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        ['aF'] = '@function.outer',
        ['iF'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- Whether to set jumps in the jumplist
      goto_next_start = {
        [']f'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_next_end = {
        [']F'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_end = {
        ['[F'] = '@function.outer',
        ['[]'] = '@class.outer',
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ['>,'] = '@parameter.inner',
      },
      swap_previous = {
        ['<,'] = '@parameter.inner',
      },
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

-- Disable treesitter from highlighting errors (LSP does that anyway)
cmd 'highlight! link TSError Normal'

---------------
-- Neoscroll --
---------------
require('neoscroll').setup {
  easing_function = 'cubic',
}

local scroll_speed = 140

require('neoscroll.config').set_mappings {
  ['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', scroll_speed}},
  ['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', scroll_speed}},
  ['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', scroll_speed}},
  ['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', scroll_speed}},
  ['zt']    = {'zt', {scroll_speed}, 'sine'},
  ['zz']    = {'zz', {scroll_speed}, 'sine'},
  ['zb']    = {'zb', {scroll_speed}, 'sine'},
}

----------------
-- Diagnostics --
----------------
lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
  }
)

local function sign_define(name, symbol)
  fn.sign_define(name, {
    text   = symbol,
    texthl = name,
  })
end

sign_define('DiagnosticSignError', '')
sign_define('DiagnosticSignWarn',  '')
sign_define('DiagnosticSignHint',  '')
sign_define('DiagnosticSignInfo',  '')

----------------
-- Statusline --
----------------
require('statusline').setup({
  theme = colors,
  modifications = {
    bg = colors.bg_sidebar,
    fg = '#c8ccd4',
    line_bg = '#353b45',
    darkgray = '#9ba1b0',
    green = colors.green0,
    blue = colors.blue0,
    orange = colors.orange0,
    purple = colors.purple0,
    red = colors.red0,
    cyan = colors.cyan0,
  }
})
opt.laststatus = 3 -- Global statusline

------------
-- Fidget --
------------
require('fidget').setup {
  text = {
    spinner = 'dots',
    done = ''
  }
}

---------
-- DAP --
---------
require('dap-config')

----------------------
-- Indent blankline --
----------------------
require('indent_blankline').setup {
  char = '▏',
  show_first_indent_level = false,
  buftype_exclude = {'fzf', 'help'},
  filetype_exclude = {
    'markdown',
    'startify',
    'sagahover',
    'NvimTree',
    'lsp-installer',
    'toggleterm',
    'packer',
  }
}

--------------
-- Gitsigns --
--------------
local gitsigns = require('gitsigns')
require('gitsigns').setup {
  signs = {
    add          = {text = '│', hl = 'String'},
    change       = {text = '│', hl = 'Boolean'},
    changedelete = {text = '│', hl = 'Boolean'},
    delete       = {text = '▁', hl = 'Error'},
    topdelete    = {text = '▔', hl = 'Error'},
  },
  attach_to_untracked = false,
  on_attach = function()
    map({'n', 'x'}, '<leader>ghs', '<cmd>Gitsigns stage_hunk<CR>')
    map({'n', 'x'}, '<leader>ghr', '<cmd>Gitsigns reset_hunk<CR>')
    map('n',        '<leader>ghS', gitsigns.stage_buffer)
    map('n',        '<leader>ghR', gitsigns.reset_buffer)
    map('n',        '<leader>ghu', gitsigns.undo_stage_hunk)
    map('n',        '<leader>ghp', gitsigns.preview_hunk)
    map('n',        '<leader>gb',  function() return gitsigns.blame_line({
      full = true,
      ignore_whitespace = true,
    }) end)

    -- Next/previous hunk
    map('n', ']c', function()
      if opt.diff then
        feedkeys(']c', 'n')
      else
        gitsigns.next_hunk()
      end
    end)
    map('n', '[c', function()
      if opt.diff then
        feedkeys('[c', 'n')
      else
        gitsigns.prev_hunk()
      end
    end)

    -- Text objects
    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
    map({'o', 'x'}, 'ah', gitsigns.select_hunk)
  end,
}
-- Workaround for bug where change highlight switches for some reason
cmd 'hi! link GitGutterChange DiffChange'
vim.opt.diffopt:append { 'algorithm:patience' } -- Use patience diff algorithm

---------------
-- Lastplace --
---------------
require('nvim-lastplace').setup()

---------------
-- Dial.nvim --
---------------
local augend = require('dial.augend')

local function add_constant(elements)
  return augend.constant.new {
    elements = elements,
    cyclic = true,
    word = true
  }
end

require('dial.config').augends:register_group {
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.integer.alias.binary,
    augend.date.alias['%Y/%m/%d'],
    augend.date.alias['%H:%M'],
    augend.constant.alias.ja_weekday,
    augend.constant.alias.ja_weekday_full,
    augend.constant.alias.bool,
    augend.misc.alias.markdown_header,
    add_constant({'and', 'or'}),
    add_constant({'&&', '||'}),
    add_constant({'TRUE', 'FALSE'}),
    add_constant({'private', 'public'}),
    add_constant({
      'one',   'two',   'three', 'four', 'five',   'six',
      'seven', 'eight', 'nine',  'ten',  'eleven', 'twelve'
    }),
    add_constant({
      'en', 'ett', 'två', 'tre', 'fyra', 'fem', 'sex',
      'sju', 'åtta', 'nio', 'tio', 'elva', 'tolv'
    }),
  }
}

map({'n', 'v'}, '<C-a>',  '<Plug>(dial-increment)')
map({'n', 'v'}, '<C-x>',  '<Plug>(dial-decrement)')
map('v',        'g<C-a>', '<Plug>(dial-increment-additional)')
map('v',        'g<C-x>', '<Plug>(dial-decrement-additional)')

------------------
-- Comment.nvim --
------------------
require('Comment').setup {
  toggler = {
    line = '<leader>cc',
    block = '<leader>cbb'
  },
  opleader = {
    line = '<leader>c',
  },
  extra = {
    above = '<leader>cO',
    below = '<leader>co',
    eol = '<leader>cA'
  },
  ignore = '^$', -- Ignore empty lines
  pre_hook = function(ctx)
    if vim.bo.filetype == 'typescriptreact' then
      local utils = require('Comment.utils')
      local ts_context_utils = require('ts_context_commentstring.utils')
      local type = ctx.ctype == utils.ctype.line and '__default' or '__multiline'
      local location

      if ctx.ctype == utils.ctype.block then
        location = ts_context_utils.get_cursor_location()
      elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
        location = ts_context_utils.get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring({
        key = type,
        location = location
      })
    end
  end
}

local comment_api = require('Comment.api')
local function comment_map(modes, lhs, command, operator_pending)
  map(modes, lhs, function()
    comment_api.call(command)
    if not operator_pending then
      feedkeys('g@$')
    else
      feedkeys('g@')
    end
  end, command)
end

map('n', '<leader>C',  '<Plug>(comment_toggle_linewise)$')
map('n', '<leader>cB', '<Plug>(comment_toggle_blockwise)$')
map('n', '<leader>cb', '<Plug>(comment_toggle_blockwise)')
map('x', '<leader>b',  '<Plug>(comment_toggle_blockwise_visual)')
map('n', 'cm',         '<Plug>(comment_toggle_current_linewise)')
map('n', '<leader>cp', 'yycmp', {remap = true})

comment_map('n', '<leader>c>',   'comment_linewise_op', true)
comment_map('n', '<leader>c>>',  'comment_current_linewise_op')
comment_map('n', '<leader>cb>>', 'comment_current_blockwise_op')
comment_map('x', '<leader>>',    'comment_current_linewise_op')

comment_map('n', '<leader>c<',   'uncomment_linewise_op', true)
comment_map('n', '<leader>cu',   'uncomment_linewise_op', true)
comment_map('n', '<leader>c<<',  'uncomment_current_linewise_op')
comment_map('n', '<leader>cb<<', 'uncomment_current_blockwise_op')
comment_map('x', '<leader><',    'uncomment_current_linewise_op')

---------------
-- Rest.nvim --
---------------
require('rest-nvim').setup()

function _G.http_request()
  if api.nvim_win_get_width(api.nvim_get_current_win()) < 80 then
    cmd('wincmd s')
  else
    cmd('wincmd v')
  end
  cmd('edit ~/.config/nvim/http | set filetype=http | set buftype=')
end

cmd 'command! Http call v:lua.http_request()'

autocmd('FileType', {
  pattern = 'http',
  callback = function()
    map('n', '<CR>', '<Plug>RestNvim:w<CR>', { buffer = true })
    map('n', '<Esc>', '<cmd>BufferClose<CR><cmd>wincmd c<CR>', { buffer = true })
  end,
  group = 'RestNvim'
})

----------------------
-- Refactoring.nvim --
----------------------
local refactoring = require('refactoring')
refactoring.setup({})

map('x', 'gRe', function() return refactoring.refactor('Extract Function') end)
map('x', 'gRf', function() return refactoring.refactor('Extract Function To File') end)
map('x', '<leader>R', function()
  feedkeys('<Esc>', 'n')
  telescope.extensions.refactoring.refactors()
end, 'Select refactor')

--------------------
-- Indent-o-matic --
--------------------
require('indent-o-matic').setup {}

--------------
-- Miniyank --
--------------
map('n',        'p',     '<Plug>(miniyank-autoput)')
map('n',        'P',     '<Plug>(miniyank-autoPut)')
map({'n', 'x'}, '<M-p>', '<Plug>(miniyank-cycle)')
map({'n', 'x'}, '<M-P>', '<Plug>(miniyank-cycleback)')
map('x', 'p', '"_dPP', { remap = true })

--------------------
-- Stabilize.nvim --
--------------------
require('stabilize').setup()

--------------
-- Diffview --
--------------
local dv_callback = require('diffview.config').diffview_callback
require('diffview').setup {
  enhanced_diff_hl = false,
  file_panel = {
    width = 40
  },
  file_history_panel = {
    height = 15,
  },
  key_bindings = {
    view = {
      ['<C-j>'] = dv_callback('select_next_entry'),
      ['<C-k>'] = dv_callback('select_prev_entry'),
      ['<C-s>'] = dv_callback('goto_file_split'),
      ['<C-t>'] = dv_callback('goto_file_tab'),
      ['~']     = dv_callback('focus_files'),
      ['`']     = dv_callback('toggle_files'),
    },
    file_panel = {
      ['<Space>']  = dv_callback('select_entry'),
      ['<CR>']     = dv_callback('focus_entry'),
      ['gf']       = dv_callback('goto_file_edit'),
      ['<C-j>']    = dv_callback('select_next_entry'),
      ['<C-k>']    = dv_callback('select_prev_entry'),
      ['<C-t>']    = dv_callback('goto_file_tab'),
      ['<Esc>']    = dv_callback('toggle_files'),
      ['`']        = dv_callback('toggle_files'),
      ['<space>e'] = dv_callback(),
      ['<space>b'] = dv_callback()
    },
    file_history_panel = {
      ['!']        = dv_callback('options'),
      ['<CR>']     = dv_callback('open_in_diffview'),
      ['<Space>']  = dv_callback('select_entry'),
      ['<C-j>']    = dv_callback('select_next_entry'),
      ['<C-k>']    = dv_callback('select_prev_entry'),
      ['gf']       = dv_callback('goto_file'),
      ['<C-s>']    = dv_callback('goto_file_split'),
      ['<C-t>']    = dv_callback('goto_file_tab'),
      ['~']        = dv_callback('focus_files'),
      ['`']        = dv_callback('toggle_files'),
      ['<space>e'] = dv_callback(),
      ['<space>b'] = dv_callback()
    },
    option_panel = {
      ['<CR>'] = dv_callback('select')
    }
  }
}

map('n', '<leader>gD', '<cmd>DiffviewOpen<CR>')
map('n', '<leader>gH', '<cmd>DiffviewFileHistory<CR>')

----------------
-- Lightspeed --
----------------
g.lightspeed_no_default_keymaps = true
require('lightspeed').setup {
  exit_after_idle_msecs = { labeled = 1000 }
}

map({'n', 'x', 'o'}, 'zj',     '<Plug>Lightspeed_s',       'Lightspeed jump downwards')
map({'n', 'x', 'o'}, 'zk',     '<Plug>Lightspeed_S',       'Lightspeed jump upwards')
map({'n', 'x', 'o'}, '<CR>',   '<Plug>Lightspeed_omni_s',  'Lightspeed jump bidirectionally')
map({'n', 'x', 'o'}, '<S-CR>', '<Plug>Lightspeed_omni_gs', 'Lightspeed jump to window bidirectionally')

map('o', 'zJ', '<Plug>Lightspeed_x',  'Lightspeed jump downwards (inclusive op)')
map('o', 'zK', '<Plug>Lightspeed_X',  'Lightspeed jump upwards (inclusive op)')

-- Move default zj/zk bindings to ]z/[z
map('n', ']z', 'zj', 'Jump to next fold using ]z instead of zj')
map('n', '[z', 'zk', 'Jump to previous fold using [z instead of zk')

--------------
-- Winshift --
--------------
require('winshift').setup {
  window_picker_ignore = {
    filetype = { 'NvimTree' },
    buftype = { 'terminal', 'quickfix' }
  }
}

local function winshift(arg)
  return function()
    require('winshift').cmd_winshift(arg)
  end
end

map('n', '<C-w><C-m>', winshift())
map('n', '<C-w>m',     winshift())
map('n', '<C-w><C-x>', winshift('swap'))
map('n', '<C-w>x',     winshift('swap'))
map('n', '<C-w>M',     winshift('swap'))

map('n', '<C-M-H>', winshift('left'))
map('n', '<C-M-J>', winshift('down'))
map('n', '<C-M-K>', winshift('up'))
map('n', '<C-M-L>', winshift('right'))

-------------
-- Notify --
-------------
local notify = require('notify')
require('notify').setup {
  timeout = 2000,
}
vim.notify = notify

-- LSP window/showMessage
vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local level = ({ 'ERROR', 'WARN', 'INFO', 'DEBUG' })[result.type]

  notify({ result.message }, level, {
    title = 'LSP | ' .. client.name,
    timeout = 10000,
    keep = function() return level == 'ERROR' or level == 'WARN' end,
  })
end

-------------
-- Dim.lua --
-------------
require('dim').setup() -- not working for some reason

----------------
-- Toggleterm --
----------------
require('toggleterm').setup {
  open_mapping = '<C-CR>',
  direction = 'float',
  float_opts = {
    border = 'curved',
    winblend = 4,
    highlights = {
      background = 'NormalFloat',
      border = 'TelescopeBorder',
    },
  },
}

---------
-- Bqf --
---------
require('bqf').setup {
  func_map = {
    prevfile  = '<C-k>',
    nextfile  = '<C-j>',
    fzffilter = '<C-p>',
    split     = '<C-s>',
  }
}

---------
-- Git --
---------
local neogit = require('neogit')
neogit.setup {
  commit_popup = {
    kind = 'vsplit',
  },
  signs = {
    section = { '', '' },
    item = { '', '' },
  },
  integrations = { diffview = true  },
  disable_builtin_notifications = true,
  disable_commit_confirmation = true,
}

map('n', '<leader>gc', '<cmd>Neogit commit<CR>')
map('n', '<leader>gp', '<cmd>Neogit pull<CR>')
map('n', '<leader>gP', '<cmd>Neogit push<CR>')
map('n', '<leader>gr', '<cmd>Neogit rebase<CR>')
map('n', '<leader>gl', '<cmd>Neogit log<CR>')
map('n', '<leader>gB', '<cmd>Git blame<CR>', 'Git blame every line')
map('n', '<leader>gC', require('telescope.builtin').git_branches, 'Telescope git branch')
map('n', '<leader>gs', function() return neogit.open({
  cwd = vim.fn.expand('%:p:h'),
  kind = 'vsplit',
}) end, 'Neogit status')

-- TODO: replace with Neogit or Diffview diff once feature is available
map('n', '<leader>gd', function() call('GitDiff') end, 'Git diff current file')
cmd [[
  function! GitDiff() abort
    let tmp = g:bufferline.insert_at_end
    let g:bufferline.insert_at_end = v:false
    tabnew %
    exe 'Gvdiffsplit'
    exe 'BufferMovePrevious'
    windo set wrap
    let g:bufferline.insert_at_end = tmp
  endf
]]

vim.opt.fillchars = { diff = ' ' }

-------------
-- Modules --
-------------
require('quickfix')

---------------------
-- General config --
---------------------
-- Commands
api.nvim_add_user_command(
  'Search',
  ':let @/="\\\\V" . escape(<q-args>, "\\\\\") | normal! n',
  { nargs = 1, desc = 'Search literally, with no regex' }
)

api.nvim_add_user_command(
  'CDHere',
  'cd %:p:h',
  { desc = "Change working directory to current file's" }
)

api.nvim_add_user_command(
  'YankPath',
  function()
    fn.setreg('+', fn.expand('%:~'))
    vim.notify('Yanked file path: ' .. fn.getreg('+'))
  end,
  { desc = "Yank current file's path" }
)

-- Mappings --
map('n', '<Esc>', function()
  if bo.modifiable then
    clear_lsp_references()
  else
    return feedkeys('<C-w>c', 'n')
  end
end , 'Close window if not modifiable, otherwise :set nohlsearch')
map('t', '<Esc>', '<C-\\><C-n>')

autocmd('CmdwinEnter', {
  callback = function()
    map('n', '<CR>',  '<CR>',   { buffer = true })
    map('n', '<Esc>', '<C-w>c', { buffer = true })
  end,
  group = 'mappings'
})

map('n', '<leader><C-t>', function()
  bo.bufhidden = 'delete' feedkeys('<C-t>', 'n')
end, 'Delete buffer and pop jump stack')

-- Disabled until TSLspOrganize and/or TSLspImportAll doesn't collide with
-- formatter.nvim
-- { 'BufWritePre',
--   {
--     ['*.ts,*.tsx'] = function()
--       if b.format_on_write ~= false then
--         cmd 'TSLspOrganize'
--         cmd 'TSLspImportAll'
--       end
--     end
--   }
-- }

map('n', '<C-w><C-n>', '<cmd>vnew<CR>')
map('n', '<leader>N', function ()
  opt.relativenumber = not opt.relativenumber
  print('Relative numbers ' .. (opt.relativenumber and 'enabled' or 'disabled'))
end, 'Toggle relative numbers')
map('n', '<leader>W', function ()
  vim.o.wrap = not vim.o.wrap
  print('Line wrap ' .. (vim.o.wrap and 'enabled' or 'disabled'))
end, 'Toggle line wrap')
map('s', '<BS>', '<BS>i') -- By default <BS> puts you in normal mode

-- General autocmds --
autocmd('TextYankPost', { -- Highlight text object on yank
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 350 })
  end,
  group = 'HighlightYank'
})

-- TypeScript specific --
autocmd('FileType', {
  pattern = 'typescript',
  callback = function()
    vim.opt.matchpairs:append('<:>')
  end,
  group = 'TypeScript'
})