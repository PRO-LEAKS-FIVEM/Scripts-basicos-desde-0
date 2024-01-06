RegisterCommand('dararmas', function(source, args)
    local targetId   = args[1]
    local weaponName = args[2]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Debes introducir una ID y un modelo de arma para spawnearla.' }
        })
        return
    end

    if not weaponName then
        TriggerEvent('chat:addMessage', {
            args = { 'Debes introducir un modelo de arma.' }
        })
        return
    end

    if not IsWeaponValid(weaponName) then
        TriggerEvent('chat:addMessage', {
            args = { 'El modelo de arma introducido no existe!' }
        })
        return
    end

    TriggerServerEvent('merc_dararmas:dararma', targetId, weaponName)
    TriggerEvent('chat:addMessage', {
        args = { 'Has dado el arma ' ..weaponName.. ' al ID ' ..targetId }
    })
end)