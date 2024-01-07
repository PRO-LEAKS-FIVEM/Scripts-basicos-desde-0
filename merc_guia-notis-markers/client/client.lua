-- Entrada de Texto

function getTextInput(title, inputLength)
    AddTextEntry('MERC_INPUT', title)
    DisplayOnscreenKeyboard(1, 'MERC_INPUT', '', '', '', '', '', inputLength)

    while UpdateOnscreenKeyboard() == 0 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()

        Citizen.Wait(0)

        return result
    else
        Citizen.Wait(0)

        return nil
    end
end

RegisterCommand('testEntradaTexto', function(source, args)
    local result = getTextInput(args, 30)

    showNotification(result, 180, false, false)
end)


-- Notificaciones de Carga

function showBusySpinner(message)
    BeginTextCommandBusyspinnerOn('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandBusyspinnerOn(5)
end

function hideBusySpinner()
    BusyspinnerOff()
end

RegisterCommand('testNotiCarga', function(source, args)
    if args == 'testNotiCarga' then
        hideBusySpinner()
    else
        showBusySpinner(args)
    end
end)


-- Subtítulos

function showSubtitle(message, duration)
    BeginTextCommandPrint('STRING')
    AddTextComponentString(message)
    EndTextCommandPrint(duration, true)
end

RegisterComand('testSubtítulo', function(source, args)
    showSubtitle(
        args,
        10000
    )
end)


-- Marcadores

RegisterCommand('testMarcador', function(source, args)
    CreateThread(function()
        local start = GetGameTimer()

        while GetGameTimer() < (start + 10000) do
            Wait(0)

            local playerPos = GetEntityCoords(PlayerPedId())

            DrawMarker(2, playerPos.x, playerPos.y, playerPos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 130, 180, true, true, 2)
        end
    end)
    
end)


-- Alertas

function showAlert(mssage, beep, duration)
    AddTextEntry('MERC_ALERT', message)

    BeginTextCommandDisplayHelp('MERC_ALERT')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end

RegisterCommand('testAlerta', function(source, args)
    showAlert(
        args,
        true,
        5000
    )
end)


-- Notificaciones avanzadas

function showAdvancedNotification(message, sender, subject, textureDict, iconType, saveToBrief, color)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(false, saveToBrief)
end

RegisterCommand('testNotiAvanzada', function(source, args)
    showAdvancedNotification(
        args,
        'Este es el Sender',
        'Este es el Sujeto',
        'CHAR_AMMUNATION',
        8,
        true,
        210
    )
end)


-- Notificaciones

function showNotification(message, color, flash, saveToBrief)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    ThefeedSetNextPostBackgroundColor(color)
    EndTextCommandThefeedPostTicker(flash, saveToBrief)
end

RegisterCommand('testNoti', function(source, args)
    showNotification(
        args,
        210,
        true,
        true
    )
end)