return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      win_split_mode = "vertical",
      org_capture_templates =
        { t = { description = 'Task', template = '* TODO %?\n  %u' },
          s = { 
            description = "schedule", 
            template = "* %?\n  SCHEDULED: %^{date}T\n  %u"},
        },
      mappings = {
        agenda = {
          org_agenda_later = '>',
          org_agenda_earlier = '<',
          org_agenda_goto_today = {'.', 'T'},
          org_agenda_priority_up = nil,
          org_agenda_priority_down = nil,
          org_agenda_todo = {"t", "<leader>ot"},
        },
        capture = {
          org_capture_finalize = '<Leader>w',
        }
      },
    })
    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
