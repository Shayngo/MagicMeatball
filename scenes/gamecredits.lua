local composer = require( "composer" )
local scene = composer.newScene()

local widget = require( "widget" )
local utility = require( "scripts.utility" ) 

local params

local xDisplay = display.contentWidth
local yDisplay = display.contentHeight

local function handleButtonEvent( event )

    if ( "ended" == event.phase ) then
        composer.removeScene( "scenes.menu", false )
        composer.gotoScene("scenes.menu", { effect = "crossFade", time = 333 })
    end
end

--
-- Start the composer event handlers
--
function scene:create( event )
    local sceneGroup = self.view

    params = event.params
        
    --
    -- setup a page background, really not that important though composer
    -- crashes out if there isn't a display object in the view.
    --
    local backBackground = display.newRect( xDisplay * .5, yDisplay * .5 , xDisplay, yDisplay )
    sceneGroup:insert( backBackground )


    local title = display.newText( "Magic Meatball", 100, 64, "NoodleScript", yDisplay * .075)
    title.x = display.contentCenterX
    title.y = display.contentHeight * .15
    title:setFillColor( 0 )
    sceneGroup:insert( title )

    local creditText = display.newText( "A game by:", 250, 250, native.systemFont,  yDisplay * .05 )
    creditText:setFillColor( 0 )
    creditText.x = display.contentCenterX
    creditText.y = display.contentHeight * .35
    sceneGroup:insert(creditText)

    local creditText = display.newText( "Natasha Matthews and", 250, 250, native.systemFont, yDisplay * .05 )
    creditText:setFillColor( 0 )
    creditText.x = display.contentCenterX
    creditText.y = display.contentHeight * .45
    sceneGroup:insert(creditText)

    local creditText = display.newText( "Garrett Luecke", 250, 250, native.systemFont,  yDisplay * .05 )
    creditText:setFillColor( 0 )
    creditText.x = display.contentCenterX
    creditText.y = display.contentHeight * .55
    sceneGroup:insert(creditText)

    -- local stlText = display.newText( "Made in STL", 250, 250, native.systemFont,  yDisplay * .05 )
    -- stlText:setFillColor( 0 )
    -- stlText.x = display.contentCenterX
    -- stlText.y = display.contentHeight * .65
    -- sceneGroup:insert(stlText)

    local stlLogo = display.newImage( "ggj2016_logo.png", xDisplay * .5, yDisplay * .7 )
    sceneGroup:insert( stlLogo )

    -- http://www.freesfx.co.uk
    -- http://www.freesound.org

    local doneButton = widget.newButton({
        id = "button1",
        label = "Back",
        width = xDisplay,
        height = yDisplay * .15,
        onEvent = handleButtonEvent,
        fontSize = yDisplay * .075,
        font = "NoodleScript"
    })
    doneButton.x = display.contentCenterX
    doneButton.y = display.contentHeight * .9
    sceneGroup:insert( doneButton )

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params

    if event.phase == "did" then
    end
end

function scene:hide( event )
    local sceneGroup = self.view
    
    if event.phase == "will" then
    end

end

function scene:destroy( event )
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
