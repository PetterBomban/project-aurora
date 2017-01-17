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
