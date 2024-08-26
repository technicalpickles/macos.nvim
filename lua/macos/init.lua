local M = {}

local silent_noremap = { noremap = true, silent = true }
local silent = { silent = true }

local defaults = {
  close_command = 'bdelete',
}

function M.setup(opts)
  opts = opts or {}

  opts = vim.tbl_deep_extend('force', defaults, opts)

  -- Copy
  vim.keymap.set('v', '<D-c>', '"+y', silent_noremap)

  -- Cut
  vim.keymap.set('v', '<D-x>', '"+c', silent_noremap)

  -- Paste
  vim.keymap.set('', '<D-v>', '"+p', silent_noremap)
  vim.keymap.set('c', '<D-v>', '<C-r>+', silent_noremap)
  vim.keymap.set('i', '<D-v>', '<C-r>+', silent_noremap)
  vim.keymap.set('t', '<D-v>', '<C-\\><C-n>"+pi', silent_noremap)

  -- ⌘ s - save
  vim.keymap.set('n', '<D-s>', ':w<CR>', silent)
  vim.keymap.set('n', '<leader>s', ':w<CR>', silent)
  vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', silent_noremap)

  -- ⌘ a - select all
  vim.keymap.set('n', '<D-a>', 'ggVG', silent)

  -- ⌘ / - close current window
  vim.keymap.set('', '<D-w>', '<cmd>' .. opts.close_command .. '<cr>', silent)
  vim.keymap.set('i', '<D-w>', '<cmd>' .. opts.close_command .. '<cr>', silent)

  -- Create new tab with Command-T
  vim.keymap.set('', '<D-t>', '<cmd>tabnew<cr>', silent_noremap)
  vim.keymap.set('i', '<D-t>', '<cmd>tabnew<cr>', silent_noremap)

  -- IDE-like behvaior --
  -- ⌘ / - toggle comment
  vim.keymap.set('n', '<D-/>', 'gcc', silent)
  vim.keymap.set('v', '<D-/>', 'gc', silent)

  -- ⌘ ]  - shift identation right
  vim.keymap.set('n', '<D-]>', '>>', silent)
  vim.keymap.set('v', '<D-]>', '>', silent)
  vim.keymap.set('i', '<D-]>', '<C-O>>>', silent)

  -- ⌘ ] - shift identation left vim.keymap.set("n", "<D-[>", "<<", silent)
  vim.keymap.set('n', '<D-[>', '<<', silent)
  vim.keymap.set('v', '<D-[>', '<', silent)
  vim.keymap.set('i', '<D-[>', '<C-O><<', silent)
end

return M
