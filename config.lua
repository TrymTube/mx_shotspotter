Config = {}

Config.Debug = true

Config.EnableSilencerDetection = true -- when true enables the detection for Weapons with silencer

Config.NotifyType = 2 -- 1 = ESX Notification, 2 = Export Notification ( Only use 2 when you know how to change the export in notify.lua )
Config.UsePhoneDispatch = false -- if true use the event down below

Config.EnableBlips = true -- Enable or Disable blips
Config.BlipRemoveTime = 60 -- Time when the blips get removed in seconds

Config.NotifyWait = 5 -- How long it takes until the Police gets notified in seconds

Config.Cooldown = 20 -- cooldown for the cop messages in seconds

Config.WhitelistedJob = { -- Jobs that will receive a Dispatch and are allowed to shoot
    "police", "sheriff"
}

Config.BlacklistedWeapons = { -- Enter Blacklisted Weapons in here
	`WEAPON_STUNGUN`,
	`WEAPON_FLAREGUN`,
	`WEAPON_BZGAS`,
	`WEAPON_MOLOTOV`,
	`WEAPON_SNOWBALL`,
	`WEAPON_BALL`,
	`WEAPON_SMOKEGRENADE`,
	`WEAPON_FLARE`,
	`WEAPON_PETROLCAN`,
	`WEAPON_HAZARDCAN`,
	`WEAPON_FIREEXTINGUISHER`
}

RegisterNetEvent('mx_shotspotter:phoneDispatch')
AddEventHandler('mx_shotspotter:phoneDispatch', function(coords, currentWeapon) -- If Config.UsePhoneDispatch = true insert your Phone Dispatch Trigger in here
	
end)