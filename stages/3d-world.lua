function onCreate()

	makeLuaSprite('pink2', 'backgrounds/void/redsky', -1500, -500)
    addLuaSprite('pink2')
	scaleObject('pink2', 1.2, 1.2)
	setProperty('pink2.visible', true)
	setScrollFactor('pink2', 0, 0);

end

function onUpdate() -- for every frame
	songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/180)
    doTweenY('dadTweenY', 'dad', 200 - 80*math.sin((currentBeat*0.25)*math.pi),0.001)
end
