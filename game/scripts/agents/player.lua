Player = {}
Player.__index = Player

local PlayerObj = {
    speed = 10,
    x = 500,
    y = 500,
}
local PlayerImg = {
    static = love.graphics.newImage('game/assets/player/playerStatic.png')
}

function Player:Update(dt)
    local target = {x=600, y=600}
    Helper:MoveTo(PlayerObj, target, dt)
end

function Player:Draw()

end
