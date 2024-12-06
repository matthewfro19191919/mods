function onCreate()

	makeLuaSprite('sky','backgrounds/shared/sky_festival',-300, -50)
	scaleObject('sky', 1, 1)
	addLuaSprite('sky',false)
	setScrollFactor('sky', 0.5, 0.5);

	makeLuaSprite('sky2','backgrounds/shared/sky',-700, -50)
	addLuaSprite('sky2',false)
	setScrollFactor('sky2', 0.5, 0.5);
	setProperty('sky2.alpha', 0)

	makeLuaSprite('sky3','backgrounds/shared/sky_sunrise',-400, -50)
	setProperty('sky3.alpha', 0)
	addLuaSprite('sky3',false)
	setScrollFactor('sk3', 0.5, 0.5);

	makeLuaSprite('hills','backgrounds/backyard/hills',-800, 200)
	addLuaSprite('hills',false)
	setScrollFactor('hills', 0.7, 0.7);

	makeLuaSprite('gate','backgrounds/backyard/gates', 100, 370)
	addLuaSprite('gate',false)
	setScrollFactor('gate', 1, 1);

	makeLuaSprite('davebackground','backgrounds/backyard/supergrass',-1200, 800)
	addLuaSprite('davebackground',false)
	setScrollFactor('davebackground', 1, 1);

	makeLuaSprite('house','backgrounds/backyard/house',-800, 100)
	addLuaSprite('house',false)
	setScrollFactor('house', 1, 1);

	makeLuaSprite('overlay', 'redoverlay', 0, 0)
	setObjectCamera('overlay', 'hud')
	setProperty('overlay.alpha', 0.2)
	addLuaSprite('overlay', true)

	makeLuaSprite('overlay2', 'nightoverlay', 0, 0)
	setObjectCamera('overlay2', 'hud')
	setProperty('overlay2.alpha', 0.2)
	addLuaSprite('overlay2', true)

	makeLuaSprite('grill', 'backgrounds/backyard/grill', -300, 900)
	addLuaSprite('grill', true)

end

function onBeatHit()--for every beat
	if curBeat == 384 then
		doTweenAlpha('sky', 'sky', 0, 10, 'linear')
		doTweenAlpha('sky2', 'sky2', 1, 10, 'linear')
		doTweenAlpha('sky3', 'sky3', 0, 10, 'linear')
		doTweenAlpha('overlay', 'overlay', 0, 10, 'linear')
		doTweenAlpha('overlay2', 'overlay2', 0, 10, 'linear')
	end
end

function onSongStart()
	doTweenAlpha('hiOverlay', 'sky3', 1, 110, 'linear')
end

function onUpdate() -- for every frame
	if mustHitSection == true then
		setProperty('defaultCamZoom', 0.7)
	elseif mustHitSection == false then
		setProperty('defaultCamZoom', 0.9)
	end
end