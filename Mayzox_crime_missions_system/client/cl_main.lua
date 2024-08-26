ESX = exports["es_extended"]:getSharedObject()

local Ready, isChecking, isChecking2, Step1, Step2, Mission, Final_Mission, missionVehicle = false, false, false, false, false, false, false, nil

function SpawnGuards(model, location, heading, weapon)
    local ply = PlayerPedId()
    SetPedRelationshipGroupHash(ply, GetHashKey('PLAYER'))
    AddRelationshipGroup('GuardPeds')
    loadModel(model)
    guard = CreatePed(26, GetHashKey(model), location, heading, true, true)
    NetworkRegisterEntityAsNetworked(guard)
    networkID = NetworkGetNetworkIdFromEntity(guard)
    SetNetworkIdCanMigrate(networkID, true)
    SetNetworkIdExistsOnAllMachines(networkID, true)
    SetPedRandomComponentVariation(guard, 0)
    SetPedRandomProps(guard)
    SetEntityAsMissionEntity(guard)
    SetEntityVisible(guard, true)
    SetPedRelationshipGroupHash(guard, GetHashKey("GuardPeds"))
    SetPedAccuracy(guard, 50)
    SetPedArmour(guard, 100)
    SetPedCanSwitchWeapon(guard, true)
    SetPedDropsWeaponsWhenDead(guard, false)
    SetPedFleeAttributes(guard, 0, false)
    GiveWeaponToPed(guard, GetHashKey(weapon), 255, false, false)
    local random = math.random(1, 2)
    if random == 2 then
        TaskGuardCurrentPosition(guard, 10.0, 10.0, 1)
    end
    SetRelationshipBetweenGroups(0, GetHashKey("GuardPeds"), GetHashKey("GuardPeds"))
	SetRelationshipBetweenGroups(5, GetHashKey("GuardPeds"), GetHashKey("PLAYER"))
	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("GuardPeds"))
end

