return {
	"mg979/vim-visual-multi",
  init = function()
    vim.cmd([[
      let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
    ]])
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ['Find Under'] = ''
    }
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,
  config = function()
    vim.keymap.set('n', '<C-k>', '<Plug>(VM-Find-Under)')
    vim.keymap.set('n', '<C-a>', '<Plug>(VM-Select-All)')
    vim.keymap.set('n', '<C-x>', '<Plug>(VM-Start-Regex-Search)')
    vim.keymap.set('n', '<leader>m', '<Plug>(VM-Toggle-Mappings)')
    vim.keymap.set('x', '<C-a>', '<Plug>(VM-Visual-All)')
    vim.keymap.set('x', '<C-k>', '<Plug>(VM-Visual-Find)')
    vim.keymap.set('x', '<C-x>', '<Plug>(VM-Visual-Regex)')
  end,
}
