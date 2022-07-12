ESX = exports['es_extended']:getSharedObject()

-- Shot Detection
Citizen.CreateThread(function()
    while true do
        Wait(0)

        local sleep = true

        local playerPed = PlayerPedId()
        local pedShot = IsPedShooting(playerPed)
        local pedArmed = IsPedArmed(playerPed, 4)
        local weapon = GetSelectedPedWeapon(playerPed)
        local currentWeapon = GetSelectedPedWeapon(playerPed)
        local silencer = IsPedCurrentWeaponSilenced(playerPed)
        local coords = GetEntityCoords(playerPed)

        if pedArmed ~= false then
            sleep = false
            if pedShot and not WeaponBlacklisted(weapon)  then
                local pos = GetEntityCoords(playerPed)

                local streetHash1, streetHash2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
                local streetName1, streetName2 = GetStreetNameFromHashKey(streetHash1), GetStreetNameFromHashKey(streetHash2)

                if Config.EnableSilencerDetection and silencer then
                    if Config.Debug then
                        if streetHash2 == 0 then
                            print('weapon with silencer shot at: ' ..pos .. ' near ' ..streetName1)
                        elseif streetHash2 ~= 0 then
                            print('weapon with silencer shot at: ' ..pos .. ' near ' ..streetName1.. ' and ' ..streetName2)
                        end
                    end

                    if Config.EnableBlips then
                        TriggerServerEvent('mx_shotspotter:createBlip', coords)
                    end

                    if streetHash2 == 0 then
                        TriggerServerEvent('mx_shotspotter:sendOfficerNotify', 'ALERT', '213', 'Somebody shot a Gun with Silencer at ' ..streetName1, 'CHAR_CALL911', 7500, 'warning')
                    elseif streetHash2 ~= 0 then
                        TriggerServerEvent('mx_shotspotter:sendOfficerNotify', 'ALERT', '213', 'Somebody shot a Gun with Silencer at ' ..streetName1 .. ' and ' ..streetName2, 'CHAR_CALL911', 7500, 'warning')
                    end

                    if Config.UsePhoneDispatch then
                        TriggerEvent('mx_shotspotter:phoneDispatch', coords, currentWeapon)
                    end
                elseif not silencer then
                    if Config.Debug then
                        if streetHash2 == 0 then
                            print('weapon shot at: ' ..pos .. ' near ' ..streetName1)
                        elseif streetHash2 ~= 0 then
                            print('weapon shot at: ' ..pos .. ' near ' ..streetName1.. ' and ' ..streetName2)
                        end
                    end

                    if Config.EnableBlips then
                        TriggerServerEvent('mx_shotspotter:createBlip', coords)
                    end

                    if streetHash2 == 0 then
                        TriggerServerEvent('mx_shotspotter:sendOfficerNotify', 'ALERT', '213', 'Somebody shot a Gun with Silencer at ' ..streetName1, 'CHAR_CALL911', 7500, 'warning')
                    elseif streetHash2 ~= 0 then
                        TriggerServerEvent('mx_shotspotter:sendOfficerNotify', 'ALERT', '213', 'Somebody shot a Gun with Silencer at ' ..streetName1 .. ' and ' ..streetName2, 'CHAR_CALL911', 7500, 'warning')
                    end

                    if Config.UsePhoneDispatch then
                        TriggerEvent('mx_shotspotter:phoneDispatch', coords, currentWeapon)
                    end
                end
                Wait(Config.Cooldown * 1000)
            end
        end

        if sleep then
            Wait(500)
        end
    end
end)

-- Blip creator for cops
RegisterNetEvent('mx_shotspotter:createBlip')
AddEventHandler('mx_shotspotter:createBlip', function(coords)
    ESX.TriggerServerCallback('mx_shotspotter:getJob', function(job)
        for k, v in pairs(Config.WhitelistedJob) do
            currentJob = job.name

            if currentJob == v then
                RemoveBlip(blip)

                blip = AddBlipForCoord(coords)

                SetBlipSprite(blip, 161)
                SetBlipScale(blip, 1.0)
                SetBlipColour(blip, 1)
                SetBlipAsShortRange(blip, true)
            
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName('Weapon got Shot')
                EndTextCommandSetBlipName(blip)

                Citizen.Wait(Config.BlipRemoveTime * 1000)

                RemoveBlip(blip)
            end
        end
    end)
end)

-- Function for Blacklisted Weapons
function WeaponBlacklisted(weapon)
    for k, v in pairs(Config.BlacklistedWeapons) do
        if weapon == v then
            return true
        end
    end
    return false
end
