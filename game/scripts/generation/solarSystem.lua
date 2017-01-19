SolSys = {}
SolSys.__index = SolSys

function SolSys:Update(dt, ss)
    
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
        local orbitalPos = {
            x = 1,
            y = 2,
        }
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
    local numOrbitals = math.random(1,8)
    local i = 1
    while(i <= numOrbitals) do
        local orbital = SolSys:GenerateOrbital(star)
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
    local orbitalTime = 30 -- seconds
    local orbitalAngle = 0 -- "north"
    local orbitalRadius = math.random(100, 600) --px

    local OrbitalObj = {
        parent = parent,
        orbitalTime = orbitalTime,
        orbitalAngle = orbitalAngle,
        orbitalRadius = orbitalRadius,
    }
    return OrbitalObj
end

function SolSys:GetOrbitalPos(orbital)
    local parentPos = orbital.parent
    local oX = 
end
