local spawnX, spawnY, spawnZ = 1959.55, -1714.46, 30
function joinHandler()
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox("Welcome to Camille", source)
end

function createVehicleForPlayer(thePlayer, command, vehicleModel)
	local x,y,z = getElementPosition(thePlayer)
	x = x + 5

	local createdVehicle = createVehicle(tonumber(vehicleModel),x,y,z)

	if(createdVehicle == false) then
		outputChatBox("FAILED", thePlayer)
	end	
end

function loginHandler(username, password)

	if username == "user" and password == "apple" then

		if (client) then
			spawnPlayer(client, 1959.55, -1714.46, 20)
			fadeCamera(client, true)
			setCameraTarget(client, client)
			outputChatBox("LOGGED IN")
		end
	else
		outputChatBox("INVALIDZ")
	end
end

function triggerCommand(playerSource, commandName)
	triggerClientEvent(playerSource, "onCommandCommand", playerSource)
end

addEvent("submitLogin", true)
addEventHandler("submitLogin", root, loginHandler)

addEventHandler("onPlayerJoin", getRootElement(), joinHandler)
addCommandHandler("createvehicle", createVehicleForPlayer)
addCommandHandler("commands", triggerCommand)