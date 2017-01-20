SolSys = {}
SolSys.__index = SolSys

function SolSys:Update(dt, ss)
    -- orbitaling parent
    local parentPos = ss.star
    local orbitalPos = ss.orbital

    for key, value in pairs(ss.orbitals) do
        local orbital = ss.orbitals[key]
        
        local pos = Movement:RotateAround(parentPos, orbital, orbital.orbitalSpeed, dt)

        ss.orbitals[key].x = pos.x
        ss.orbitals[key].y = pos.y
    end
    
end

function SolSys:Load()
    return SolSys:GenerateSolarSystem()
end

function SolSys:Draw(ss)
    local star = ss.star
    local orbitals = ss.orbitals

    love.graphics.circle("fill", star.x, star.y, 50, 300)

    for key, value in pairs(orbitals) do
        local orbital = orbitals[key]
        -- spawn planets
        love.graphics.circle("fill", orbital.x, orbital.y, 30, 100)
    end
end

function SolSys:GenerateSolarSystem()
    -- we just generate one star for now
    local SolarSystem = {
        star = SolSys:GenerateStar({x=500, y=500}),
        orbitals = {},
    }

    -- generate a random number of orbitals, with the star
    -- as their parent.
    local numOrbitals = math.random(1, 8)
    local i = 1
    while(i <= numOrbitals) do
        local orbital = SolSys:GenerateOrbital(star)
        orbital.orbitalSpeed = math.prandom(0.0001, 0.001)
        table.insert(SolarSystem.orbitals, orbital)
        i = i + 1
    end

    return SolarSystem
end

function SolSys:GenerateStar(coordinates)
    local c = coordinates
    local StarObj = {x=c.x, y=c.y}
    return StarObj
end

function SolSys:GenerateOrbital(parent)
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    local x = math.random(100, 900)
    local y = math.random(100, 900)
    local orbitalSpeed = 1 -- this gets changed 
    local orbitalRadius = 1

    local OrbitalObj = {
        x = x,
        y = y,
        parent = parent,
        orbitalSpeed = orbitalSpeed,
        orbitalRadius = orbitalRadius,
    }
    return OrbitalObj
end

function SolSys:GetOrbitalPos(orbital)
    local parentPos = orbital.parent
    local oX = 1
end

