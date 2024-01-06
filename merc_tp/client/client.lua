RegisterCommand('ir', function(source, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Por favor, introdúzca un número ID de jugador.' }
        })
        return
    end

    TriggerServerEvent('merc_tp:ir', targetId)
end)



RegisterCommand('traer', function(source, args)
    local targetId = args[1]

    if not targetId then
        TriggerEvent('chat:addMessage', {
            args = { 'Por favor, introdúzca un número ID de jugador.' }
        })
        return
    end

    TriggerServerEvent('merc_tp:traer', targetId)
end)
