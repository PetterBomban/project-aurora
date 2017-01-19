SolSys = {}
SolSys.__index = SolSys

function SolSys:GenerateSolarSystem()
    -- we just generate one star for now
    local star = SolSys:GenerateStar()

    -- generate a random number of orbitals, with the star
    -- as their parent.
    local numOrbitals = math.random(1,8)
    local i = 1
    while(i <= numOrbitals) do
        SolSys:GenerateOrbital(star)
    end
end

function SolSys:UpdateSolarSystem(dt)
    
end

function SolSys:GenerateStar(coordinates)
    local x = coordinates.x
    local y = coordinates.y
    local StarObj = {
        coordinates = {x=x, y=y}
    }
    return StarObj
end

function SolSys:GenerateOrbital(parent)
    local orbitalTime = 30 -- seconds
    local orbitalAngle = 0 -- "north"

    local OrbitalObj = {
        orbitalTime = orbitalTime
        orbitalAngle = orbitalAngle
        parent = parent
    }
    --x = x + math.cos(orbitalAngle) * dt * orbitalTime
    --y = y + math.sin(orbitalAngle) * dt * orbitalTime
    return OrbitalObj
end


