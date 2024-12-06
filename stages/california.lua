--This song was a pain in the ass to port. Mostly because of the shaders and stuff
--If you use this, please credit me (Aka: Moonlight)
--Made By Moonlight_Catalyst ( Extra Credits :3 )
local intensity = 1
local intensityStart = 0
local intensityIncrease = 0
local intensityMax = false
local shaderName = 'california/scroll'
function onCreate()
	--Base Song Sprites
	initLuaShader(shaderName)

    makeLuaSprite('sky','backgrounds/shared/sky',-1200, -350)
	scaleObject("sky", 1.3, 1.3)
	addLuaSprite('sky',false)
	setScrollFactor('sky', 0.5, 0.5);

	makeLuaSprite('nightsky','backgrounds/shared/sky_night',-1000, -450)
	setProperty('nightsky.antialiasing', false)
	scaleObject('nightsky', 1.3, 1.3)
	addLuaSprite('nightsky',false)
	setProperty('nightsky.alpha', 0)
	setScrollFactor('nightsky', 0.5, 0.5);

	makeLuaSprite('sunRiseSky','backgrounds/shared/sky_sunrise',-1000, -450)
	setProperty('sunRiseSky.antialiasing', false)
	scaleObject('sunRiseSky', 1.3, 1.3)
	addLuaSprite('sunRiseSky',false)
	setProperty('sunRiseSky.alpha', 0)
	setScrollFactor('sunRiseSky', 0.5, 0.5);

	makeLuaSprite('ground', 'backgrounds/wedcape_from_cali_backlground', -1300, -400)
	scaleObject("ground", 1.2, 1.2)
	addLuaSprite('ground', false)
	setProperty("ground.alpha", 1)

	makeLuaSprite('sign1', 'california/leavingCalifornia', 400, 550)
	setScrollFactor('sign1', 1, 1);
	scaleObject('sign1', 1, 1)
	addLuaSprite('sign1', false)

	makeLuaSprite('sign2', 'california/1500miles', 1900, 550)
	setScrollFactor('sign2', 1, 1);
	scaleObject('sign2', 1, 1.1)
	addLuaSprite('sign2', false)

	makeLuaSprite('sign3', 'california/1000miles', 1900, 550)
	setScrollFactor('sign3', 1, 1);
	scaleObject('sign3', 1, 1.1)
	addLuaSprite('sign3', false)

	makeLuaSprite('sign4', 'california/500miles', 1900, 550)
	setScrollFactor('sign4', 1, 1);
	scaleObject('sign4', 1, 1.1)
	addLuaSprite('sign4', false)

	makeAnimatedLuaSprite('train', 'california/train', -800, 500)
	addAnimationByPrefix('train', 'idle', 'trainRide', 24, true)
	addAnimationByPrefix('train', 'stopped', 'trainRide0000', 24, true)
	setScrollFactor('train', 1, 1)
	scaleObject('train', 2.5, 2.5)
	playAnim('train', 'idle', true)
	addLuaSprite('train', false)
	--Events and Overlays

	makeLuaSprite('white', 'white', 0, 0)
	setProperty("white.alpha", 0)
	setObjectCamera("white", "hud")
	addLuaSprite('white', false)

	makeLuaSprite('overlay1', 'redoverlay', 0, 0)
	setObjectCamera('overlay1', 'hud')
	setProperty('overlay1.alpha', 0)
	addLuaSprite('overlay1', true)

	makeLuaSprite('overlay2', 'nightoverlay', 0, 0)
	setObjectCamera('overlay2', 'hud')
	setProperty('overlay2.alpha', 0)
	addLuaSprite('overlay2', true)

	setSpriteShader('ground', shaderName)
	--End of song stuff

	makeLuaSprite('Gground', 'california/geor gea', 3300, -100)
	scaleObject("Gground", 3, 3)
	addLuaSprite('Gground', false)
	setProperty("Gground.alpha", 1)

	makeLuaSprite('georgiaSign', 'california/welcomeToGeorgia', 2300, 300)
	setScrollFactor('georgiaSign', 1, 1);
	scaleObject('georgiaSign', 1, 1.1)
	addLuaSprite('georgiaSign', false)
	setObjectOrder('georgiaSign', 11)

end

function onUpdate(elapsed)

	if curStep == 1 then
		doTweenX('leftScroll', 'ground', -2300, 1, 'sineIn')
		doTweenX('leftScroll2', 'sign1', -2300, 1.45, 'sineIn')
	end

