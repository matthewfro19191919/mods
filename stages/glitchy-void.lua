function onCreate()

	makeLuaSprite('unfairBG', 'backgrounds/void/scarybg', -1000, -600)
    addLuaSprite('unfairBG')
    addGlitchEffect('unfairBG',2,5,0.1)
	scaleObject('unfairBG', 3, 3)
	setScrollFactor('unfairBG', 0, 0)

end

function opponentNoteHit()
    setProperty('health', getProperty('health') - 0.005)
end

function onUpdate()
	floatD = floatD + 25
	dadY = getProperty('dad.y')
	setProperty('dad.y',  dadY + math.sin(floatD))
end