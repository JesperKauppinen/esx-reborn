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

-- When any money is updated, check if it was business of player, then update business money in hud
onServer('esx_addonaccount:setMoney', function(society, money)
	if ESX.PlayerData.job and ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
		module.UpdateSocietyMoneyHUDElement(money)
	end
end)


-- if job is changed, update business money in hud
onServer('esx:setJob', function(job)
	module.RefreshBossHUD()
end)

on('esx_society:openBossMenu', function(society, close, options)
	module.OpenBossMenu(society, close, options)
end)
