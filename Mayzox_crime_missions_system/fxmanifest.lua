fx_version 'adamant'
games {'gta5'}

lua54 'yes'

name         'Mayzox Boss System'
version      '1.0.0'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    'shared/*.lua',
}

dependencies {
	'es_extended',
}