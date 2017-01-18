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
        -- waypoint handling
        if Player:GetPlayer().mode == "waypoint" then
            Movement:AddWaypoint(Player:GetPlayer(), {x=mouse.x, y=mouse.y})
            Player:SetValue("isMoving", true)
        else
            -- remove all waypoints if we try to move while not in 
            -- waypoint mode.
            Movement:RemoveWaypoint(Player:GetPlayer(), "all")
            Player:SetValue("nX", mouse.x)
            Player:SetValue("nY", mouse.y)
            Player:SetValue("isMoving", true)
        end
    end
end
