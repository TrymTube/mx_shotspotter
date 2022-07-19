ESX = exports['es_extended']:getSharedObject()

-- Notify Client Event
RegisterNetEvent('mx_shotspotter:sendOfficerNotify')
AddEventHandler('mx_shotspotter:sendOfficerNotify', function(title, subject, msg, textureDict, time, variant)
    ESX.TriggerServerCallback('mx_shotspotter:getJob', function(job)
        for k, v in pairs(Config.WhitelistedJob) do
            currentJob = job.name

            if currentJob == v then
                if Config.NotifyType == 1 then
                    ESX.ShowAdvancedNotification(title, subject, msg, textureDict, 1)
                elseif Config.NotifyType >= 2 then
                    exports['okokNotify']:Alert(title, msg, time, variant)
                end
            end
        end
    end)
end)
