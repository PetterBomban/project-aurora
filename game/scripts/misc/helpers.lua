Helper = {}
Helper.__index = Helper

-- dumps the contents of a table in string format
-- http://stackoverflow.com/a/27028488
function Helper:DumpTable(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. Helper:DumpTable(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Recursively copies a table and its contents
-- http://lua-users.org/wiki/CopyTable
function Helper:DeepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[Helper:DeepCopy(orig_key)] = Helper:DeepCopy(orig_value)
        end
        setmetatable(copy, Helper:DeepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
