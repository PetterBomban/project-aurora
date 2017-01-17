-- move the agent to target point, return true when we arrive
-- https://love2d.org/forums/viewtopic.php?t=79168#p176506
function Helper:MoveTo(agent, target, dt)
  -- find the agent's "step" distance for this frame
  local step = agent.speed * dt

  -- find the distance to target
  local distx, disty = target.x - agent.x, target.y - agent.y
  local dist = math.sqrt(distx*distx + disty*disty)

  if dist <= step then
    -- we have arrived
    agent.x = target.x
    agent.y = target.y
    return true
  end

  -- get the normalized vector between the target and agent
  local nx, ny = distx/dist, disty/dist

  -- find the movement vector for this frame
  local dx, dy = nx * step, ny * step

  -- keep moving
  agent.x = agent.x + dx
  agent.y = agent.y + dy
  return false
end