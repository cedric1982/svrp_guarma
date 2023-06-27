local spawnedPeds = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        for k,v in pairs(Config.PedList) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v.coords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.model, v.coords)
                spawnedPeds[k] = { spawnedPed = spawnedPed }
            end
            
            if distance >= Config.DistanceSpawn and spawnedPeds[k] then
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Citizen.Wait(50)
                        SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                    end
                end
                DeletePed(spawnedPeds[k].spawnedPed)
                spawnedPeds[k] = nil
            end
        end
    end
end)

function NearPed(model, coords)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(50)
    end
    spawnedPed = CreatePed(model, coords.x, coords.y, coords.z - 1.0, coords.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    Citizen.InvokeNative(0x283978A15512B2FE, spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    -- set relationship group between npc and player
    Citizen.InvokeNative(0xC80A74AC829DDD92, spawnedPed, GetPedRelationshipGroupHash(spawnedPed)) -- SetPedRelationshipGroupHash
    Citizen.InvokeNative(0xBF25EB89375A37AD, 1, GetPedRelationshipGroupHash(spawnedPed), `PLAYER`) -- SetRelationshipBetweenGroups
    if Config.Debug then
        local relationship = Citizen.InvokeNative(0x9E6B70061662AE5C, GetPedRelationshipGroupHash(spawnedPed), `PLAYER`) -- GetRelationshipBetweenGroups
        print(relationship)
    end
    -- end of relationship group
    if Config.FadeIn then
        for i = 0, 255, 51 do
            Citizen.Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end
    return spawnedPed
end




Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords = GetEntityCoords(PlayerPedId())
        local traveltext = Config.TraveltextTOGuarma
        local chance = math.random(1,5)
        local chance2 = math.random(1,5)
        local chance3 = math.random(1,5)
        local chance4 = math.random(1,5)
        local chance5 = math.random(1,5)
        local diceroll = chance
        local diceroll2 = chance2
        local diceroll3 = chance3
        local diceroll4 = chance4
        local diceroll5 = chance5
        local spawnroll = diceroll + diceroll2 + diceroll3 + diceroll4 + diceroll5
        if (Vdist(coords.x, coords.y, coords.z, 2671.13, -1552.96, 46.47) < 2.0) then
            DrawTxt( traveltext, 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then
                local player = PlayerPedId()
                local Ped = PlayerPedId()
                if Config.debug == true then print("Pre-roll 1: "..diceroll) end
                if Config.debug == true then print("Pre-roll 2: "..diceroll2) end
                if Config.debug == true then print("Pre-roll 3: "..diceroll3) end
                if Config.debug == true then print("Pre-roll 4: "..diceroll4) end
                if Config.debug == true then print("Pre-roll 5: "..diceroll5) end
                if Config.debug == true then print("Roll Math: "..diceroll.." + "..diceroll2.." + "..diceroll3.." + "..diceroll4.." + "..diceroll5) end
                TriggerServerEvent('wcrp:guarmaticketbuy')
                TriggerEvent("vorp:TipBottom", Config.TravelTiptextTO, 5000)
                FreezeEntityPosition(Ped,true) -- Freeze person
                if Config.transitions == true then ExecuteCommand('hud') end
                if Config.transitions == true then DoScreenFadeOut(3000) end
                Wait(3000)
                SetEntityCoords(Ped, 2524.167, -1839.067, 44.93) -- Boat Transition area
                if Config.transitions == true then DoScreenFadeIn(500) end
                if Config.transitions == true then Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, 'Guarma', 'El Bahia Del Paz', 'Dein Boot segelt. .') end
                Citizen.InvokeNative(0xA657EC9DBC6CC900, 1935063277) -- Native setting Minimap by hash, can be either Guarma or World
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 1) -- Set Guarma Water Type
                Citizen.InvokeNative(0x74E2261D2A66849A, true) -- Set Guarma Horizon Status
                Wait(20000)
                if Config.debug == true then print("Guarma Spawn") end
                if spawnroll == 5 then
                    if Config.debug == true then print("Section: 5") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1269.325, -6851.982, 43.168)
                elseif spawnroll >= 6 and spawnroll <= 9 then
                    if Config.debug == true then print("Section: 6-9") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1269.55, -6854.188, 43.168)
                elseif spawnroll >= 10 and spawnroll <= 15 then
                    if Config.debug == true then print("Section: 10-15") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1269.724, -6855.1577, 43.168)
                elseif spawnroll >= 16 and spawnroll <= 20 then
                    if Config.debug == true then print("Section: 16-20") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1270.245, -6854.557, 43.168)
                elseif spawnroll >= 21 and spawnroll <= 25 then
                    if Config.debug == true then print("Section: 21-25") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1265.973, -6854.015, 43.168)
                else
                    if Config.debug == true then print("Error: No Category within range") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 1270.34, -6857.038, 43.168)
                end
                FreezeEntityPosition(Ped,false) -- Unfreeze person
                if Config.transitions == true then DoScreenFadeOut(1000) end
                Wait(900)
                if Config.transitions == true then ShutdownLoadingScreen() end
                Wait(500)
                if Config.transitions == true then DoScreenFadeIn(4000) end
                if Config.transitions == true then ExecuteCommand('hud') end
                guarma = true
            end
        end
    end
end)


