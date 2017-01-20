-- this is crap but works
function Movement:RotateAround(point, curPos, speed)
    local a = math.cos(speed) * (curPos.x - point.x) - 
                math.sin(speed) * (curPos.y - point.y) + point.x

    local b = math.sin(speed) * (curPos.x - point.x) + 
                math.cos(speed) * (curPos.y - point.y) + point.y

    return {x=a, y=b}
end
