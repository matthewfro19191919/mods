function onCreate()
    makeLuaSprite('cheaterbackground', 'backgrounds/void/scarybg', -1800, -1800)
    addLuaSprite('cheaterbackground')
    addGlitchEffect('cheaterbackground',2,5,0.1)
	scaleObject('cheaterbackground', 4, 4)
	setScrollFactor('cheaterbackground', 0)
    setProperty('cheaterbackground.visible', false)
end

function onUpdate()
    if curStep == 48 or curStep == 320 then
        setProperty('camHUD.visible', false)
    end
    if curStep == 64 then
        setProperty('camHUD.visible', true)
    end
    if curStep == 88 or curStep == 216 then
        setProperty('cheaterbackground.visible', true)
    end
    if curStep == 96 or curStep == 224 then
        setProperty('cheaterbackground.visible', false)
    end
    if dadName == 'unfairbambi' then
        setProperty('dad.x', 300)
        setProperty('dad.y', 200)
    end
    if dadName == 'bambi' then
        setProperty('dad.x', 600)
        setProperty('dad.y', 500)
    end
end