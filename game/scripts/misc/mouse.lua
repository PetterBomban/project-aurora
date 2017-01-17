-- Mouse vars
Mouse = {}
Mouse.__index = Mouse

function Mouse:GetMousePos()
    return {
        x = love.mouse.getX(),
        y = love.mouse.getY()
    }
end

function love.mousepressed(x, y, button)
    if button == 1 then
        local mouse = Mouse:GetMousePos()
        Player:SetValue("nX", mouse.x)
        Player:SetValue("nY", mouse.y)
        Player:SetValue("isMoving", true)
    end
end
