RegisterCommand('+capó', function()
    local playerPed     = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerPed, false)

    if playerVehicle <= 0 then
        return
    end

    if GetPedInVehicleSeat(playerPed, -1) ~= playerPed then
        return
    end

    if GetVehicleDoorAngleRatio(playerVehicle, 4) >= 0.1 then
        SetVehicleDoorShut(playerVehicle, 4, false)
    else
        SetVehicleDoorOpen(playerVehicle, 4, false, false)
    end
end)

RegisterCommand('+maletero', function()
    local playerPed     = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerPed, false)

    if playerVehicle <= 0 then
        return
    end

    if GetPedInVehicleSeat(playerPed, -1) ~= playerPed then
        return
    end

    if GetVehicleDoorAngleRatio(playerVehicle, 5) >= 0.1 then
        SetVehicleDoorShut(playerVehicle, 5, false)
    else
        SetVehicleDoorOpen(playerVehicle, 5, false, false)
    end
end)


RegisterKeyMapping('+capó', 'Abrir/Cerrar Capó', 'keyboard', 'PRIOR')
RegisterKeyMapping('+maletero', 'Abrir/Cerrar Maletero', 'keyboard', 'NEXT')


-- CreateThread(function()
--     while true do
--         Wait(0)

--         local playerPed     = PlayerPedId()
--         local playerVehicle = GetVehiclePedIsIn(playerPed, false)

--         if playerVehicle > 0 and GetPedInVehicleSeat(playerVehicle, -1) == playerPed then
--             if IsControlJustReleased(0, 208) then
--                 if GetVehicleDoorAngleRatio(playerVehicle, 4) >= 0.1 then
--                     SetVehicleDoorShut(playerVehicle, 4, false)
--                 else
--                     SetVehicleDoorOpen(playerVehicle, 4, false, false)
--                 end
--             end

--             if IsControlJustReleased(0, 207) then
--                 if GetVehicleDoorAngleRatio(playerVehicle, 5) >= 0.1 then
--                     SetVehicleDoorShut(playerVehicle, 5, false)
--                 else
--                     SetVehicleDoorOpen(playerVehicle, 5, false, false)
--                 end
--             end
--         end
--     end
-- end)