Citizen.CreateThread(function() -- TP Back from Guarma
	while true do
	Citizen.Wait(1)
	local coords = GetEntityCoords(PlayerPedId())
        local chance = math.random(1,5)
        local chance2 = math.random(1,5)
        local chance3 = math.random(1,5)
        local chance4 = math.random(1,5)
        local chance5 = math.random(1,5)
        local diceroll = chance
        local diceroll2 = chance2
        local diceroll3 = chance3
        local diceroll4 = chance4
        local diceroll5 = chance5
        local spawnroll = diceroll + diceroll2 + diceroll3 + diceroll4 + diceroll5
    if (Vdist(coords.x, coords.y, coords.z, 1265.8421, -6852.1635, 43.4185) < 2.0) then
            DrawTxt( Config.TraveltextTOSD, 0.50, 0.85, 0.7, 0.5, true, 255, 255, 255, 255, true)
            if IsControlJustReleased(0, 0x760A9C6F) then
                local player = PlayerPedId()
                local Ped = PlayerPedId()
                if Config.debug == true then print("Pre-roll 1: "..diceroll) end
                if Config.debug == true then print("Pre-roll 2: "..diceroll2) end
                if Config.debug == true then print("Pre-roll 3: "..diceroll3) end
                if Config.debug == true then print("Pre-roll 4: "..diceroll4) end
                if Config.debug == true then print("Pre-roll 5: "..diceroll5) end
                if Config.debug == true then print("Roll Math: "..diceroll.." + "..diceroll2.." + "..diceroll3.." + "..diceroll4.." + "..diceroll5) end
                TriggerServerEvent('wcrp:guarmaticketbuy2')
                TriggerEvent("vorp:TipBottom", Config.TravelTiptextFROM, 5000)
                if Config.transitions == true then ExecuteCommand('hud') end
                if Config.transitions == true then DoScreenFadeOut(3000) end
		FreezeEntityPosition(Ped,true)
                Wait(3000)
                if Config.transitions == true then DoScreenFadeIn(500) end
		if Config.transitions == true then Citizen.InvokeNative(0x1E5B70E53DB661E5, 0, 0, 0, 'Mainland', 'Saint Denis Harbor', 'endlich zu Hause. .') end
                Citizen.InvokeNative(0x74E2261D2A66849A, 0)
                Citizen.InvokeNative(0xA657EC9DBC6CC900, -1868977180)
                Citizen.InvokeNative(0xE8770EE02AEE45C2, 0)
                if Config.debug == true then print("Guarma Return Spawn Function") end
                SetEntityCoords(Ped, 2534.975, -1835.944, 41.93) -- Boat Transition Area
                Wait(20000)
                --Wait(2000)
                if spawnroll == 5 then
                    if Config.debug == true then print("Section: 5") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2670.69, -1547.34, 45.819)
                elseif spawnroll >= 6 and spawnroll <= 9 then
                    if Config.debug == true then print("Section: 6-9") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2673.952, -1547.87, 45.819)
                elseif spawnroll >= 10 and spawnroll <= 15 then
                    if Config.debug == true then print("Section: 10-15") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2670.850, -1550.013, 45.819)
                elseif spawnroll >= 16 and spawnroll <= 20 then
                    if Config.debug == true then print("Section: 16-20") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2668.939, -1545.1269, 45.819)
                elseif spawnroll >= 21 and spawnroll <= 25 then
                    if Config.debug == true then print("Section: 21-25") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2674.150, -1544.462, 45.819)
                else
                    if Config.debug == true then print("Error: No Category within range") end
                    if Config.debug == true then print("Final Roll: "..spawnroll) end
                    SetEntityCoords(Ped, 2665.937, -1554.36, 45.522)
                end
                if Config.transitions == true then DoScreenFadeIn(4000) end
                if Config.transitions == true then ShutdownLoadingScreen() end
                FreezeEntityPosition(Ped,false)
                Wait(1000)
                if Config.transitions == true then ExecuteCommand('hud') end
		guarma = false
            end
        end
    end
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
   SetTextScale(w, h)
   SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
   SetTextCentre(centre)
   if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
   Citizen.InvokeNative(0xADA9255D, 10);
   DisplayText(str, x, y)
end


-- funtions
function SET_PED_RELATIONSHIP_GROUP_HASH ( iVar0, iParam0 )
    return Citizen.InvokeNative( 0xC80A74AC829DDD92, iVar0, _GET_DEFAULT_RELATIONSHIP_GROUP_HASH( iParam0 ) )
end

function _GET_DEFAULT_RELATIONSHIP_GROUP_HASH ( iParam0 )
    return Citizen.InvokeNative( 0x3CC4A718C258BDD0 , iParam0 );
end

function modelrequest( model )
    Citizen.CreateThread(function()
        RequestModel( model )
    end)
end

-- load NPCs
Citizen.CreateThread(function()
    for z, x in pairs(Config.Npc) do
    while not HasModelLoaded( GetHashKey(Config.Npc[z]["Model"]) ) do
        Wait(500)
        modelrequest( GetHashKey(Config.Npc[z]["Model"]) )
    end
    local npc = CreatePed(GetHashKey(Config.Npc[z]["Model"]), Config.Npc[z]["Pos"].x, Config.Npc[z]["Pos"].y, Config.Npc[z]["Pos"].z, Config.Npc[z]["Heading"], false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    Wait(100)
    SET_PED_RELATIONSHIP_GROUP_HASH(npc, GetHashKey(Config.Npc[z]["Model"]))
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(Config.Npc[z]["Model"]))
    end
end)