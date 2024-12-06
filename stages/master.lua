function onCreate()
	makeLuaSprite('pink2', 'backgrounds/shared/sky_space', -1724, -971)
    addLuaSprite('pink2')
    --addGlitchEffect('pink2',2,5,0.1)
	scaleObject('pink2', 4, 4)
	setProperty('pink2.visible', true)
	setLuaSpriteScrollFactor('pink2', 0.5, 0.5);

	makeLuaSprite('ground', 'backgrounds/dave-house/land',  675, 799)
	addLuaSprite('ground')
	scaleObject('ground', 1.2, 1.2)

end

function onBeatHit()--for every beat
	if curBeat == 140 then
		playSound('dead')
	end
end

function onUpdate(elapsed)
	if mustHitSection then
		setProperty('defaultCamZoom', 0.5)
	else
		setProperty('defaultCamZoom', 0.7)
	end
end

function onStepHit( ... )--for every step
	-- body
end

function onUpdate() -- for every frame
	--body
end
