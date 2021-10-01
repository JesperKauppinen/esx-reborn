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

M("command")

-- Create command to add money to players.
local addMoneyCommand = Command("addmoney", "admin", _U('account_add_money'))
addMoneyCommand:addArgument("player", "player", _U('commandgeneric_playerid'))
addMoneyCommand:addArgument("account", "string", _U('account_account_name'))
addMoneyCommand:addArgument("amount", "number", _U('account_money_value'))
addMoneyCommand:setHandler(function(player, args)
  if not args.account then
    emitClient("chat:addMessage", player.source, {args = {'^1SYSTEM', _U('account_commandderror_account')}})
    return
  end

  if not args.amount then
    emitClient("chat:addMessage", player.source, {args = {'^1SYSTEM', _U('account_commanderror_money')}})
    return
  end

	if not args.player then args.player = player end

  local player = Player.fromId(player.source)
  local identity = player:getIdentity()
  local accounts = identity:getAccounts()

  accounts:addMoney(args.account,args.amount, function(result)
    if result then
      emitClient('esx:account:notify', args.player.source, args.account, args.amount)
    else
      emitClient("chat:addMessage", player.source, {args = {'^1SYSTEM', _U('account_commandderror_account')}})
    end
  end)

end)

local removeMoneyCommand = Command("removemoney", "admin", _U('account_remove_money'))
removeMoneyCommand:addArgument("player", "player", _U('commandgeneric_playerid'))
removeMoneyCommand:addArgument("account", "string", _U('account_account_name'))
removeMoneyCommand:addArgument("amount", "number", _U('account_money_value'))
removeMoneyCommand:setHandler(function(player, args)
  if not args.account then
    emitClient("chat:addMessage", player.source, {args = {'^1SYSTEM', _U('account_commandderror_account')}})
    return
  end

  if not args.amount then
    emitClient("chat:addMessage", player.source, {args = {'^1SYSTEM', _U('account_commanderror_money')}})
    return
  end

  if not args.player then args.player = player end

  local player = Player.fromId(player.source)
  local identity = player:getIdentity()
  local accounts = identity:getAccounts()

  accounts:removeMoney(args.account, args.amount, function(result)
    if result then
      emitClient('esx:account:notify', args.player.source, args.account, args.amount)
    else
      emitClient("chat:addMessage", player.source, {args = {'^1SYSTEM', _U('account_commandderror_account')}})
    end
  end)

end)

local showMoneyCommand = Command("money", "user", _U('account_show_money_test'))
showMoneyCommand:setHandler(function(player, args)
  if not args.player then args.player = player end

  -- @TODO BUG: all player can check others money.
  local player = Player.fromId(args.player.source)
  local identity = player:getIdentity()
  local accounts = identity:getAccounts()

  emitClient("esx:account:showMoney", player.source, accounts:serialize())
end)

showMoneyCommand:register()
addMoneyCommand:register()
removeMoneyCommand:register()

