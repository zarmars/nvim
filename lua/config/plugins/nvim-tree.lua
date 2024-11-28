-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local function my_on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
        vim.keymap.set('n', '<C-m>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))

        -- custom mappings
        -- vim.keymap.set('n', '<C->', api.tree.change_root_to_parent,        opts('Up'))
        vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
        vim.keymap.set('n', '<C-r>', api.tree.reload,                       opts('Refresh'))
      end
      local nvim_tree = require('nvim-tree')
      nvim_tree.setup({
          disable_netrw = true,
          hijack_netrw = true,
          open_on_tab = false,
          hijack_cursor = false,
          update_cwd = true,
          hijack_directories = {
              enable = true,
              auto_open = true,
          },
          diagnostics = {
              enable = true,
              icons = {
                  hint = "",
                  info = "",
                  warning = "",
                  error = "",
              },
          },
          update_focused_file = {
              enable = true,
              update_cwd = true,
              ignore_list = {},
          },
          git = {
              enable = false,
              ignore = true,
              timeout = 500,
          },
          view = {
              width = 30,
              side = "left",
              number = false,
              relativenumber = false,
          },
          on_attach = my_on_attach,
          renderer = {
              highlight_git = true,
              root_folder_modifier = ":t",
              icons = {
                  show = {
                      file = true,
                      folder = true,
                      folder_arrow = true,
                      git = true,
                  },
                  glyphs = {
                      default = "",
                      symlink = "",
                      git = {
                          unstaged = "",
                          staged = "S",
                          unmerged = "",
                          renamed = "➜",
                          deleted = "",
                          untracked = "U",
                          ignored = "◌",
                      },
                      folder = {
                          default = "",
                          open = "",
                          empty = "",
                          empty_open = "",
                          symlink = "",
                      },
                  }
              }
          }
      })
      print("test nvim-tree")
    end,
  }
}
