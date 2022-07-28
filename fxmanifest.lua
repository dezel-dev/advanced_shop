lua54 "yes"
fx_version 'cerulean'
game 'gta5'

author 'Dezel#8203'
description "A shop system for your FiveM server."
version "0.1"

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}
server_script "@oxmysql/lib/MySQL.lua"

client_script 'client/*.lua'
server_script 'server/*.lua'
shared_script 'shared/*.lua'