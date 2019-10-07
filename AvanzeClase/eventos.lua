
-- introduccion a eventos
local poligon=display.newPolygon(150,150, {0,0,90,90,60,180})
poligon:setFillColor(0.4)	
poligon.strokeWidth=1
poligon.xScale=3
poligon.yScale=3

poligon:translate(20,20)
function poligon:touch( event )
	if event.phase == "began" then
		print("coordenada Began en x =" .. event.x)
		print("coordenada Began en y =" .. event.y)
	elseif event.phase == "moved" then
		print("coordenada moved en x =" .. event.x)
		print("coordenada moved en y =" .. event.y)
	elseif event.phase =="ended" or event.phase == "cancelled" then
		self:setFillColor(math.random(0,255)/255, math.random(0,255)/255,  math.random(0,255)/255)
		self:translate(math.random(-20,50), math.random(-20,50))
	end
end

poligon:addEventListener("touch", listener)
