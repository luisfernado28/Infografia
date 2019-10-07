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

local linea = display.newLine(20,10,40,30)
linea:append(150, 200,100,200,40,10,20,10)
-- local caudrado = display.newRect(150,150,30,40)
local poligon = display.newPolygon(0,0,{0,0,150,150,40,180})
poligon:setFillColor(0.4)

local poligon2 = display.newPolygon(150,150,{0,0,150,150,40,180})
poligon:setFillColor(1,0,0)

local cuadrado = display.newRect(0,200,80,80)
cuadrado:setFillColor(0,0,1)
cuadrado.anchorX = 0
cuadrado.anchorY = 0

local poligon4 = display.newPolygon(150,150,{0,0,30,30,20,60})
poligon4:setFillColor(0.4)
poligon4.XScale= 3
poligon4.YScale= 3
poligon4.strokeWidth = 1
