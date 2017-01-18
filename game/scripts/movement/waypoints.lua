-- coordinates = {x=0, y=0}
function Movement:AddWaypoint(agent, coordinates)
    table.insert(agent.waypoints, coordinates)
end

function Movement:RemoveWaypoint(agent, num)
    -- by default we remove the first item in the table
    if num == nil then num = 1 end
    -- remove all items if "all" is the specified 'num'
    -- else we just remove num.
    if num == "all" then 
        for k, v in pairs(agent.waypoints) do agent.waypoints[k] = nil end
    else
        table.remove( agent.waypoints, num)
    end
end

function Movement:GetWaypoints(agent)
    return agent.waypoints
end
