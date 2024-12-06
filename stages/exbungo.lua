function onCreate()

	makeLuaSprite('pink2', 'backgrounds/void/exbongo/Exbongo', -2000, -1000)
    addLuaSprite('pink2')
	scaleObject('pink2', 2, 2)
	setProperty('pink2.visible', true)
	setScrollFactor('pink2', 0.5, 0.5);

	makeLuaSprite('home', 'backgrounds/void/exbongo/Place', 300, 0)
	scaleObject('home', 1, 1)
	addLuaSprite('home', false)

	makeLuaSprite('circle', 'backgrounds/void/exbongo/Circle', -300, 700)
	scaleObject('circle', 1, 1)
	addLuaSprite('circle', false)
end

function onBeatHit()--for every beat
	-- body
end

function onStepHit( ... )--for every step
	-- body
end

function onUpdate() -- for every frame
	songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/180)
	local currentBeat2 = (songPos/1000)*(bpm/180)
    doTweenY('dadTweenY', 'dad', 0 - 80*math.sin((currentBeat*0.25)*math.pi),0.001)
	doTweenY('dadTweenA', 'home', 100 - 180*math.sin((currentBeat2*0.25)*math.pi),0.001)
end
