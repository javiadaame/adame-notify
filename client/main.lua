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

-- Test Command
if (Config.TestCommand.Enable) then
    RegisterCommand(Config.TestCommand.Name, function()
        AdameNotify = exports['adame-notify']

        AdameNotify:Notify("SUCCESS", "<span style='color:#fff'>All is nice.</span>!", 5000, 'success')

        AdameNotify:Notify("INFORMATION",
            "<span style='color:#fff'>Server restart in <span style='color:#ff0000'>5 minutes</span>!", 5000, 'info')

        AdameNotify:Notify("ERROR",
            "<span style='color:#fff'>You don't have <span style='color:#ff0000'>permissions.</span>!", 5000, 'error')

        AdameNotify:Notify("SAVED", "<span style='color:#c7c7c7'>Clothes saved successfully!", 5000, 'long')
    end)
end
