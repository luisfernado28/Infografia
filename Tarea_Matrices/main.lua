-----------------------------------------------------------------------------------------
--
-- main.lua
-- 6/10/2019 Luis Fernando Choque Arana Codigo=36267
-- 
-----------------------------------------------------------------------------------------

--local earth = display.newImageRect("earth.png",50,50)
--earth.x=100
--earth.y=125

--transition.to(earth, {x=200,y=225, time=1000})
--transition.to(earth, {x=100,y=25, time=1000})


local origenx,origeny=512,300

local contorno=display.newCircle( origenx, origeny, 200 )
contorno:setFillColor( 0.2)
contorno.strokeWidth = 10
contorno:setStrokeColor( 2, 0, 0 )

local minutero= display.newLine( origenx, origeny, 500, 505 )

local horero= display.newLine( origenx, origeny, 695, 195 )

local centro=display.newCircle( origenx, origeny, 20 )
centro:setFillColor( 0.8)
centro.strokeWidth = 2
centro:setStrokeColor( 1, 0, 0 )

local bird= display.newImage( "bird.png", 512,20 )
bird:scale(0.05,0.05)


local pendulo = display.newImage( "earth.png", 380,770 )
pendulo:scale( 0.05, 0.05 )

local hora= display.newText( "12" .. ":" ..  "35", 170, 900, native.systemFont, 130 )
hora:setTextColor(1,1,1)
