ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

-- Job Checker
ESX.RegisterServerCallback("mx_shotspotter:getJob", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local JobName = xPlayer.getJob()

    if JobName ~= nil then
        cb(JobName)
    else
        cb("Error")
    end
end)

-- Blip Sync to Officers
RegisterNetEvent('mx_shotspotter:createBlip')
AddEventHandler('mx_shotspotter:createBlip', function(coords)
    print('testt')
    TriggerClientEvent('mx_shotspotter:createBlip', -1, coords)
end)

-- Notify Server Event
RegisterNetEvent('mx_shotspotter:sendOfficerNotify')
AddEventHandler('mx_shotspotter:sendOfficerNotify', function(title, subject, msg, textureDict, time, variant)
    TriggerClientEvent('mx_shotspotter:sendOfficerNotify', -1, title, subject, msg, textureDict, time, variant)
end)