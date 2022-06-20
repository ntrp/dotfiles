return {
  'aloussase/telescope-maven-search',
  config = function()
    local telescope = require 'telescope'
    telescope.load_extension 'maven_search'

    require('utils').wkRegister({
      f = {
        M = { function()
          vim.ui.input({ prompt = 'Search Maven Central: ' }, function(input)
            telescope.extensions.maven_search.maven_search({
              query = input,
              format = 'maven'
            })
          end)
        end, "Maven" },
      }
    })
  end
}