function StartMissions()
    for _, v in pairs(Mayzox.Config.Start) do
        currentTable = v
    end

    isChecking = true
    Mission = false
    while isChecking do 
        Citizen.Wait(5)
        
        if not Step1 then
            Step1 = true
            results = Mayzox.Config.Missions[math.random(#Mayzox.Config.Missions)]
            if currentTable.notify == 'okokNotify' then
                Notify(('Malcom : %s'):format(results.label), 5000, "info")
            elseif currentTable.notify == 'ESX' then
                Notify(('Malcom : %s'):format(results.label))
            end
            Citizen.Wait(500)
        end

        if not Mission then
            if results.type == 'mission_vehicle' then
                Mission = true
                
                local car = GetHashKey(results.model)
                RequestModel(car)
                while not HasModelLoaded(car) do 
                    RequestModel(car)
                    Citizen.Wait(500)
                end 
                missionVehicle = CreateVehicle(car, results.start_location, results.heading, true, false)
                SetVehicleNumberPlateText(missionVehicle, 'DKLS4')
                SetVehicleOnGroundProperly(missionVehicle)
                SetVehicleHasBeenOwnedByPlayer(missionVehicle, true)
                SetEntityAsMissionEntity(missionVehicle, true, true)
                SetVehicleNeedsToBeHotwired(missionVehicle, false)
                
                blip_missions = AddBlipForEntity(missionVehicle)
                SetBlipSprite(blip_missions, 286)
                SetBlipScale(blip_missions, 0.8)
                SetBlipColour(blip_missions, 75)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(getSetence("blip"))
                EndTextCommandSetBlipName(blip_missions)
                SetBlipRoute(blip_missions, true)

                if results.guard ~= nil then
                    for _, v in pairs(results.guard) do
                        SpawnGuards(v.ped, v.location, v.heading, v.weapon)
                    end
                end
            elseif results.type == 'mission_location' then
                Mission = true
                blip_missions = AddBlipForCoord(results.start_location)
                SetBlipSprite(blip_missions, 286)
                SetBlipScale(blip_missions, 0.8)
                SetBlipColour(blip_missions, 75)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(getSetence("blip"))
                EndTextCommandSetBlipName(blip_missions)
                SetBlipRoute(blip_missions, true)
                if results.guard ~= nil then
                    for _, v in pairs(results.guard) do
                        SpawnGuards(v.ped, v.location, v.heading, v.weapon)
                    end
                end
            elseif results.type == 'mission_hitman' then
                Mission = true
                local ply = PlayerPedId()
                local ped_hash = GetHashKey(results.ped)
                RequestModel(ped_hash)
                while not HasModelLoaded(ped_hash) do
                    Citizen.Wait(1)
                end	
                npc_walk = CreatePed(1, ped_hash, results.start_location, results.heading, true, true)
                SetPedCanSwitchWeapon(npc_walk, true)
                SetPedDropsWeaponsWhenDead(npc_walk, false)
                SetPedRelationshipGroupHash(ply, GetHashKey('PLAYER'))
                AddRelationshipGroup('GuardPeds')
                SetRelationshipBetweenGroups(0, GetHashKey("GuardPeds"), GetHashKey("GuardPeds"))
                SetRelationshipBetweenGroups(5, GetHashKey("GuardPeds"), GetHashKey("PLAYER"))
                SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("GuardPeds"))
                SetPedRelationshipGroupHash(npc_walk, GetHashKey("GuardPeds"))
                GiveWeaponToPed(npc_walk, GetHashKey(results.weapon), 255, false, false)
                SetPedArmour(npc_walk, 100)
                if IsPedNotDoingAnything(npc_walk) then
                    ClearPedTasks(npc_walk)
                    SetPedIsDrunk(npc_walk, true)
                    RequestAnimSet("move_m@gangster@ng")
                    while not HasAnimSetLoaded("move_m@gangster@ng") do
                        Wait(1)
                    end
                    SetPedMovementClipset(npc_walk, "move_m@gangster@ng", 1.0)
                    TaskWanderStandard(npc_walk, 10.0, 1082130432)
                end
                blip_missions = AddBlipForEntity(npc_walk)
                SetBlipSprite(blip_missions, 432)
                SetBlipScale(blip_missions, 0.8)
                SetBlipColour(blip_missions, 1)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(getSetence("blip"))
                EndTextCommandSetBlipName(blip_missions)
                SetBlipRoute(blip_missions, true)
                if results.guard ~= nil then
                    for _, v in pairs(results.guard) do
                        SpawnGuards(v.ped, v.location, v.heading, v.weapon)
                    end
                end
            end
        end

        if Step1 then
            if results.type == 'mission_vehicle' then
                local ply = PlayerPedId()
                if IsPedInVehicle(ply, missionVehicle, false) then
                    Citizen.Wait(1000)
                    RemoveBlip(blip_missions)
                    isChecking = false
                    Step1 = false
                    Mission = false
                    Citizen.Wait(1000)
                    FinalMissions()
                elseif IsEntityDead(missionVehicle) then
                    RemoveBlip(blip_missions)
                    isChecking = false
                    Step1 = false
                    Mission = false
                    results = false
                    if currentTable.notify == 'ESX' then
                        Notify(getSetence("vehicle_destroyed"))
                    elseif currentTable.notify == 'okokNotify' then
                        Notify(getSetence("vehicle_destroyed"), 5000, 'error')
                    end   
                end
            elseif results.type == 'mission_location' then
                local ply = PlayerPedId()
                local coords = GetEntityCoords(ply)
                if #(coords - results.start_location) < 1.5 then
                    ShowHelp(("~INPUT_CONTEXT~ %s"):format(results.msg))
                    if #(coords - results.start_location) < 10 then
                        DrawMarker(20, results.start_location, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.3, 0.3, 0.3, 255, 128, 0, 50, false, true, 2, nil, nil, false)
                    end

                    if IsControlJustPressed(0, 38) then
                        Citizen.Wait(1000)
                        RemoveBlip(blip_missions)
                        isChecking = false
                        Step1 = false
                        Mission = false
                        Citizen.Wait(1000)
                        FinalMissions()
                    end
                end
            elseif results.type == 'mission_hitman' then
                if IsEntityDead(npc_walk) then
                    RemoveBlip(blip_missions)
                    if currentTable.notify == 'ESX' then
                        Notify(getSetence("target_killed"))
                    elseif currentTable.notify == 'okokNotify' then
                        Notify(getSetence("target_killed"), 5000, 'success')
                    end
                    Citizen.Wait(1000)
                    TriggerServerEvent('mayzox:reward:boss', results.item, results.amount)
                    Citizen.Wait(1000)
                    isChecking = false
                    Step1 = false
                    Mission = false
                    results = false
                    Citizen.Wait(30000)
                    DeleteEntity(npc_walk)
                end
            end
        end
    end
end

function FinalMissions()
    for _, v in pairs(Mayzox.Config.Start) do
        currentTable = v
    end

    isChecking2 = true
    Final_Mission = false
    while isChecking2 do
        Citizen.Wait(5)
        Step2 = true
        if not Final_Mission then
            Final_Mission = true
            blip_final = AddBlipForCoord(results.final_location)
            SetBlipSprite(blip_final, 286)
            SetBlipScale(blip_final, 0.8)
            SetBlipColour(blip_final, 0)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(getSetence("blip_final"))
            EndTextCommandSetBlipName(blip_final)
            SetBlipRoute(blip_final, true)
        end

        while Step2 do
            Citizen.Wait(5)
            local ply = PlayerPedId()
            local coords = GetEntityCoords(ply)
            
            if #(coords - results.final_location) < 1.5 then
                ShowHelp(getSetence("finish_mission"))
                if #(coords - results.final_location) < 10 then
                    DrawMarker(20, results.final_location, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.3, 0.3, 0.3, 255, 128, 0, 50, false, true, 2, nil, nil, false)
                end
                if IsControlJustPressed(0, 38) then
                    if results.type == 'mission_vehicle' then
                        local vehicle = GetVehiclePedIsIn(ply, false)
                        local vCoords = GetEntityCoords(missionVehicle)
                        local vDist = #(coords - vCoords)

                        if vDist < 10.0 then
                            if currentTable.notify == 'ESX' then
                                Notify(getSetence("notify_final"))
                            elseif currentTable.notify == 'okokNotify' then
                                Notify(getSetence("notify_final"), 5000, "phonemessage")
                            end
                            Citizen.Wait(1000)
                            TriggerServerEvent('mayzox:reward:boss', results.item, results.amount)
                            Citizen.Wait(1000)
                            DeleteEntity(guard)
                            RemoveBlip(blip_final)
                            DeleteVehicle(missionVehicle)
                            isChecking2 = false
                            Step2 = false
                            Final_Mission = false
                            results = false
                        else
                            if currentTable.notify == 'ESX' then
                                Notify(getSetence("vehicle_too_far"))
                            elseif currentTable.notify == 'okokNotify' then
                                Notify(getSetence("vehicle_too_far"), 5000, "phonemessage")
                            end
                        end
                    elseif results.type == 'mission_location' then
                        if currentTable.notify == 'ESX' then
                            Notify(getSetence("notify_final"))
                        elseif currentTable.notify == 'okokNotify' then
                            Notify(getSetence("notify_final"), 5000, "phonemessage")
                        end
                        Citizen.Wait(1000)
                        TriggerServerEvent('mayzox:reward:boss', results.item, results.amount)
                        Citizen.Wait(1000)
                        DeleteEntity(guard)
                        RemoveBlip(blip_final)
                        isChecking2 = false
                        Step2 = false
                        Final_Mission = false
                        results = false
                    end
                end
            end
        end
    end
end

function TalkBoss()
    local playerPed = PlayerPedId()
    local pedCoords = GetEntityCoords(playerPed)
    local pedHeading = GetEntityHeading(playerPed)

    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, -965.9412, -1429.7676, 9.4541 + -1.1)
    SetCamRot(cam, 0.0, 0.0, -70.0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 0, true, true)
    FreezeEntityPosition(playerPed, true)

    Ready = true
    ESX.TriggerServerCallback('mayzox:gettime:boss', function(time)
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5)
                if time and time > 0 then
                    DrawTxt((getSetence("cooldown")):format(stringTime(time)), 0.5, 0.87, true, 0.35, 255, 255, 255, 255)
                    DrawTxt(getSetence("leave"), 0.5, 0.9, true, 0.3, 194, 114, 114, 255)
                    if IsControlJustPressed(0, 47) then
                        Ready = false
                        FreezeEntityPosition(playerPed, false)
                        RenderScriptCams(false, false, 0, true, true)
                        DestroyCam(cam, true)
                        break
                    end
                else
                    if not isChecking and not isChecking2 then
                        DrawTxt(getSetence("job"), 0.5, 0.87, true, 0.35, 255, 255, 255, 255)
                        DrawTxt(getSetence("accept"), 0.44, 0.9, true, 0.3, 114, 194, 123, 255)
                        DrawTxt(getSetence("refuse"), 0.57, 0.9, true, 0.3, 194, 114, 114, 255)
    
                        if IsControlJustPressed(0, 246) then
                            Ready = false
                            FreezeEntityPosition(playerPed, false)
                            RenderScriptCams(false, false, 0, true, true)
                            DestroyCam(cam, true)
                            Citizen.Wait(1500)
                            TriggerServerEvent('mayzox:start:cooldown:boss', playerPed)
                            break
                        elseif IsControlJustPressed(0, 47) then
                            Ready = false
                            FreezeEntityPosition(playerPed, false)
                            RenderScriptCams(false, false, 0, true, true)
                            DestroyCam(cam, true)
                            break
                        end      
                    else
                        DrawTxt(getSetence("already"), 0.5, 0.87, true, 0.35, 255, 255, 255, 255)
                        DrawTxt(getSetence("leave"), 0.5, 0.9, true, 0.3, 194, 114, 114, 255)
                        if IsControlJustPressed(0, 47) then
                            Ready = false
                            FreezeEntityPosition(playerPed, false)
                            RenderScriptCams(false, false, 0, true, true)
                            DestroyCam(cam, true)
                            break
                        end
                    end
                end
            end
        end)
    end)
