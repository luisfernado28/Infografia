-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"

--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.actualContentWidth, display.actualContentHeight, display.contentCenterX
local crate,sceneGroup
local grupoN
function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	sceneGroup = self.view
	grupoN= display.newGroup( )
	-- We need physics started to add bodies, but we don't want the simulaton
	-- running until the scene is on the screen.
	physics.start()
	physics.pause()


	-- create a grey rectangle as the backdrop
	-- the physical screen will likely be a different shape than our defined content area
	-- since we are going to position the background from it's top, left corner, draw the
	-- background at the real top, left corner.
	local background = display.newRect( display.screenOriginX, display.screenOriginY, screenW, screenH )
	background.anchorX = 0 
	background.anchorY = 0
	background:setFillColor( .5 )
	
	-- make a crate (off-screen), position it, and rotate slightly
	crate = display.newImageRect( "crate.png", 40, 40 )
	crate.x, crate.y = 150, 100
	crate.rotation = 15
	
	-- add physics to the crate
	physics.addBody( crate, { density=1.0, friction=0.3, bounce=0.8 } )
	
	-- create a grass object and add physics (with custom shape)
	local grass = display.newImageRect( "grass.png", screenW, 82 )
	grass.anchorX = 0
	grass.anchorY = 1
	--  draw the grass at the very bottom of the screen
	grass.x, grass.y = display.screenOriginX, display.actualContentHeight + display.screenOriginY
	
	-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	local grassShape = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }
	physics.addBody( grass, "static", { friction=0.3, shape=grassShape } )
	
	-- create a grass object and add physics (with custom shape)
	local grassTop = display.newImageRect( "grass.png", screenW, 82 )
	grassTop.anchorX = 0
	grassTop.anchorY = 1
	--  draw the grass at the very bottom of the screen
	grassTop.x, grassTop.y = display.screenOriginX, 10
	
	-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	local grassShape = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }
	physics.addBody( grassTop, "static", { friction=0.3 } )
	

	-- create a grass object and add physics (with custom shape)
	local grassLeft = display.newImageRect( "grass.png", 40, screenH)
	grassLeft.anchorX = 0
	grassLeft.anchorY = 1
	--  draw the grass at the very bottom of the screen
	grassLeft.x, grassLeft.y = display.screenOriginX, display.actualContentHeight + display.screenOriginY
	
	-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	local grassShape2 = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }
	physics.addBody( grassLeft, "static", { friction=0.3 } )
	
	-- create a grass object and add physics (with custom shape)
	local grassRight = display.newImageRect( "grass.png", 40, screenH)
	grassRight.anchorX = 0
	grassRight.anchorY = 1
	--  draw the grass at the very bottom of the screen
	grassRight.x, grassRight.y = display.screenOriginX+330, display.actualContentHeight + display.screenOriginY
	
	local grassShape2 = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }
	physics.addBody( grassRight, "static", { friction=0.3 } )



	sceneGroup:insert( background )
	sceneGroup:insert(  grupoN  )
	sceneGroup:insert(grass)
	sceneGroup:insert( grassLeft)
	sceneGroup:insert( grassRight)
	sceneGroup:insert( crate )
end

function movercamara()
	grupoN.x = crate.x
	sceneGroup.x = -grupoN.x
end

function scene:show( event )
	--physics.setDrawMode("debug")
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		physics.start()
		physics.setGravity(8,2)
		--Runtime:addEventListener('enterFrame',movercamara)
		--	timer.performWithDelay(1000,spawnear,100)
	end
end

function scene:hide( event )
	local sceneGroup = self.view
	
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		physics.stop()
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
	
end

function scene:destroy( event )

	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

function spawnear()
	local myCircle = display.newCircle( 100, 100, 30 )
	physics.addBody(myCircle, { friction=0.7, radius=30 } )
end

function sceneGroup:touch(event)
	local phase = event.phase

	if phase== "began" then

	elseif phase =="ended"  and phase =="cancelled" then
		crate:applyLinearImpulse(10, 40, crate.x, crate.y )
	end
end
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
scene:addEventListener( "touch", sceneGroup )
-----------------------------------------------------------------------------------------

return scene