local home_dir = os.getenv 'HOME'
local nvim_dir = home_dir .. '/.config/nvim/'

package.path = nvim_dir .. '?.lua;' .. package.path
package.path = nvim_dir .. '?/?.lua;' .. package.path
package.path = nvim_dir .. '?/init.lua;' .. package.path

require 'theme'
require 'libs'
require 'options'
require 'autocmd'
require 'lazy-loader'

require 'keymaps'
