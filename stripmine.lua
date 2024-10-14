function refuel()
	if turtle.getFuelLevel() < 50 then
		turtle.select(16)
		turtle.placeUp()
		turtle.suckUp()
		turtle.refuel()
		turtle.dropUp()
		turtle.digUp()
	end
end

function moveForward()
	refuel()
	while turtle.detect() do
		turtle.dig()
	end
	turtle.forward()
	turtle.digUp()
	turtle.digDown()
end

function checkFullInv()
	for i=1,14 do
		if turtle.getItemCount(i) == 0 then
			return false
		end
	end
	return true
end

function dumpItems()
	turtle.select(15)
	turtle.placeUp()
	for i=1,14 do
		turtle.select(i)
		turtle.dropUp()
	end
	turtle.select(15)
	turtle.digUp()
end

function main()
	refuel()
	-- move into position
	while not turtle.detect() do
		turtle.forward()
	end
	turtle.turnLeft()

	-- mining loop
	while true do
		moveForward()
		if checkFullInv() then
			dumpItems()
		end
	end
end

main()