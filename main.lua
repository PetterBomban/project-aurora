-- Set random seed
math.randomseed(os.time())

function love.load()
    require('game/lib/generalMath')
    require('game/scripts/misc/helpers')
    require('game/scripts/agents/player')
    require('game/scripts/movement/movement')
    require('game/scripts/misc/keyboard')
    require('game/scripts/misc/mouse')
    require('game/scripts/generation/solarSystem')

    -- graphics
    bg = love.graphics.newImage('game/assets/bg/space-4.jpg')

    -- generate initial solar system
    SolarSystem = SolSys:Load()
end

function love.draw()
    --bg
    love.graphics.draw(bg, 0, 0)

    -- debug draws --
    -- fps
    love.graphics.print("fps: " .. tostring(love.timer.getFPS()), 0, 1037)
    -- waypoints
    love.graphics.print("wp: " .. Helper:DumpTable(Player:GetValue("waypoints")), 200, 1037)
    -- solar system
    love.graphics.print("star: " .. Helper:DumpTable(SolarSystem.star), 0, 800)
    love.graphics.print("orbitals: " .. Helper:DumpTable(SolarSystem.orbitals), 0, 820)

    Player:Draw()
    SolSys:Draw(SolarSystem)
end

function love.update(dt)
    SolSys:Update(dt, SolarSystem)
    Player:Update(dt)
    Keyboard:Update(dt)
end
