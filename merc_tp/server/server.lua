RegisterNetEvent('merc_tp:ir', function(targetId)
    local playerId  = source
    local playerPed = GrtPlayerPed(playerId)
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Perdón, la id ' ..targetId.. ' no existe.' }
        })
        return
    end


    local targetPos = GetEntityCoords(targetPed)

    SetEntityCoords(playerPed, targetPos)
end)


RegisterNetEvent('merc_tp:traer', function(targetId)
    local playerId  = source
    local playerPed = GetPlayerPed(playerId)
    local playerPos = GetEntityCoords(playerPed)
    local targetPed = GetPlayerPed(targetId)

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Perdón, la id ' ..targetId.. ' no existe.' }
        })
        return
    end 

    SetEntityCoords(targetPed, playerPos)
end)