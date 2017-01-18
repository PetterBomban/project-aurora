Agent = {}
Agent.__index = Agent

function Agent:Create(name)
    local AgentObj = {
        speed = 80,
        rotation = 0,
        x = 200,
        y = 200,
        nX = 200,
        nY = 200,
        isMoving = false,
        waypoints = {
            [1] = {x=200,y=200}
        }
    }
    return AgentObj
end

function Agent:Draw(agent, agentImg)

end
