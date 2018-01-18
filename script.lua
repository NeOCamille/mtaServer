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




addEventHandler("onPlayerJoin", getRootElement(), joinHandler)
addCommandHandler("createvehicle", createVehicleForPlayer)