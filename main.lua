function love.load()
    require('game/lib/generalMath')
    require('game/scripts/misc/helpers')
    require('game/scripts/agents/player')
    require('game/scripts/movement/movement')
    require('game/scripts/misc/keyboard')
    require('game/scripts/misc/mouse')

    -- graphics
    bg = love.graphics.newImage('game/assets/bg/space-4.jpg')
end

function love.draw()
    --bg
    love.graphics.draw(bg, 0, 0)

    -- debug draws --
    -- fps
    love.graphics.print("fps: " .. tostring(love.timer.getFPS()), 0, 1037)
    -- waypoints
    love.graphics.print("wp: " .. Helper:DumpTable(Player:GetValue("waypoints")), 200, 1037)
    -- player
    Player:Draw()
end

function love.update(dt)
    Player:Update(dt)
    Keyboard:Update(dt)
end
