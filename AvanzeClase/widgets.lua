

local widget=require 'widget'

local myButton= widget.newButton(
	{
		id='myButton',
		x= 200,
		y= 400,
		onRelease = onBackgroundTouch,
		defaultField = 'button.png',
		
		
		width = 100,
		heigh= 100,
		label= 'PLAY!',
		fontSize= 50,
		labelColor = {default={1,0,0}, over={0,1,0} }
	}
)