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

M('command')

local NewCommand = Command("CommandName", "group", _U('description'))
OpenATM:setHandler(function(player, args)

  local player = Player.fromId(player.source)
  local identity = player:getIdentity()
  local accounts = identity:getAccounts()
  emitClient('esx:ModuleName:FunctionName', player.source, args, kwargs)
end)


NewCommand:register()
