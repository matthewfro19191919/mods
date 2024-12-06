function onCreate()

	makeLuaSprite('sky','backgrounds/rapBattle',-800, 50)
	addLuaSprite('sky',false)
	setLuaSpriteScrollFactor('sky', 1, 1);

end

function onBeatHit()--for every beat
	-- body
end

function onStepHit( ... )--for every step
	-- body
end

function onUpdate() -- for every frame
	-- body
end