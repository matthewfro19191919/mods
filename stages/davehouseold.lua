local night = false

function onCreate()

	makeLuaSprite('sky2','old/sky_night',-200,-300)
	setScrollFactor('sky2', 0.5, 0.5)
	addLuaSprite('sky2',false)

	makeLuaSprite('overlay2', 'nightoverlay', 0, 0)
	setObjectCamera('overlay2', 'hud')
	setProperty('overlay2.alpha', 0)
	addLuaSprite('overlay2', false)

	makeLuaSprite('sky','old/sky',-200,-300)
	setScrollFactor('sky', 0.5, 0.5)
	addLuaSprite('sky',false)

	makeLuaSprite('hills', 'old/hills', -200, 100)
	scaleObject('hills', 1.2, 1.2)
	addLuaSprite('hills', false)

	makeLuaSprite('gate', 'old/gate', -200, 100)
	scaleObject('gate', 1.2, 1.2)
	addLuaSprite('gate', false)

	makeLuaSprite('grass', 'old/grass', -200, 150)
	scaleObject('grass', 1.2, 1.2)
	addLuaSprite('grass', false)

	setProperty('overlay2.alpha', 0)
	setProperty('sky2.alpha', 0)

	if songName == 'Glitch-old' then
		setProperty('overlay2.alpha', 1)
		setProperty('sky2.alpha', 1)
		setProperty('sky.alpha', 0)
	end
end

function onStepHit()
	if songName == 'Glitch-old' then
		if curStep == 480 then
			cameraShake("game", 0.005, 3)
		end
	end
end