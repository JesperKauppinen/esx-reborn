-- Copyright (c) Jérémie N'gadi
--
-- All rights reserved.
--
-- Even if 'All rights reserved' is very clear :
--
--   You shall not use any piece of this software in a commercial product / service
--   You shall not resell this software
--   You shall not provide any facility to install this particular software in a commercial product / service
--   If you redistribute this software, you must link to ORIGINAL repository at https://github.com/esx-framework/esx-reborn
--   This copyright should appear in every part of the project code

Config = {}

Config.Locale        = 'en'
Config.Proximity     = 25.001
Config.ProximityMode = true 
Config.OverHeadMode  = true -- allow text over head (/me and /do)
Config.DisableChat   = false
-- select the chats that should be available, disable with false
Config.Me            = true
Config.Do            = true
Config.Life          = true
Config.Ooc           = true
Config.Gooc          = true

-- disble or enable discord logs for the messages
Config.DiscordLogs   = true -- true to enable, false to disable
Config.DiscordWebhook = 'paste your discord webhook here'
