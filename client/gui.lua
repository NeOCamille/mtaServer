function createLoginWindow()

    local x = 0.375
    local y = 0.375
    local width = 0.25
    local height = 0.25

    windowForLogin = guiCreateWindow(x, y, width, height, "Please log in", true)

    x = 0.0825
    y = 0.2
    
    guiCreateLabel(x, y, width, height, "Username", true, windowForLogin)
    y = 0.5
    guiCreateLabel(x, y, width, height, "Password", true, windowForLogin)

    x = 0.415
    y = 0.2
    width = 0.5
    height = 0.15

    containerUser = guiCreateEdit(x, y, width, height, "", true, windowForLogin)
    y = 0.5
    containerPass = guiCreateEdit(x, y, width, height, "", true, windowForLogin)

    guiEditSetMaxLength(containerUser, 50)
    guiEditSetMaxLength(containerPass, 50)

    y = 0.7
    width = 0.25
    height = 0.2

    loginButton = guiCreateButton(x, y, width, height, "Log in", true, windowForLogin)

    guiSetVisible(windowForLogin, false)


    addEventHandler("onClientGUIClick", loginButton, clientSubmitLogin, false)
end

function clientSubmitLogin(button, state)
    
    if button == "left" and state == "up" then
        local username = guiGetText(containerUser)
        local password = guiGetText(containerPass)

        if username and password then

            triggerServerEvent("submitLogin", getRootElement(), username, password)

            guiSetInputEnabled(false)
            guiSetVisible(windowForLogin, false)
            showCursor(false)

        else

            outputChatBox("Enter all fields")
            
        end
    end 
end 


addEventHandler("onClientResourceStart", getResourceRootElement(),
    function ()

        outputChatBox("Camille's server")
        createLoginWindow()

        if (windowForLogin ~= nil) then
            guiSetVisible(windowForLogin, true)
        else
            outputChatBox("Error with loginwindow")
        end

        showCursor(true)
        guiSetInputEnabled(true)

    end
)



