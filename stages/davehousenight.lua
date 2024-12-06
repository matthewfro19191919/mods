function onCreate()

	makeLuaSprite('sky','backgrounds/shared/sky_night',-700, -50)
	addLuaSprite('sky',false)
	setScrollFactor('sky', 0.5, 0.5);

	makeLuaSprite('hills','backgrounds/dave-house/hills',-800, 145)
	addLuaSprite('hills',false)
	setScrollFactor('hills', 0.7, 0.7);

	makeLuaSprite('grass','backgrounds/dave-house/grass bg',-700, 650)
	addLuaSprite('grass',false)
	setScrollFactor('grass', 1, 1);

	makeLuaSprite('gate','backgrounds/dave-house/gate',-700, 570)
	addLuaSprite('gate',false)
	setScrollFactor('gate', 1, 1);

	makeLuaSprite('davebackground','backgrounds/dave-house/grass',-700, 800)
	addLuaSprite('davebackground',false)
	setScrollFactor('davebackground', 1, 1);

	makeLuaSprite('farmlandnightoverlay','splitathonoverlay',0,-600)
	setObjectCamera('farmlandnightoverlay', 'camHUD')
	setObjectOrder('farmlandnightoverlay', -990)
	addLuaSprite('farmlandnightoverlay',false)
	setProperty('farmlandnightoverlay.alpha', 0.5)

end

function onBeatHit()--for every beat
	--body
end

function onStepHit( ... )--for every step
	-- body
end

function onUpdate() -- for every frame
	-- body
end
