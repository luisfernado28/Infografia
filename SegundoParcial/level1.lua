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

function scene:create( event )

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.

	local sceneGroup = self.view

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
	background:setFillColor( .8 )
	
	-- make a crate (off-screen), position it, and rotate slightly
	local crate = display.newImageRect( "crate.png", 90, 90 )
	crate.x, crate.y = 160, -100
	crate.rotation = 15
	
	-- add physics to the crate
	physics.addBody( crate, { density=1.0, friction=0.3, bounce=0.3 } )
	
	
	-- create a grass object and add physics (with custom shape)
	local bottomMargin = display.newImageRect( "grass.png", screenW, 40 )
	bottomMargin.anchorX = 0
	bottomMargin.anchorY = 1
	--  draw the grass at the very bottom of the screen
	bottomMargin.x, bottomMargin.y = display.screenOriginX, display.actualContentHeight + display.screenOriginY
	
	-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	local marginShape = { -halfW,-20, halfW,-20, halfW,20, -halfW,20 }
	
	physics.addBody(bottomMargin, "static", { friction=0.3, shape=marginShape} )

	
	local topMargin = display.newImageRect( "grass.png", screenW, 40 )
	topMargin.anchorX = 0
	topMargin.anchorY = 1
	--  draw the grass at the very bottom of the screen
	topMargin.x, topMargin.y = 0, 30
	
	-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	local marginShape = { -halfW,-20, halfW,-20, halfW,20, -halfW,20 }
	physics.addBody(topMargin, "static", { friction=0.3, shape=marginShape} )
	
	--MARGIN

	--local rightMarginT = display.newImageRect( "grass.png", 50, 300 )
	--rightMarginT.anchorX = 0
	--rightMarginT.anchorY = 1
	--  draw the grass at the very bottom of the screen
	--rightMarginT.x, rightMarginT.y =550, 300
	
	-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	--local marginShape = { -25,-150, -25,150, 25, 150,25,-150 }
	--physics.addBody(rightMarginT, "static", { friction=0.3, shape=marginShape} )
	

	--Ball
	local ball = display.newImageRect( "Ball.png", 20, 20 )
	ball.anchorX = 0
	ball.anchorY = 1
	ball.x, ball.y =300, 400
	
	local marginShape = { -10,-10, -10,10, 10, 10,10,-10 }
	physics.addBody(ball, { friction=3, shape=marginShape} )


	--Player 1
	local player1 = display.newImageRect( "Barra.png", 100, 250 )
	player1.anchorX = 0
	player1.anchorY = 1
	player1.x, player1.y =500, 300
	
	local marginShape = { -10,-50, -10,75, 5, 75,5,-50 }
	physics.addBody(player1, "static", { friction=0.3, shape=marginShape} )

	--Player 2
	local player2 = display.newImageRect( "Barra.png", 100, 250 )
	player2.anchorX = 0
	player2.anchorY = 1
	player2.x, player2.y =0, 500
	
	local marginShape = { -10,-50, -10,75, 5, 75,5,-50 }
	physics.addBody(player2, "static", { friction=0.3, shape=marginShape} )


	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	sceneGroup:insert( bottomMargin)
	sceneGroup:insert( topMargin)
	sceneGroup:insert( player1)
	sceneGroup:insert( player2)
	sceneGroup:insert( ball)
	--sceneGroup:insert( rightMarginT)
	sceneGroup:insert( crate )
end


function scene:show( event )
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
		physics.setDrawMode("hybrid")
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

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene