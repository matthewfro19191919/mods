function onCreate()

	makeLuaSprite('sky','backgrounds/shared/sky', -300,-150)
	addLuaSprite('sky',false)
	scaleObject('sky', 1, 1)
	setScrollFactor('sky', 0.4, 0.4);

	makeLuaSprite('sky2','backgrounds/shared/sky_sunset', -300,-150)
	addLuaSprite('sky2',false)
	scaleObject('sky2', 1, 1)
	setScrollFactor('sky2', 0.4, 0.4);
	setProperty('sky2.alpha', 0)

	makeLuaSprite('sky3','backgrounds/shared/sky_night', -300,-150)
	addLuaSprite('sky3',false)
	scaleObject('sky3', 1, 1)
	setScrollFactor('sky3', 0.4, 0.4);
	setProperty('sky3.alpha', 0)

	makeLuaSprite('overlay1','redoverlay',0,-600)
	setProperty('overlay1.alpha', 0)
	addLuaSprite('overlay1',false)
	setObjectCamera('overlay1', 'hud')
	scaleObject('overlay1', 1, 1)

	makeLuaSprite('overlay2','splitathonoverlay',-200,-1600)
	addLuaSprite('overlay2',true)
	setProperty('overlay2.alpha', 0)
	scaleObject('overlay2', 3, 3)

	makeLuaSprite('house','backgrounds/farm/gm_flatgrass', 400,50)
	addLuaSprite('house',false)
	scaleObject('house', 0.5, 0.5)
	setScrollFactor('house', 0.6, 0.6);

	makeLuaSprite('bald','backgrounds/farm/baldo', 500, 70)
	addLuaSprite('bald',false)
	scaleObject('bald', 0.5, 0.5)
	setScrollFactor('bald', 0.6, 0.6);
	setProperty('bald.alpha', 0)

	makeLuaSprite('hills','backgrounds/farm/orangey hills', 0, 130)
	addLuaSprite('hills',false)
	setScrollFactor('hills', 0.8, 0.8);

	makeLuaSprite('farm','backgrounds/farm/funfarmhouse', 400,150)
	addLuaSprite('farm',false)
	setScrollFactor('farm', 0.8, 0.8);

	makeLuaSprite('farmlandbackground','backgrounds/farm/grass lands',-320, 470)
	addLuaSprite('farmlandbackground',false)

	makeLuaSprite('fence1','backgrounds/farm/cornFence', -150,170)
	addLuaSprite('fence1',false)

	makeLuaSprite('fence2','backgrounds/farm/cornFence2', 1400,170)
	addLuaSprite('fence2',false)

	makeLuaSprite('sign','backgrounds/farm/sign', 240, 320)
	addLuaSprite('sign',false)

	makeLuaSprite('corn','backgrounds/farm/cornbag',1500, 520)
	addLuaSprite('corn',false)
end

function onStepHit()
	if songName == 'badcorn' then
		if curStep == 272 then
			setProperty('sky2.alpha', 1)
			setProperty('overlay1.alpha', 0.3)
		end
		if curStep == 528 then
			setProperty('sky3.alpha', 1)
			setProperty('overlay2.alpha', 1)
			setProperty('overlay1.alpha', 0)
		end
	end
end