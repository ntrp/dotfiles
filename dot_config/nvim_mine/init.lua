-- Load impatient as the first thing
local has_impatient, impatient = pcall(require, 'impatient')
if has_impatient then
  impatient.enable_profile()
end

require("globals")
-- load options
require("options")
require("keymaps")
require("default_theme")
-- load plugins
require("plugins")
