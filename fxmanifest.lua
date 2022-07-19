fx_version 'bodacious'
game 'gta5'

author 'Max'
description 'a shotspotting script for ESX'
version '1.0'

lua54 'on'

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}