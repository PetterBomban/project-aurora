Player = {}
Player.__index = Player

local PlayerObj = {
    speed = 100,
    rotation = 0,
    x = 500,
    y = 500,
    nX = 500,
    nY = 500,
    isMoving = false,
    waypoints = {
        [1] = {x=500,y=500}
    }
}
local PlayerImg = {
    static = love.graphics.newImage('game/assets/player/playerStatic.png')
}

function Player:Update(dt)
    -- movement
    if PlayerObj.isMoving == true then
        -- rotate the player towards the target
        local angle =  Movement:GetAngle(PlayerObj, {x=PlayerObj.nX, y=PlayerObj.nY}, dt)
        local angle2 = lerp(PlayerObj.rotation, angle, dt)
        PlayerObj.rotation = angle2

        -- this moves the player until it gets to its target (return true)
        if (Player:MoveTo({x=PlayerObj.nX, y=PlayerObj.nY}, dt)) == true then
            PlayerObj.isMoving = false
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
