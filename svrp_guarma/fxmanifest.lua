fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
name "svrp_guarma"
author "cedric1982"
description "Reisen von Saint Denis nach Guarma mit NPC"

server_scripts {
    'server.lua',
    'config.lua'
}

shared_script 'config.lua'

client_scripts {
	'client.lua',
    'config.lua'
}

version '0.1.0'

