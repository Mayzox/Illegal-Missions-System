ESX = exports["es_extended"]:getSharedObject()

local json = require("json")
local timers = {}
local stockPlayer = {}
local isStart = false

ESX.RegisterServerCallback('mayzox:gettime:boss', function(source, cb)
    local cooldown = timers[GetPlayerIdentifier(source, 0)]
    cb(cooldown) 
end)

RegisterNetEvent('mayzox:reward:boss')
AddEventHandler('mayzox:reward:boss', function(item, amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addInventoryItem(item, amount)
    isStart = false
    stockPlayer[source] = nil
end)

RegisterServerEvent('mayzox:start:cooldown:boss')
AddEventHandler('mayzox:start:cooldown:boss', function(playerPed)
    local playerId = source 
    stockPlayer[playerId] = playerPed

    if not isStart then
        isStart = true
        startCooldown()
    else
        TriggerClientEvent('okokNotify:Alert', playerId, '', 'Je suis désolé, mais quelqu\'un d\'autre s\'en occupe déjà.', 60000, 'error')
    end
end)

RegisterNetEvent('esx:playerDropped')
AddEventHandler('esx:playerDropped', function(source, reason)
    local playerId = source
    local playerPed = stockPlayer[playerId]

    if playerPed then
        isStart = false
        stockPlayer[playerId] = nil
    end
end)

function saveCooldown(identifier, cooldown)
    timers[identifier] = cooldown
    SaveResourceFile(GetCurrentResourceName(), "cooldowns.json", json.encode(timers), 0)
end

function startCooldown()
    for _, v in pairs(Mayzox.Config.Start) do
        local src = source
        local cooldown = timers[GetPlayerIdentifier(src, 0)]

        saveCooldown(GetPlayerIdentifier(src, 0), 60*v.cooldown)
        timers[GetPlayerIdentifier(src, 0)] = 60*v.cooldown
        TriggerClientEvent('Mayzox:start:mission:boss', src, true)
    end
end

Citizen.CreateThread(function()
    local cooldowns = LoadResourceFile(GetCurrentResourceName(), "cooldowns.json")
    if cooldowns then
        timers = json.decode(cooldowns)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k,v in pairs(timers) do
            if v > 0 then
                timers[k] = v - 1
                saveCooldown(k, v - 1)
            end
        end
    end
end)