--	if curStep >= 12 and curStep <= 16 and not intensityMax then
--		intensityIncrease = intensityIncrease + 0.01
--		setShaderFloat('ground', 'iTime', intensityIncrease)
--	end
	if curStep == 16 then
		doTweenX('rightScroll', 'ground', -1300, 0.0001, 'linear')
	end
	if intensityIncrease == 100 and not intensityMax then
		intensityMax = true
	end
	if curStep >= 16 and curStep <= 99999999 then
		setShaderFloat('ground', 'iTime', os.clock())
	end
	if curStep == 64 then
		doTweenAlpha('overlayStuff', 'overlay1', 0.3, 30, 'linear')
		doTweenAlpha('skyStuff', 'sunRiseSky', 1, 60, 'linear')
	end
	if curStep == 832 then
		doTweenAlpha('skyStuff2', 'nightsky', 1, 20, 'linear')
		doTweenAlpha('overlayStuff', 'overlay2', 0.5, 20, 'linear')
		doTweenAlpha('byeSkyStuff', 'sunRiseSky', 0, 20, 'linear')
		doTweenAlpha('overlayStuff1', 'overlay1', 0, 20, 'linear')
		doTweenX('gettingCloser', 'sign2', -2300, 1.30, 'linear')
	end
	if curStep == 1600 then
		doTweenX('evenCloser', 'sign3', -2300, 1.30, 'linear')
	end
	if curStep == 2112 then
		doTweenX('almostThere', 'sign4', -2300, 1.30, 'linear')
	end
	if curStep == 2880 then
		georgia()
	end
end

function scream()
	doTweenAlpha('a', 'white', 1, 0.50, 'linear')
	cameraShake('camGame', 0.005, 1)
	runTimer('stopScreaming', 1)
end

function georgia()
	setProperty('ground.alpha', 0)
	setObjectOrder('train', 12)
	doTweenX('ground', 'Gground', -1300, 2, 'sineOut')
	doTweenX('sign', 'georgiaSign', -300, 2, 'sineOut')
	playAnim('train', 'stopped', true)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'stopScreaming' then
		doTweenAlpha('bye', 'white', 0, 1, 'linear')
	end
end

function onStepHit()
	if curStep == 64 then
		setProperty("ground.alpha", 1)
		setProperty("ground2.alpha", 0)
	end
	if curStep == 56 or curStep == 1080 then
		scream()
	end
end

function onCreatePost()
	luaDebugMode = true;
	addHaxeLibrary('FlxEase', 'flixel.tweens');
    addHaxeLibrary('FlxTween', 'flixel.tweens');
    addHaxeLibrary('FlxMath', 'flixel.math');
    addHaxeLibrary('Math');
    addHaxeLibrary('ClientPrefs');
	addHaxeLibrary('FlxSprite');
	setProperty('gf.visible', false)

	runHaxeCode([[

		setVar('bg', FlxSprite);
        setVar('sunsetBG', FlxSprite);
        setVar('nightBG', FlxSprite);
        setVar('desertBG', FlxSprite);
        setVar('desertBG2', FlxSprite);
        setVar('sign', FlxSprite);
		setVar('train', FlxSprite);

		var bg:BGSprite = new BGSprite('bg', -900, -400, Paths.image('backgrounds/shared/sky'), null, 0.2, 0.2);
		bg.setGraphicSize(Std.int(bg.width * 2));
		bg.updateHitbox();
		sprites.add(bg);
		add(bg);

		var sunsetBG:BGSprite = new BGSprite('sunsetBG', -900, -400, Paths.image('backgrounds/shared/sky_sunset'), null, 0.2, 0.2);
		sunsetBG.setGraphicSize(Std.int(sunsetBG.width * 2));
		sunsetBG.updateHitbox();
		sunsetBG.alpha = 0;
		sprites.add(sunsetBG);
		add(sunsetBG);
				
		var nightBG:BGSprite = new BGSprite('nightBG', -900, -400, Paths.image('backgrounds/shared/sky_night'), null, 0.2, 0.2);
		nightBG.setGraphicSize(Std.int(nightBG.width * 2));
		nightBG.updateHitbox();
		nightBG.alpha = 0;
		sprites.add(nightBG);
		add(nightBG);
				
		desertBG = new BGSprite('desert', -786, -500, Paths.image('backgrounds/wedcape_from_cali_backlground', 'shared'), null, 1, 1, true);
		desertBG.setGraphicSize(Std.int(desertBG.width * 1.2));
		desertBG.updateHitbox();
		sprites.add(desertBG);
		add(desertBG);

		desertBG2 = new BGSprite('desert2', desertBG.x - desertBG.width, desertBG.y, Paths.image('backgrounds/wedcape_from_cali_backlground', 'shared'), null, 1, 1, true);
		desertBG2.setGraphicSize(Std.int(desertBG2.width * 1.2));
		desertBG2.updateHitbox();
		sprites.add(desertBG2);
		add(desertBG2);
		
		sign = new BGSprite('sign', 500, 450, Paths.image('california/leavingCalifornia', 'shared'), null, 1, 1, true);
		sprites.add(sign);
		add(sign);

		train = new BGSprite('train', -800, 500, 'california/train', [
			new Animation('idle', 'trainRide', 24, true, [false, false])
		], 1, 1, true, true);
		train.animation.play('idle');
		train.setGraphicSize(Std.int(train.width * 2.5));
		train.updateHitbox();
		train.antialiasing = false;
		sprites.add(train);
		add(train);
	]])
end
