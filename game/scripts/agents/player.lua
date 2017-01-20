Player = {}
Player.__index = Player

local PlayerObj = {
    speed = 150,
    rotation = 0,
    rotationSpeed = 2,
    x = 500,
    y = 500,
    nX = 500,
    nY = 500,
    isMoving = false,
    mode = "",
    waypoints = {
    }
}
local PlayerImg = {
    static = love.graphics.newImage('game/assets/player/playerStatic.png')
}

function Player:Update(dt)
    -- movement
    if PlayerObj.isMoving == true then
        -- 
        if PlayerObj.waypoints[1] ~= nil then
            PlayerObj.nX = PlayerObj.waypoints[1].x
            PlayerObj.nY = PlayerObj.waypoints[1].y
        end

        -- rotate the player towards the target
        local angle =  Movement:GetAngle(PlayerObj, {x=PlayerObj.nX, y=PlayerObj.nY}, dt)
        local angle2 = lerp(PlayerObj.rotation, angle, PlayerObj.rotationSpeed * dt) 
        PlayerObj.rotation = angle2

        -- this moves the player until it gets to its target (return true)
        if (Player:MoveTo({x=PlayerObj.nX, y=PlayerObj.nY}, dt)) == true then
            if PlayerObj.waypoints[1] ~= nil then
                Movement:RemoveWaypoint(PlayerObj, 1)
            else
                PlayerObj.isMoving = false
            end
        end
    end
end

function Player:Draw()
    -- static image
    love.graphics.draw(PlayerImg.static,PlayerObj.x, PlayerObj.y,
                        PlayerObj.rotation, 1, 1,
                        PlayerImg.static:getWidth()/2,
                        PlayerImg.static:getHeight()/2)

    -- debug draws --
    -- isMoving
    love.graphics.print("isMoving: " .. tostring(PlayerObj.isMoving), 1, 0)
    -- current xy
    love.graphics.print("x/y: " .. tostring(math.floor(PlayerObj.x)) .. "x" ..
                        tostring(math.floor(PlayerObj.y)), 100, 0)
    -- next xy
    love.graphics.print("nX/nY: " .. tostring(PlayerObj.nX) .. "x" ..
                        tostring(PlayerObj.nY), 200, 0)
    -- current mode
    love.graphics.print("mode: " .. tostring(PlayerObj.mode), 350, 0)
    --rotation
    love.graphics.print("rot.: " .. tostring(PlayerObj.rotation), 400, 0)
end --Draw

function Player:MoveTo(target, dt)
    return Movement:MoveTo(PlayerObj, target, dt)
end

function Player:SetValue(key, value)
    PlayerObj[key] = value
end

function Player:GetValue(key)
    return PlayerObj[key]
end

function Player:GetPlayer()
    return PlayerObj
end
