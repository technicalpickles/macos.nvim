local M = {}

local silent_noremap = { noremap = true, silent = true }
local silent = { silent = true }

local defaults = {
  close_command = 'bdelete',
}

function M.setup(opts)
  opts = opts or {}

  opts = vim.tbl_deep_extend('force', defaults, opts)

  -- ⌘ c - Copy
  -- Visual
  vim.keymap.set('v', '<D-c>', '"+y', silent_noremap)

  -- ⌘ x - Cut
  -- Visual Cut
  vim.keymap.set('v', '<D-x>', '"+c', silent_noremap)

  -- ⌘ v - Paste
  vim.keymap.set('n', '<D-v>', '"+p', silent_noremap)
  -- Command
  vim.keymap.set('c', '<D-v>', '<C-r>+', silent_noremap)
  -- Insert
  vim.keymap.set('i', '<D-v>', '<C-r>+', silent_noremap)
  -- Terminal
  vim.keymap.set('t', '<D-v>', '<C-\\><C-n>"+pi', silent_noremap)

  -- ⌘ s - Save
  vim.keymap.set('n', '<D-s>', ':w<CR>', silent)
  vim.keymap.set('n', '<leader>s', ':w<CR>', silent)
  vim.api.nvim_set_keymap('n', '<C-S>', ':%s/', silent_noremap)

  -- ⌘ a - Select All
  vim.keymap.set('n', '<D-a>', 'ggVG', silent)

  -- ⌘ w - close current window
  vim.keymap.set('n', '<D-w>', '<cmd>' .. opts.close_command .. '<cr>', silent)
  -- Insert
  vim.keymap.set('i', '<D-w>', '<cmd>' .. opts.close_command .. '<cr>', silent)

  -- ⌘ a - New Tab
  vim.keymap.set('', '<D-t>', '<cmd>tabnew<cr>', silent_noremap)
  vim.keymap.set('i', '<D-t>', '<cmd>tabnew<cr>', silent_noremap)

  -- ⌘ / - Toggle comment
  vim.keymap.set('n', '<D-/>', 'gcc', silent)
  vim.keymap.set('v', '<D-/>', 'gc', silent)

  -- ⌘ ]  - Shift identation right
  vim.keymap.set('n', '<D-]>', '>>', silent)
  vim.keymap.set('v', '<D-]>', '>', silent)
  vim.keymap.set('i', '<D-]>', '<C-O>>>', silent)

  -- ⌘ ] - Shift identation left vim.keymap.set("n", "<D-[>", "<<", silent)
  vim.keymap.set('n', '<D-[>', '<<', silent)
  vim.keymap.set('v', '<D-[>', '<', silent)
  vim.keymap.set('i', '<D-[>', '<C-O><<', silent)
end

return M
