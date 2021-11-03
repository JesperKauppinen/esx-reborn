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

M('events')

module.Config = run('data/config.lua', {vector3 = vector3})['Config']

--- Example Module Event
module.EventName = function(playerId, args, kwarks)
  local amount   = amount
  local playerId = playerId
  local player   = Player.fromId(playerId)
  local identity = player:getIdentity()
  local accounts = identity:getAccounts()

  local walletAmount = accounts:getWallet()

  -- logic
  emitClient('esx:ModuleName:FunctionName', args, kwarks)

  accounts:removeMoney('wallet', amount, function(result)
    if result then
      accounts:addMoney(account, amount, function(result)
        if result then
          emitClient('esx:atm:sendResult', playerId, 'deposit', true, accounts:serialize())
        end
      end)
    end
  end)

end

--- Give Weapon To The Player
module.GiveWeapon = function(playerId, weapon, ammo)
  local _playerId = playerId
  local player   = Player.fromId(_playerId)
  local _weapon = weapon
  local _ammo = ammo
  local identity = player:getIdentity()

  --TODO: Add player weapon
  -- player.addWeapon(_weapon, _ammo)

  --- log event if logging enabled in configs
  if module.Config.EnableLogging then
    local loggedText = _weapon.." was given to "..player
    emit('logs:server:toDiscord', loggedText)
  end

end

