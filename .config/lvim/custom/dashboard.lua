local alpha = require("alpha")
local dashboard = lvim.builtin.alpha.dashboard;
local alphadash = require("alpha.themes.dashboard")
-- dashboard.section.terminal = {}
local function get_command(command)
    local handle = io.popen(command)
    local output = handle:read("*a")
    handle:close()

    local result = {}
    for line in output:gmatch '[^\n]+' do
        table.insert(result, line)
    end

    return result
end

-- from lunarvim core/alpha.lua
local function button(sc, txt, keybind, keybind_opts)
    local b = alphadash.button(sc, txt, keybind, keybind_opts)
    return b
end

local terminal = {
    type = "terminal",
    command = "cat | lolcat " .. os.getenv("HOME") .. "/.config/lvim/static/logo.cat",
    height = 16,
    width = 64,
    opts = {
        redraw = true,
        window_config = {},
    },
}

alphadash.section.buttons.val = {
    button("SPC f", "  Find File", "<CMD>Telescope find_files<CR>"),
    button("SPC n", "  New File", "<CMD>ene!<CR>"),
    button("SPC P", "  Recent Projects ", "<CMD>Telescope projects<CR>"),
    button("SPC s r", "  Recently Used Files", "<CMD>Telescope oldfiles<CR>"),
    button("SPC s t", "  Find Word", "<CMD>Telescope live_grep<CR>"),
    button("SPC L c", "  Configuration", "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>"),
}



dashboard.config.layout = {
    -- dashboard.section.header,
    -- dashboard.section.buttons,
    -- { type = "padding", val = 10 },
    terminal,
    { type = "padding", val = 20 },
    alphadash.section.buttons

}
