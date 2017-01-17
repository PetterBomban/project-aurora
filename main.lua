function love.load()
    require('game/lib/generalMath')
    require('game/scripts/misc/helpers')
    require('game/scripts/agents/player')
    require('game/scripts/movement/movement')
    require('game/scripts/misc/keyboard')
    require('game/scripts/misc/mouse')
end

function love.draw()
    Player:Draw()
end

function love.update(dt)
    Player:Update(dt)
end
