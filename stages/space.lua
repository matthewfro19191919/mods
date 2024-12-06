function onCreate()

	makeLuaSprite('pink2', 'backgrounds/shared/sky_space', -1500, -800)
    addLuaSprite('pink2')
    addGlitchEffect('pink2',2,5,0.1)
	scaleObject('pink2', 4, 4)
	setProperty('pink2.visible', true)
	setLuaSpriteScrollFactor('pink2', 0.5, 0.5);

end

function onBeatHit()--for every beat
	-- body
end

function onStepHit( ... )--for every step
	-- body
end

function onUpdate() -- for every frame
	--body
end