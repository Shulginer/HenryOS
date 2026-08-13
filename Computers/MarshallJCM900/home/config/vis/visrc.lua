-- load standard vis module, providing parts of the Lua API
require('vis')
require('plugins/vis-title')
require('plugins/vis-shebang')
require('plugins/vis-dvorak')
--require('plugins/vis-smart-numbers')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win) -- luacheck: no unused args
	-- Your per window configuration options
	vis:command('set relativenumber')
	vis:command('set theme base16-tomorrow-night')
	--vis:command('set number')
	vis:command('set cursorline')
end)

shebangs = {
	["#!/bin/sh"] = "bash",
   	["#!/bin/zsh"] = "bash"
}
