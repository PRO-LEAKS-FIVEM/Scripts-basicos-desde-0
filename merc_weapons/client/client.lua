RegisterCommand('cogerArmas', function(source, args)
    local weaponName = args[1]

    if no IsWeaponValid(weaponName) then
        TriggerEvent('chat:addMessage', {
            args = { 'Parece que el modelo de arma ' ..weaponName.. ' no existe.' }
        })
        return
    end

    local playerPed  = PlayerPedId()

    GiveWeaponToPed(playerPed, weaponName, 10, false, false)

    TriggerEvent('chat:addMessage', {
        args = { 'Te has dado el arma ' ..weaponName.. 'con éxito!' }
    })
end)