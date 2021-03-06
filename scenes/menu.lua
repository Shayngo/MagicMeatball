local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
local utility = require( "scripts.utility" )
local ads = require( "ads" )

local params

local myData = require( "scripts.mydata" )

local xDisplay = display.contentWidth
local yDisplay = display.contentHeight

local meatBallSound = myData.splatSound

local buttonOptions =
    {
        channel = 3,
        loops = 0,
        duration = 30000,
        fadein = 0
    }
audio.setVolume( 0.1, { channel=3 } )


local function handlePlayButtonEvent( event )
    if ( "ended" == event.phase ) then
        audio.play( meatBallSound, buttonOptions )
        composer.removeScene( "scenes.game", false )
        composer.gotoScene("scenes.game", { effect = "crossFade", time = 333 })
    end
end

local function handleCreditsButtonEvent( event )

    if ( "ended" == event.phase ) then
        audio.play( meatBallSound, buttonOptions )
        composer.removeScene( "scenes.gamecredits", false )
        composer.gotoScene("scenes.gamecredits", { effect = "crossFade", time = 333 })
    end
end

local function handleEndHackButtonEvent( event )

    if ("ended" == event.phase ) then
        audio.play( meatBallSound, buttonOptions)
        composer.removeScene( "scenes.gameover", false )
        composer.gotoScene("scenes.gameover", { effect = "crossFade", time = 333 })
    end
end

--
-- Start the composer event handlers
--
function scene:create( event )
    local sceneGroup = self.view

    params = event.params

    local backBackground = display.newRect( xDisplay * .5, yDisplay * .5 , xDisplay, yDisplay )
    sceneGroup:insert( backBackground )

    local background = display.newImage( "menuScreen.png", xDisplay * .5, yDisplay * .5 , true)
    background.height = yDisplay * 1

    sceneGroup:insert( background )

    local title = display.newText("", xDisplay * .5 , yDisplay * .05, native.systemFontBold, yDisplay * .05 )
    title:setFillColor( 0 )
    sceneGroup:insert( title )

    local yDisplay = display.contentHeight
    local xDisplay = display.contentWidth

    local buttonWidth = xDisplay
    local buttonHeight = yDisplay * .15

    -- Create play button
    local playButton = widget.newButton({
        id = "button1",
        label = "",
        width = buttonWidth,
        height = buttonHeight,
        onEvent = handlePlayButtonEvent,
        fontSize = yDisplay * .1,
        defaultFile = "playButton.png",
        overFile = "playButton.png"
    })
    playButton.x = xDisplay * .5
    playButton.y = yDisplay * .075
    sceneGroup:insert( playButton )

    -- Create credits button
    local creditsButton = widget.newButton({
        id = "button4",
        label = "",
        width = buttonWidth,
        height = buttonHeight,
        onEvent = handleCreditsButtonEvent,
        fontSize = yDisplay * .1,
        defaultFile = "creditButton.png",
        overFile = "creditButton.png"
    })
    creditsButton.x = xDisplay / 2
    creditsButton.y = yDisplay * .075 + buttonHeight
    sceneGroup:insert( creditsButton )

    -- Create cheat button
    local endHackButton = widget.newButton({
        id = "button1",
        label = "",
        width = buttonWidth * .1,
        height = buttonHeight * .15,
        onEvent = handleEndHackButtonEvent,
        fontSize = yDisplay * .1
    })
    endHackButton.x = xDisplay * .01
    endHackButton.y = yDisplay * .99
    sceneGroup:insert( endHackButton )

    --Reference Drum loop sound
    drumLoop = myData.drumLoop

    audio.setVolume( 0.2, { channel=1 } )

    local options =
        {
            channel = 1,
            loops = -1,
            duration = 30000,
            fadein = 5000
        }
    audio.play( drumLoop , options )

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params
    utility.print_r(event)

    if params then
        print(params.someKey)
        print(params.someOtherKey)
    end

    if event.phase == "did" then
        composer.removeScene( "scenes.game" ) 
    end
end

function scene:hide( event )
    local sceneGroup = self.view

    audio.stop( 1 )
    
    if event.phase == "will" then
    end

end

function scene:destroy( event )
    audio.stop( 1 )
    local sceneGroup = self.view
    
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
return scene
