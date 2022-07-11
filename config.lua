Config = {}

Config.EnableSilencerDetection = true -- when true enables the detection for Weapons with silencer

Config.NotifyType = 2 -- 1 = ESX Notification, 2 = Export Notification ( Only use 2 when you know how to change the export in notify.lua )

Config.EnableBlips = true -- Enable or Disable blips
Config.BlipRemoveTime = 60 -- Time when the blips get removed in seconds

Config.Cooldown = 10 -- cooldown for the cop messages in seconds

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