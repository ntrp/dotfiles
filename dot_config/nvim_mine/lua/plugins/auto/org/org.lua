return {
  {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup {
        org_agenda_files = { "~/org/*" },
        org_default_notes_file = '~/org/inbox.org',
        org_archive_location = '~/org/archive.org',
        org_todo_keywords = {
          { 'TODO(t)', 'STARTED(s)', '|', 'DONE(d)', 'WONTDO(w)' }
        },
        win_split_modee = "float",
        org_capture_templates = {
          T = {
            description = 'TODO',
            template = '* TODO %?\n %u',
            target = '~/org/inbox.org'
          },
          j = {
            description = 'Journal',
            template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
            target = '~/org/journal.org'
          },
          e = 'Event',
          er = {
            description = 'recurring',
            template = '** %?\n %T',
            target = '~/org/calendar.org',
            headline = 'recurring'
          },
          eo = {
            description = 'one-time',
            template = '** %?\n %T',
            target = '~/org/calendar.org',
            headline = 'one-time'
          }
        }
      }
      require('orgmode').setup_ts_grammar()

      require 'utils'.wkRegister({
        o = {
          name = 'Org',
          i = {
            name = 'insert',
            t = 'todo heading respect content',
            h = 'heading respect content',
            ["!"] = 'timestamp true',
            T = 'todo heading',
            ["."] = 'timestamp',
            s = 'schedule',
            d = 'deadline',
          },
          x = {
            name = 'clock',
            i = 'clock in',
            o = 'clock out',
            j = 'clock goto',
            e = 'set effort',
            q = 'cancel',
          },
          r = 'refile header',
          A = 'toggle archive tag',
          J = 'move subtree down',
          K = 'move subtree up',
          ["*"] = 'toggle heading',
          o = 'open at point',
          ["'"] = 'edit special',
          [","] = 'set priority',
          t = 'set tags',
          ["$"] = 'archive',
          e = 'export',
          c = 'capture',
          a = 'agenda',
        }
      })
    end
  },
  {
    "akinsho/org-bullets.nvim", config = function()
      require("org-bullets").setup {
        concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
        symbols = {
          headlines = { "◉", "○", "✸", "✿" },
          checkboxes = {
            cancelled = { "", "OrgCancelled" },
            done = { "✓", "OrgDone" },
            todo = { "˟", "OrgTODO" },
          },
        }
      }
    end
  }
}
