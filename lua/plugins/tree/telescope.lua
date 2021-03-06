local ts = {}
-- Telescope stuff I need to import for configuration
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
local previewers = require 'telescope.previewers'
local pickers = require 'telescope.pickers'
local sorters = require 'telescope.sorters'
local finders = require 'telescope.finders'
local themes = require 'telescope.themes'
local conf = require('telescope.config').values

-- files to ignore with `file_ignore_patterns`
local ignore_these = {
  'node_modules/.*',
  '.git/.*',
  '.yarn/.*',
  '.neuron/*',
  'fonts/*',
  'icons/*',
  'images/*',
  'dist/*',
  'build/*',
  'yarn.lock',
  'package%-lock.json',
  '%.svg',
  '%.png',
  '%.jpeg',
  '%.jpg',
  '%.ico',
}

local webdev_dash_keywords = {
  'css',
  'cssmedia',
  'html',
  'htmle',
  'htmlhead',
  'httpheaders',
  'httpstatus',
  'js',
  'nextjs',
  'nodejs',
  'react',
  'scss',
  'ts',
}


-- TELESCOPE CONFIG
require('telescope').setup {
  pickers = default_picker_opts,
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    mappings = {
      n = {
        ['<c-x>'] = false,
        ['<c-s>'] = actions.select_horizontal,
        ['<c-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<c-c>'] = actions.close,
      },
      i = {
        ['<c-x>'] = false,
        ['<c-s>'] = actions.select_horizontal,
        ['<c-q>'] = actions.send_to_qflist + actions.open_qflist,
        ['<c-c>'] = actions.close,
        ['<c-k>'] = actions.delete_buffer,
      },
    },
    color_devicons = true,
    prompt_prefix = '🔍 ',
    scroll_strategy = 'cycle',
    sorting_strategy = 'ascending',
    layout_strategy = 'flex',
    file_ignore_patterns = ignore_these,
    layout_config = {
      prompt_position = 'top',
      horizontal = {
        mirror = true,
        preview_cutoff = 100,
        preview_width = 0.5,
      },
      vertical = {
        mirror = true,
        preview_cutoff = 0.4,
      },
      flex = {
        flip_columns = 110,
      },
      height = 0.94,
      width = 0.86,
    },
  },
  extensions = {

    dash = {
      -- debounce while typing, in milliseconds
      debounce = 0,
      file_type_keywords = {
        TelescopePrompt = false,
        terminal = false,
        packer = false,
        -- a table of strings will search on multiple keywords
        html = { 'html', 'htmle', 'htmlhead' },
        css = { 'css', 'cssmedia' },
        scss = { 'css', 'scss' },
        javascript = webdev_dash_keywords,
        typescript = webdev_dash_keywords,
        typescriptreact = webdev_dash_keywords,
        javascriptreact = webdev_dash_keywords,
        svelte = webdev_dash_keywords,
        vue = webdev_dash_keywords,
        bash = 'bash',
        fish = 'fish',
        lua = { 'lua', 'neovim', 'lspconfig', 'nvimts', 'hammer' },
        go = 'go',
        vim = 'vim',
        man = 'man',
      },
    },
    tldr = {
      tldr_command = 'tldr',
    },
  },
}
-- require fzf extension for fzf sorting algorithm
require('telescope').load_extension 'fzf'
-- require zk extension for zk-cli require('telescope').load_extension 'zk'

-- function for generating keymap for each picker
local builtin = function(mapping, picker, is_custom)
  local module = is_custom and 'plugins.telescope' or 'telescope.builtin'
  local rhs = string.format([[<cmd>lua require'%s'.%s()<cr>]], module, picker)

end

local custom = function(mapping, picker_name, builtin_name, opts)
  opts = opts or {}
  ts[picker_name] = function()
    require('telescope.builtin')[builtin_name](opts)
  end
  local rhs = string.format([[<cmd>lua require'plugins.telescope'.%s()<cr>]], picker_name)

