function onCreate()

	makeLuaSprite('pink2', 'backgrounds/void/interdimensions/interdimensionVoid', -2000, -1000)
    addLuaSprite('pink2')
	scaleObject('pink2', 2, 2.3)
	setScrollFactor('pink2', 0, 0);

	makeLuaSprite('pink3', 'backgrounds/void/interdimensions/spike', -2000, -1000)
    addLuaSprite('pink3')
	scaleObject('pink3', 2, 2.3)
	setScrollFactor('pink3', 0, 0);
	setProperty('pink3.visible', false)

	makeLuaSprite('pink4', 'backgrounds/void/interdimensions/darkSpace', -2000, -1000)
    addLuaSprite('pink4')
	scaleObject('pink4', 2, 2.3)
	setScrollFactor('pink4', 0, 0);
	setProperty('pink4.visible', false)

	makeLuaSprite('pink5', 'backgrounds/void/interdimensions/hexagon', -2000, -1000)
    addLuaSprite('pink5')
	scaleObject('pink5', 2, 2.3)
	setScrollFactor('pink5', 0, 0);
	setProperty('pink5.visible', false)

	makeLuaSprite('pink6', 'backgrounds/void/interdimensions/nimbi/nimbiVoid', -800, -800)
    addLuaSprite('pink6')
	scaleObject('pink6', 2, 2.3)
	setScrollFactor('pink6', 0, 0);
	setProperty('pink6.visible', false)

	makeLuaSprite('land', 'backgrounds/void/interdimensions/nimbi/nimbi_land', -100, 0)
    addLuaSprite('land')
	scaleObject('land', 1, 1)
	setScrollFactor('land', 0.5, 0.5);
	setProperty('land.visible', false)

	makeLuaSprite('nimbi', 'backgrounds/void/interdimensions/nimbi/sign', 800, 220)
    addLuaSprite('nimbi')
	scaleObject('nimbi', 0.2, 0.2)
	setScrollFactor('nimbi', 0.5, 0.5);
	setProperty('nimbi.visible', false)

	makeLuaSprite('white', 'white', 0, 0)
	scaleObject('white', screenWidth, screenHeight)
	setObjectCamera('white', 'camHUD')
	setProperty('white.alpha', 0)
	addLuaSprite('white', true)

	makeLuaSprite('overlay2', 'blueoverlay', 0, 0)
	setObjectCamera('overlay2', 'hud')
	setProperty('overlay2.alpha', 0)
	addLuaSprite('overlay2', true)

	addHaxeLibrary('FlxTween', 'flixel.tweens')
	runHaxeCode([[
		for (char in ['ball', 'bimpe', 'maldo', 'memes kids', 'muko', 'ruby man', 'tristan', 'bambi'])
		{
			var bgChar = new FlyingBGChar(char, Paths.image('backgrounds/festival/scaredCrowd/$char'));
			sprites.add(bgChar);
			flyingBgChars.add(bgChar);
		}
		add(flyingBgChars);
	]])

end

function onUpdate(elapsed)
	runHaxeCode([[
		elapsedtime += elapsed;
		
		var speed = 300;
			flyingBgChars.forEach(function(bgChar:FlyingBGChar)
			{
				var moveDir = bgChar.direction == 'left' ? -1 : bgChar.direction == 'right' ? 1 : 0;
				bgChar.x += speed * elapsed * moveDir * bgChar.randomSpeed;
				bgChar.y += (Math.sin(elapsedtime) * 5);
	
				bgChar.angle += bgChar.angleChangeAmount * elapsed;

				switch (bgChar.direction)
				{
					case 'left':
						if (bgChar.x < bgChar.leftPosCheck)
						{
							bgChar.switchDirection();
						}
					case 'right':
						if (bgChar.x > bgChar.rightPosCheck)
						{
							bgChar.switchDirection();
						}
				}
			});
	]])
end

function onBeatHit()--for every beat
	if curBeat == 92 then
		doTweenAlpha('whitened', 'white', 1, 1.27, 'linear')
	end
	if curBeat == 96 then
		doTweenAlpha('whitened', 'white', 0, 0.001, 'linear')
	end
	if curBeat == 160 then
		setProperty('pink3.visible', true)
		setProperty('pink2.visible', false)
	end
	if curBeat == 288 then
		setProperty('pink4.visible', true)
		setProperty('pink3.visible', false)
	end
	if curBeat == 352 then
		setProperty('pink5.visible', true)
		setProperty('pink4.visible', false)
	end
	if curBeat == 448 then
		setProperty('pink6.visible', true)
		setProperty('land.visible', true)
		setProperty('nimbi.visible', true)
		setProperty('pink5.visible', false)
	end
	if curBeat == 544 then
		setProperty('pink6.visible', false)
		setProperty('land.visible', false)
		setProperty('nimbi.visible', false)
		setProperty('pink2.visible', true)
	end
	if curBeat == 672 then 
		--end of song code here
	end
end

function onStepHit( ... )--for every step
end
