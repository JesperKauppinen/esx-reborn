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

local self = ESX.Modules['boot']

collectgarbage('generational')

-- version check
Citizen.CreateThread(
	function()
		local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
		if vRaw then
			local v = json.decode(vRaw)
			PerformHttpRequest(
				'https://raw.githubusercontent.com/esx-framework/esx-reborn/experimental/version.json',
				function(code, res, headers)
					if code == 200 then
						local rv = json.decode(res)
						if rv.version == v.version then
							if rv.commit ~= v.commit then 
							print(
								([[

^1----------------------------------------------------------------------
^1URGENT: ESX REBORN IS OUTDATED!
^1COMMIT UPDATE: ^5%s AVAILABLE
^1DOWNLOAD:^5 https://github.com/esx-framework/esx-reborn/tree/experimental
^1CHANGELOG:^5 %s
^1-----------------------------------------------------------------------
]]):format(
									rv.commit,
									rv.changelog
								)
							)
						else
							print(
								([[

^8-------------------------------------------------------
^2ESX REBORN IS UP TO DATE!
^5Version:^0 %s
^5COMMIT:^0 %s
^5CHANGELOG:^0 %s
^8-------------------------------------------------------
]]):format(
								 	rv.version,
									rv.commit,
									rv.changelog
								)
							)
						end
					else
						print(
							([[
^1----------------------------------------------------------------------
^1URGENT: ESX REBORN IS OUTDATED!
^1COMMIT UPDATE: ^5%s AVAILABLE
^1DOWNLOAD:^5 https://github.com/esx-framework/esx-reborn/tree/experimental
^1CHANGELOG:^5 %s
^1-----------------------------------------------------------------------
]]):format(
								rv.commit,
								rv.changelog
							)
						)
						end
					else
						print('[^5esx-reborn^0] [^1ERROR^0] ESX Reborn is unable to check version!')
					end
				end,
				'GET'
			)
		end
	end
)


