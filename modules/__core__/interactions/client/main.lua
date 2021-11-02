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

module.Init()

ESX.SetInterval(1, function()
  if IsDisabledControlJustReleased(0, 37) then -- Tabulator
    if not module.FocusActive then
      module.FocusActive = true
      module.StartInteraction()
    end
  end

  if IsControlJustReleased(0, 18) and module.FocusActive then -- ENTER / LEFT MOUSE BUTTON / SPACEBAR
    if module.Object and not module.Busy then
      if module.Object.interactable == "vending" then
        local object = module.Object

        if object.type == "machine" then
          module.VendMachine(object)
        elseif object.type == "vendor" then
          module.VendStand(object)
        end
      elseif module.Object.interactable == "atm" then
        module.ATM(module.Object)
      end
    end
  end
end)

ESX.SetInterval(250, function()
  if module.FocusActive then
    if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("WEAPON_UNARMED") then
      module.SavedWeapon = GetSelectedPedWeapon(PlayerPedId())
      SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
    end
  end
end)

ESX.SetInterval(1, function()
  if module.FocusActive then

    SetPlayerLockonRangeOverride(PlayerId(), 0.0)
    DisablePlayerFiring(PlayerPedId(), true)
    DisableControlAction(0,21,true)
    DisableControlAction(0,22,true)
    DisableControlAction(1,37,true)
    DisableControlAction(0,47,true)  -- disable weapon
    DisableControlAction(0,58,true)  -- disable weapon
    DisableControlAction(0,263,true) -- disable melee
    DisableControlAction(0,264,true) -- disable melee
    DisableControlAction(0,257,true) -- disable melee
    DisableControlAction(0,140,true) -- disable melee
    DisableControlAction(0,141,true) -- disable melee
    DisableControlAction(0,142,true) -- disable melee
    DisableControlAction(0,143,true) -- disable melee

    NetworkSetFriendlyFireOption(false)
    SetCanAttackFriendly(PlayerPedId(), false, false)
  end

  if module.Busy then
    module.Disabled = true
    DisableAllControlActions(0)
    EnableControlAction(0, 1, true)
    EnableControlAction(0, 2, true)
  else
    if module.Disabled then
      module.Disabled = false
      EnableAllControlActions(0)
    end
  end
end)

if Config.Modules.Interactions.EnableDebugging then
  ESX.SetInterval(1, function()
    if module.ShouldHighlightObject then
      if module.Object.coords then
        module.HighlightObject(module.Object.coords)
      end
    end
  end)
end
