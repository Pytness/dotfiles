vim.lsp.set_log_level("trace")
local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/lvim/?.lua;" .. package.path


require "custom.builtin"

require "custom.keymapping"

require "custom.which_key"

require "custom.treesitter"

require "custom.theme"

require "custom.plugins"

require "custom.lsp"

require "custom.rust-ide"

require "custom.cmp"

require "custom.telescope"

require "custom.dashboard"
