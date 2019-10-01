-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- print ("asdfasdf")
local a= 40
if a<20 then
  -- print ("chico")
elseif a >= 21 then
  -- print("grande")
end

local mi_variable = 50
-- print ( mi_variable)

function sumador (a,b)
  mi_variable= a+b
  return a+b
end
-- print (sumador(2,3))


function distancia (ax, ay,bx,by)
  return math.sqrt((math.pow(ax-bx,2)+ (math.pow(ay-by,2)) ))
end

print (distancia(4,4,4,2))
print ("aaaaaaaaaaaa")
