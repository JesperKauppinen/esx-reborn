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

local HUD = M('game.hud')

module.Init()

Citizen.CreateThread(function()
  -- wait script to get player data
	while (ESX.PlayerData == nil) or (ESX.PlayerData.job == nil) do
		Citizen.Wait(0)
  end

  -- wait script to load hud frame (what is that)
  while (not HUD.Frame) or (not HUD.Frame.loaded) do
    Citizen.Wait(0)
  end

  module.RefreshBossHUD()

end)
