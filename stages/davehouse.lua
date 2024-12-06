function onCreate()
	--day
	makeLuaSprite('sky','backgrounds/shared/sky',-700, -50)
	addLuaSprite('sky',false)
	setScrollFactor('sky', 0.5, 0.5);
	--evening
	makeLuaSprite('sky1','backgrounds/shared/sky_sunset',-700, -50)
	addLuaSprite('sky1',false)
	setScrollFactor('sky1', 0.5, 0.5);

	makeLuaSprite('overlay', 'redoverlay', 0, 0)
	setObjectCamera('overlay', 'hud')
	setProperty('overlay.alpha', 0.2)
	addLuaSprite('overlay', false)
	--night
	makeLuaSprite('sky2','backgrounds/shared/sky_night',-700, -50)
	addLuaSprite('sky2',false)
	setScrollFactor('sky2', 0.5, 0.5);

	makeLuaSprite('overlay1','splitathonoverlay',-200,-1600)
	addLuaSprite('overlay1',false)
	scaleObject('overlay1', 3, 3)
	--morning
	makeLuaSprite('sky3','backgrounds/shared/sky_sunrise',-700, -50)
	addLuaSprite('sky3',false)
	setScrollFactor('sk3', 0.5, 0.5);

	makeLuaSprite('overlay2', 'redoverlay', 0, 0)
	setObjectCamera('overlay2', 'hud')
	setProperty('overlay2.alpha', 0.2)
	addLuaSprite('overlay2', false)
	--space??
	makeLuaSprite('galaxy', 'backgrounds/shared/sky_space', -1500, -500)
    addLuaSprite('galaxy')
    addGlitchEffect('galaxy',2,5,0.1)
	scaleObject('galaxy', 1.2, 1.2)
	setProperty('galaxy.visible', true)
	setScrollFactor('galaxy', 0, 0);

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

	makeLuaSprite('redskyPink', 'backgrounds/void/redsky_insanity', -2000, -1000)
    addLuaSprite('redskyPink')
	scaleObject('redskyPink', 2, 2.3)
	setProperty('redskyPink.visible', false)
	setScrollFactor('redskyPink', 0.5, 0.5);

	makeLuaSprite('3dBG', 'backgrounds/void/redsky', -900, -300)
    addLuaSprite('3dBG')
	scaleObject('3dBG', 1.1, 1.1)
	setProperty('3dBG.visible', false)
	setScrollFactor('3dBG', 0.5, 0.5);

	setProperty('sky1.alpha', 0)
	setProperty('sky2.alpha', 0)
	setProperty('sky3.alpha', 0)
	setProperty('galaxy.alpha', 0)

	setProperty('overlay.alpha', 0)
	setProperty('overlay1.alpha', 0)
	setProperty('overlay2.alpha', 0)

	if songName == 'Polygonized' then
		setProperty('3dBG.visible', true)
		setProperty('defaultCamZoom',0.7)
	end
	if songName == 'Adventure' then
		setProperty('sky1.alpha', 1)
	end
	if songName == 'Glitch' then
		setProperty('sky2.alpha', 1)
		setProperty('overlay1.alpha', 1)
	end
end
	
function onBeatHit()--for every beat
	if songName == 'Insanity' then
		if curBeat == 165 or curBeat == 170 then
			setProperty('redskyPink.visible', true)
		end
		if curBeat == 166 or curBeat == 171 then
			setProperty('redskyPink.visible', false)
		end
		if curBeat == 292 then
			setProperty('redskyPink.visible', true)
		end
	end
end

function onStepHit()
	if songName == 'Supernovae' then
		if curStep == 1024 then
			cameraShake("game", 0.005, 24)
			doTweenY('byeDad', 'dad', 300, 6, 'linear')
		end
		if curStep == 1280 then
			doTweenY('hiDad', 'dad', 650, 0.30, 'linear')
		end
	end
	if songName == 'Glitch' then
		if curStep == 132 or curStep == 612 or curStep == 772 or curStep == 836 then
			cameraShake("game", 0.005, 1.64)
		end
		if curStep == 464 then
			doTweenY('byeDad', 'dad', 300, 20.18, 'linear')
		end
		if curStep == 740 then
			cameraShake("game", 0.005, 2.46)
		end
		if curStep == 1232 then
			doTweenY('hiDad', 'dad', 650, 0.30, 'linear')
		end
	end
end

function onUpdate() -- for every frame
	if songName == 'Warmup' then
		if mustHitSection then
			setProperty('defaultCamZoom', 1)
		else
			setProperty('defaultCamZoom', 1.2)
		end
	end
	if songName == 'Polygonized' then
		if curBeat == 256 then
			cameraShake("game", 0.005, 10.67)
		end
		if curBeat == 328 then
			cameraShake("game", 0.005, 8)
		end
		if curBeat == 608 then
			setProperty('3dBG.alpha', 0)
			--doTweenAlpha('byeThing', '3dBG', 0, 1, 'linear')
		end
	end
end
