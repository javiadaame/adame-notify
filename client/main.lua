local function Conversor(text)
    text = text:gsub("~r~", "<span class='red'>")
    text = text:gsub("~b~", "<span class='blue'>")
    text = text:gsub("~g~", "<span class='green'>")
    text = text:gsub("~y~", "<span class='yellow'>")
    text = text:gsub("~p~", "<span class='purple'>")
    text = text:gsub("~c~", "<span class='grey'>")
    text = text:gsub("~m~", "<span class='darkgrey'>")
    text = text:gsub("~u~", "<span class='black'>")
    text = text:gsub("~o~", "<span class='gold'>")
    text = text:gsub("~s~", "</span>")
    text = text:gsub("~w~", "</span>")
    text = text:gsub("~b~", "<b>")
    text = text:gsub("~n~", "<br>")
    text = "<span>" .. text .. "</span>"

    return text
end

function Notify(title, message, time, type)
    SendNUIMessage({
        action = 'open',
        title = Conversor(title),
        type = type,
        message = Conversor(message),
        time = time
    })
end

RegisterNetEvent('ja-notify:Notify')
AddEventHandler('ja-notify:Notify', function(title, message, time, type)
    Notify(title, message, time, type)
end)

-- Test Command
if (Config.TestCommand.Enable) then
    RegisterCommand(Config.TestCommand.Name, function()
        exports['ja-notify']:Notify("SUCCESS",
            "<span style='color:#c7c7c7'>You have widthdrawn <span style='color:#069a19'><b>100$</b></span>!", 5000,
            'success')
        exports['ja-notify']:Notify("INFORMATION",
            "<span style='color:#c7c7c7'>Server restart in <span style='color:#fff'>5 minutes</span>!", 5000, 'info')
        exports['ja-notify']:Notify("ERROR",
            "<span style='color:#c7c7c7'>You have no <span style='color:#ff0000'>permissions</span>!", 5000, 'error')
        exports['ja-notify']:Notify("NEW SMS",
            "<span style='color:#ffc107'>695-2713: </span><span style='color:#c7c7c7'> How are you?", 5000, 'warning')
        exports['ja-notify']:Notify("TWITTER",
            "<span style='color:#01a2dc'>@USER69: </span><span style='color:#c7c7c7'> Hello everyone!", 5000, 'sms')
        exports['ja-notify']:Notify("SAVED", "<span style='color:#c7c7c7'>Clothes saved successfully!", 5000, 'long')
    end)
end
