function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

function stringTime(time)
    local m = math.floor(time / 60)
    local s = time % 60
    return string.format("%02dm %02ds", m, s)
end

function DrawTxt(text, x, y, outline, scale, r, g, b, a)
    SetTextFont(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    if outline then
        SetTextOutline()
    end
    DrawText(x, y)
end

function IsPedNotDoingAnything(ped)
    if IsPedOnFoot(ped) and not IsEntityInWater(ped) then
        if not IsPedSprinting(ped) and not IsPedRunning(ped) and not IsPedWalking(ped) then
            if not GetIsTaskActive(ped, 12) and not GetIsTaskActive(ped, 307) then
                if IsPedStill(ped) then
                    return true
                else 
                    return false 
                end
            else 
                return false 
            end
        else 
            return false 
        end
    else 
        return false 
    end
end

function ShowHelp(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function Notify(msg, time, type)
    for _, v in pairs(ByYoSe.Config.Start) do
        if v.notify == 'ESX' then
            ESX.ShowNotification(msg)
        elseif v.notify == 'okokNotify' then
            exports['okokNotify']:Alert('', msg, time, type, playSound)
        end
    end
end