end

function CreateBoss()
    for _, v in pairs(mayzox.Config.Start) do

        local model = GetHashKey(v.ped)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end

        local ped = CreatePed(4, model, v.location, v.heading, false, false)
        SetEntityAsMissionEntity(ped, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetPedDiesWhenInjured(ped, false)
        SetPedCanPlayAmbientAnims(ped, true)
        SetPedCanRagdollFromPlayerImpact(ped, false)
        SetPedCanRagdoll(ped, false)
        SetEntityInvincible(ped, true)
        FreezeEntityPosition(ped, true)

        while true do
            local ply = PlayerPedId()
            local pCoords = GetEntityCoords(ply)
            local dist = #(pCoords - GetEntityCoords(ped))
            if dist <= 1.5 then
                if not Ready then
                    ShowHelp(getSetence("talk_to_boss"))
                end

                if IsControlJustPressed(0, 38) then 
                    if not Ready then
                        TalkBoss()
                    end
                end  
            else      
                if dist > 1.5 then
                    Citizen.Wait(500)
                end
            end
            Citizen.Wait(5)
        end
    end
end

RegisterNetEvent('mayzox:start:mission:boss')
AddEventHandler('mayzox:start:mission:boss', function()
    StartMissions()
end)

Citizen.CreateThread(function()
    CreateBoss()
end)