end
-- find_files, but don't use ignored patterns
custom('<leader>fa', 'find_files_all', 'find_files', {
  file_ignore_patterns = {},
  no_ignore = true,
  hidden = true,
})

-- find in dotfiles
custom('<leader>fd', 'find_dotfiles', 'find_files', {
  cwd = '~/dotfiles',
  prompt_title = 'files in dotfiles',
})

-- find in neovim config
custom('<leader>fn', 'find_neovim', 'find_files', {
  cwd = '~/dotfiles/nvim',
  prompt_title = 'files in neovim config',
})

-- grep inside of dotfiles
custom('<leader>gid', 'grep_in_dotfiles', 'live_grep', {
  cwd = '~/dotfiles',
  prompt_title = 'grep in dotfiles',
})

-- grep inside of neovim config
custom('<leader>gin', 'grep_in_neovim', 'live_grep', {
  cwd = '~/.config/nvim',
  prompt_title = 'grep in neovim config',
})

-- grep inside of vim help docs
custom('<leader>vh', 'grep_vim_help', 'live_grep', {
  cwd = os.getenv 'VIMRUNTIME' .. '/doc',
  prompt_title = 'Grep in vim help docs',
})

-- jump to a buffer
custom(
  '<leader>jb',
  'jump_to_buffer',
  'buffers',
  vim.tbl_deep_extend('force', themes.get_dropdown(), {
    preview = false,
    prompt_title = 'Jump to buffer',
  })
)

-- vim-grepper-like picker with grep_string
ts.ripgrepper = function()
  require('telescope.builtin').grep_string {
    prompt_title = 'ripgrepper',
    search = vim.fn.input 'ripgrepper > ',
    search_dirs = { '$PWD' },
    use_regex = true,
  }
end
builtin('<leader>rg', 'ripgrepper', true)

-- custom telescope picker to execute a packer.nvim command
-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md#guide-to-your-first-picker
ts.packer_commands = function(opts)
  local packer_commands = {
    'Clean',
    'Compile',
    'Install',
    'Load',
    'Profile',
    'Status',
    'Sync',
    'Update',
  }
  local dropdown = themes.get_dropdown()
  opts = opts and vim.tbl_deep_extend('keep', opts, dropdown) or dropdown

  pickers.new(opts, {
    prompt_title = 'Run a packer.nvim command',
    finder = finders.new_table(packer_commands),
    sorter = sorters.get_generic_fuzzy_sorter(),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local cmd = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if cmd then
          vim.cmd('Packer' .. cmd[1])
        end
      end)
      return true
    end,
    previewer = nil,
  }):find()
end

local create_entry_maker = function()
  local lookup_keys = {
    ordinal = 2,
    value = 1,
    display = 2,
    filename = 3,
  }

  local mt_string_entry = {
    __index = function(t, k)
      return rawget(t, rawget(lookup_keys, k))
    end,
  }

  return function(line)
    local tmp_table = vim.split(line, '\t')
    return setmetatable({
      line,
      tmp_table[2],
      tmp_table[1],
    }, mt_string_entry)
  end
end

-- wrapper for find_files/fd, so that when in my wiki directory,
-- we hook into zk-cli to search notes by title, not the name of the file
-- cc: https://github.com/megalithic/zk.nvim/blob/main/lua/telescope/_extensions/zk.lua
ts.find_files = function(opts)
  opts = opts or {}
  opts.entry_maker = create_entry_maker()

  if vim.loop.cwd() == (os.getenv 'HOME' .. '/wiki') then
    pickers.new({}, {
      prompt_title = 'Find notes',
      finder = finders.new_oneshot_job({
        'zk',
        'list',
        '-q',
        '-P',
        '--format',
        '{{ abs-path }}\t{{ title }}',
      }, opts),
      sorter = conf.generic_sorter {},
      previewer = conf.file_previewer(opts),
    }):find()
  else
    require('telescope.builtin').find_files()
  end
end

return ts


