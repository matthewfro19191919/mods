function onCreate()

	makeLuaSprite('sky','backgrounds/shared/sky_night', -300,-150)
	addLuaSprite('sky',false)
	scaleObject('sky', 1, 1)
	setScrollFactor('sky', 0.4, 0.4);

	makeLuaSprite('house','backgrounds/farm/gm_flatgrass', 400,50)
	addLuaSprite('house',false)
	scaleObject('house', 0.5, 0.5)
	setScrollFactor('house', 0.6, 0.6);

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

	makeLuaSprite('bald','backgrounds/farm/picnic_towel_thing', 1400, 570)
	addLuaSprite('bald',false)
	scaleObject('bald', 1, 1)
	setScrollFactor('bald', 1, 1);

	makeLuaSprite('corn','backgrounds/farm/cornbag',1500, 520)
	addLuaSprite('corn',false)

	makeLuaSprite('farmlandnightoverlay','splitathonoverlay',-200,-1600)
	addLuaSprite('farmlandnightoverlay',true)

	scaleObject('farmlandnightoverlay', 3, 3)

	makeAnimatedLuaSprite('s&p', 'splitathon/Splitathon_Dave', 200, 250);
	addAnimationByPrefix('s&p', 's&p', 'bruh', 24, true);
	setScrollFactor('s&p', 1, 1);
	addLuaSprite('s&p', false)
	setProperty('s&p.visible', false);

	makeAnimatedLuaSprite('s&p3', 'splitathon/Splitathon_Dave', 200, 250);
	addAnimationByPrefix('s&p3', 's&p3', 'happy', 24, true);
	setScrollFactor('s&p3', 1, 1);
	addLuaSprite('s&p3', false)
	setProperty('s&p3.visible', false);

	makeAnimatedLuaSprite('s&p2', 'splitathon/Splitathon_Bambi', 200, 500);
	addAnimationByPrefix('s&p2', 's&p2', 'splitathon idle 2', 24, true);
	setScrollFactor('s&p2', 1, 1);
	addLuaSprite('s&p2', false)
	setProperty('s&p2.visible', false);

	makeAnimatedLuaSprite('s&p4', 'splitathon/Splitathon_Bambi', 200, 500);
	addAnimationByPrefix('s&p4', 's&p4', 'splitathon corn', 24, true);
	setScrollFactor('s&p4', 1, 1);
	addLuaSprite('s&p4', false)
	setProperty('s&p4.visible', false);

end

function onBeatHit( ... )--for every beat
	if curBeat == 1200 then
		setProperty('s&p.visible', true);
	end
	   if curBeat == 1456 then
		setProperty('s&p.visible', false);
		setProperty('s&p2.visible', true);
	end
	   if curBeat == 1584 then
		setProperty('s&p2.visible', false);
		setProperty('s&p3.visible', true);
	end
	   if curBeat == 2096 then
		setProperty('s&p3.visible', false);
		setProperty('s&p4.visible', true);
	end
end

function onStepHit( ... )--for every step
	-- body
end

function onUpdate( ... )
	-- body
end