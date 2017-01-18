Keyboard = {}
Keyboard.__index = Keyboard

function love.keypressed(key, scan)
    if key == 'escape' then
        love.event.push('quit')
    end
end

-- just used for debugging
function Keyboard:Draw()
    love.graphics.print("KeyPressed: " )
end

function Keyboard:Update(dt)
    if love.keyboard.isDown("SHIFT") then
    end

end