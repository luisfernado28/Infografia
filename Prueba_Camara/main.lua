-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


local widget = require('widget')

local CW= display.contentWidth
local CH= display.contentHeight

display.setStatusBar(display.HiddenStatusBar)

local fondo, imagenComic, barraBaja, boton1, boton2
local grupo = display.newGroup()
local comicGroup = display.newGroup()
local estado=0


fondo = display.newRect(grupo, 0,0, CW,CH)
fondo.anchorX= 0
fondo.anchorY= 0
fondo:setFillColor(1)

grupo:insert(2, comicGroup)


imagenComic = display.newImageRect (comicGroup, "comic.png", CW*0.9,CH*0.9)
--imagenComic.x= CW/2
--imagenComic.Y= CH/2
local arregloEstados = {
	{x1= imagenComic.contentWidth, y1 = imagenComic.contentHeight},
	{x1=0,y1=imagenComic.contentHeight},
	{x1=imagenComic.contentWidth,y1=30},
	{x1=0,y1=30}
}

comicGroup.x=CW/2
comicGroup.y=CH/2

barraBaja = display.newRect(0, CH,CW,25)
barraBaja.anchorX = 0
barraBaja.anchorY = 1
barraBaja:setFillColor(0,0.22)

grupo:insert(3,barraBaja)

function moverCamara()
	if estado > 0 then
		local xOffset= imagenComic.contentHeight
		local yOffset= imagenComic.contentWidth
		print(xOffset,yOffset)
		transition.to (comicGroup, {xScale =2,  yScale=2,x=arregloEstados[estado].x1,y=arregloEstados[estado].y1})
	elseif estado==0 then
		transition.to(comicGroup, {xScale=1, yScale=1, x=CW/2,y=CH/2 })

	end
end

function siguientePagina()
	moverCamara()
	if(estado <4) then
		estado= estado+1
	end
end

function anteriorPagina()
	moverCamara()
	if(estado >0) then
		estado= estado-1
	end
end

boton1 = widget.newButton({
	width = 90,
	height = 80,
	label = "Siguiente",
	fontSize= 20,
	onRelease = siguientePagina,
	x=CW*0.75,
	y=CH*0.97
})


boton2 = widget.newButton({
	width = 90,
	height = 80,
	label = "Anterior",
	fontSize= 20,
	onRelease = anteriorPagina,
	x=CW*0.25,
	y=CH*0.97
})

grupo:insert(4, boton1)
grupo:insert(4, boton2)



