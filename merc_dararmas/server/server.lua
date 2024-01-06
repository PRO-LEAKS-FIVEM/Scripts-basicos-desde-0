RegisterNetEvent('merc_dararmas:dararma', function(targetId, weaponName)
    local targetPed = GetPlayerPed(targetId)
    local playerId  = source

    if targetPed <= 0 then
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Perdón, la id ' ..targetId.. ' no existe.' }
        })
        return
    end

    GiveWeaponToPed(targetPed, weaponName, 10, false, false)
end)