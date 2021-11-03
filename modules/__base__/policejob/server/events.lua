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

-- TODO: Add events

--- example event
onClient('esx:policejob:event_name', function(arrgs, kwargs)
  module.EventName(source, arrgs, kwargs)
end)


--- Give Weapon To The Player
onClient('esx:policejob:GiveWeapon', function(weapon, ammo)
  module.GiveWeapon(source, weapon, ammo)
end)
