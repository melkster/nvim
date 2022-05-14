-------------
-- Keymaps --
-------------
local bo, o = vim.bo, vim.o
local utils = require('../utils')
local map, autocmd, feedkeys = utils.map, utils.autocmd, utils.feedkeys

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map('n', '<S-Space>', '<Space>')

map('n', '<leader><C-t>', function()
  bo.bufhidden = 'delete' feedkeys('<C-t>', 'n')
end, 'Delete buffer and pop jump stack')

map('n', '<C-w><C-n>', '<cmd>vnew<CR>')
map('n', '<leader>N', function()
  o.relativenumber = not o.relativenumber
  print('Relative numbers ' .. (o.relativenumber and 'enabled' or 'disabled'))
end, 'Toggle relative numbers')
map('n', '<leader>W', function()
  vim.o.wrap = not vim.o.wrap
  print('Line wrap ' .. (vim.o.wrap and 'enabled' or 'disabled'))
end, 'Toggle line wrap')
map('s', '<BS>', '<BS>a') -- By default <BS> puts you in normal mode
map({'n', 'i', 'v', 's', 'o', 't'}, '<C-m>', '<CR>', { remap = true })
map({'i', 'c'}, '<C-i>', '<Tab>', { remap = true })
map('n', 'g<C-a>', 'v<C-a>', 'Increment number under cursor')
map('n', 'g<C-x>', 'v<C-x>', 'Decrement number under cursor')
map('s', '<C-r>', '<C-g>c<C-r>', 'Insert content of a register')

-- Sets `bufhidden = delete` if buffer was jumped to
local function quickfix_jump(command)
  if vim.b.buffer_jumped_to then
    bo.bufhidden = 'delete'
  end

  local successful, _ = pcall(vim.cmd, command)
  if successful then
    vim.b.buffer_jumped_to = true
  end
end

map('n', ']q', function() return quickfix_jump('cnext') end, 'Next quickfix item')
map('n', '[q', function() return quickfix_jump('cprev') end, 'Previous quickfix item')
map('n', ']Q', '<cmd>cbelow<CR>')
map('n', '[Q', '<cmd>cabove<CR>')
map('n', ']l', '<cmd>lbelow<CR>')
map('n', '[l', '<cmd>labove<CR>')

local function close_floating_windows()
  for _, win in pairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end

map('n', '<Esc>', function()
  close_floating_windows()
  if bo.modifiable then
    require('../utils').clear_lsp_references()
  else
    return feedkeys('<C-w>c', 'n')
  end
end, 'Close window if not modifiable, otherwise clear LSP references')
map('t', '<Esc>', '<C-\\><C-n>')

-- Packer
map('n', '<leader>ku', '<cmd>PackerUpdate<CR>')
map('n', '<leader>kc', '<cmd>PackerCompile<CR>')
map('n', '<leader>kC', '<cmd>PackerCompile<CR>')
map('n', '<leader>ks', '<cmd>PackerSync<CR>')
map('n', '<leader>kS', '<cmd>PackerStatus<CR>')
map('n', '<leader>ki', '<cmd>PackerInstall<CR>')
map('n', '<leader>kp', '<cmd>PackerProfile<CR>')

autocmd('CmdwinEnter', {
  callback = function()
    map('n', '<CR>',  '<CR>',   { buffer = true })
    map('n', '<Esc>', '<C-w>c', { buffer = true })
  end,
  group = 'mappings'
})
