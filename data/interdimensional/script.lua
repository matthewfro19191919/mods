local allowCountdown = false

function onCreate()
    
    makeLuaSprite('pink2', 'backgrounds/void/interdimensions/interdimensionVoid', -2000, -1000)
    addLuaSprite('pink2')
    addGlitchEffect('pink2',2,5,0.1)
	scaleObject('pink2', 2, 2.3)
	setScrollFactor('pink2', 0, 0);

	makeLuaSprite('pink3', 'backgrounds/void/interdimensions/spike', -2000, -1000)
    addLuaSprite('pink3')
    addGlitchEffect('pink3',2,5,0.1)
	scaleObject('pink3', 2, 2.3)
	setScrollFactor('pink3', 0, 0);
	setProperty('pink3.visible', false)

	makeLuaSprite('pink4', 'backgrounds/void/interdimensions/darkSpace', -2000, -1000)
    addLuaSprite('pink4')
    addGlitchEffect('pink4',2,5,0.1)
	scaleObject('pink4', 2, 2.3)
	setScrollFactor('pink4', 0, 0);
	setProperty('pink4.visible', false)

	makeLuaSprite('pink5', 'backgrounds/void/interdimensions/hexagon', -2000, -1000)
    addLuaSprite('pink5')
    addGlitchEffect('pink5',2,5,0.1)
	scaleObject('pink5', 2, 2.3)
	setScrollFactor('pink5', 0, 0);
	setProperty('pink5.visible', false)

	makeLuaSprite('pink6', 'backgrounds/void/interdimensions/nimbi/nimbiVoid', -800, -800)
    addLuaSprite('pink6')
    addGlitchEffect('pink6',2,5,0.1)
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

    makeLuaSprite('overlay', 'nightoverlay', 0, 0)
    setObjectCamera('overlay', 'hud')
    addLuaSprite('overlay', false)
    setProperty('overlay.alpha', 0)
end

function onUpdate()
    if curStep >= 0 and dadName == 'dave-festival-3d' then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/180)
        doTweenY('dadTweenY', 'dad', 200 - 80*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
    if mustHitSection == true then
        setProperty('defaultCamZoom', 0.8)
    elseif mustHitSection == false then
        setProperty('defaultCamZoom', 0.6)
    end
    setProperty('redsky.visible', false)
    setProperty('nimbiland.visible', false)
    setProperty('nimbisign.visible', false)
end

function onStepHit()
    if curStep == 384 then
        setProperty('overlay.alpha', 1)
    end
    if curStep == 512 then
        doTweenAlpha('bay', 'overlay', 0, 1, 'linear')
    end
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

--function onBeatHit()
--    if curBeat == 672 then
--        setProperty('dad.y', 400);
--        setProperty('boyfriend.x', getProperty('boyfriend.x')-300)
--    end
--end