function onCreate()

	makeLuaSprite('3dBG', 'backgrounds/void/bananaVoid1', -2300, -1000)
    addLuaSprite('3dBG')
    addGlitchEffect('3dBG',2,5,0.1)
	scaleObject('3dBG', 2, 2)
	setProperty('3dBG.visible', true)
	setScrollFactor('3dBG', 0.5, 0.5);

	makeLuaSprite('3dBG2', 'backgrounds/void/bananaVoid2', -2300, -1000)
    addLuaSprite('3dBG2')
    addGlitchEffect('3dBG2',2,5,0.1)
	scaleObject('3dBG2', 2, 2)
	setProperty('3dBG2.visible', false)
	setScrollFactor('3dBG2', 0.5, 0.5);

	makeLuaSprite('3dBG3', 'backgrounds/void/bananaVoid3', -2300, -1000)
    addLuaSprite('3dBG3')
    addGlitchEffect('3dBG3',2,5,0.1)
	scaleObject('3dBG3', 2, 2)
	setProperty('3dBG3.visible', false)
	setScrollFactor('3dBG3', 0.5, 0.5);

	makeLuaSprite('bamber', 'eletric-cockadoodledoo/sad_bambi', 0,0)
	screenCenter('bamber')
	setObjectCamera('bamber', 'hud')
	setProperty('bamber.alpha', 0)
	addLuaSprite('bamber', false)

	makeLuaSprite('shag', 'eletric-cockadoodledoo/shaggy from fnf 1', 300, 50)
	setProperty('shag.alpha', 0)
	scaleObject('shag', 1, 1)
	addLuaSprite('shag', true)

	makeLuaSprite('ad', 'eletric-cockadoodledoo/indihome', -10, 0)
	setProperty('ad.alpha', 0)
	scaleObject('ad', 0.8, 0.8)
	setObjectCamera('ad', 'other')
	addLuaSprite('ad', true)

	makeLuaSprite('gamePhone', 'eletric-cockadoodledoo/muffin', -10, 0)
	setProperty('gamePhone.alpha', 0)
	scaleObject('gamePhone', 0.68, 0.7)
	setObjectCamera('gamePhone', 'other')
	addLuaSprite('gamePhone', true)

	makeLuaSprite('white')
	makeGraphic('white', screenWidth, screenHeight, 'FFFFFF')
	setObjectCamera('white', 'hud')
	addLuaSprite('white', false)
	setProperty('white.alpha', 0)

	makeAnimatedLuaSprite('Cockey', 'eletric-cockadoodledoo/characters/cockey', -1200, -200); -- change 'character' to the name of your character, change 'dad' to the name of the .png and .xml file
	addAnimationByPrefix('Cockey', 'idle', 'idle0014', 24, true);
	addAnimationByPrefix('Cockey', 'singLEFT', 'left', 24, false); -- repeat this for each one ^^^
	addAnimationByPrefix('Cockey', 'singDOWN', 'down', 24, false);
	addAnimationByPrefix('Cockey', 'singUP', 'up', 24, false);
	addAnimationByPrefix('Cockey', 'singRIGHT', 'right', 24, false);
	setProperty('Cockey.alpha', 0)
	scaleObject('Cockey', 0.5, 0.5)

	playAnim('Cockey', 'idle', true); -- change 'character'
	addLuaSprite('Cockey', false); -- change 'character' to the name of your character and put the 'false' to true if you want the character to be in front of the original characters

	--kapi stage

	makeLuaSprite('bg', 'eletric-cockadoodledoo/kapicuzsie_back', -1100, -400)
	scaleObject('bg', 1.4, 1.4)
	addLuaSprite('bg', false)

	makeLuaSprite('front', 'eletric-cockadoodledoo/kapicuzsie_front', -400, 700)
	scaleObject('front', 1.1, 1.1)
	addLuaSprite('front', false)

	setProperty('bg.alpha', 0)
	setProperty('front.alpha', 0)

end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'cockey' then
		playAnim('Cockey', singAnims[direction + 1], true)
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		playAnim('Cockey', 'idle', true);
	end
end

function onCreatePost()
	setProperty('dad.alpha', 0)
	setProperty('iconP2.alpha', 0)
end

function wahhhh()
	setProperty('bamber.alpha', 1)
	setProperty('white.alpha', 1)
	doTweenAlpha('bai', 'bamber', 0, 0.30, 'linear')
	doTweenAlpha('bai2', 'white', 0, 0.10, 'linear')
end

function onStepHit()
	if curStep == 146 then
		doTweenAlpha('woaahah', 'dad', 1, 0.30, 'linear')
		doTweenAlpha('hi', 'iconP2', 1, 0.30, 'linear')
	end
	if curStep == 832 then
		setProperty('dad.alpha', 0)
		doTweenAlpha('dad', 'dad', 1, 5, 'linear')
		setProperty('Cockey.alpha', 1)
		setProperty('3dBG2.visible', true)
	end
	if curStep == 1528 then
		doTweenAlpha('hai', 'shag', 0.7, 1.40, 'linear')
	end
	if curStep == 1549 then
		setProperty('shag.alpha', 0)
	end
	if curStep == 1654 then
		setProperty('defaultCamZoom', 0.7)
		setProperty('front.alpha', 1)
		setProperty('bg.alpha', 1)
		setProperty('gf.alpha', 0)
	end
	if curStep == 1728 then
		setProperty('defaultCamZoom', 0.5)
		setProperty('front.alpha', 0)
		setProperty('bg.alpha', 0)
		setProperty('gf.alpha', 1)
	end
	if curStep == 1856 then
		doTweenY('flyHighBoyfriend', 'boyfriend', -250, 9.93, 'linear')
	end
	if curStep == 1984 then
		cancelTween('flyHighBoyfriend')
		setProperty('boyfriend.y', 650) --nevermind he's fucking back :(
		setProperty('3dBG3.visible', true)
	end
	if curStep == 2048 then
		setProperty('dad.flipX', true)
	end
	if curStep == 2208 then
		setProperty('dad.flipX', false)
		setProperty('dad.alpha', 0)
		setProperty('Cockey.alpha', 0)
	end
	if curStep == 2240 then
		doTweenAlpha('dad', 'dad', 1, 1, 'linear')
	end
	if curStep == 2624 then
		setProperty('ad.alpha', 1)
	end
	if curStep == 2688 then
		removeLuaSprite('ad')
	end
	if curStep == 3200 then
		setProperty('gamePhone.alpha', 1)
	end
	if curStep == 3328 then
		setProperty('camHUD.alpha', 0)
		removeLuaSprite('gamePhone')
	end
	if curStep == 3392 then
		setProperty('camHUD.alpha', 1)
	end
	if curStep == 3568 then
		doTweenAlpha('bai', 'dad', 0, 4.47, 'linear')
		doTweenAlpha('bai icon', 'iconP2', 0, 4.47, 'linear')
	end
end

function onEvent(name, value1, value2)
	if name == 'wahhhh' then
		wahhhh()
	end
end

function onUpdate() -- for every frame
	if dadName == 'cockey' or dadName == 'Pissey' or dadName == 'pooper' or dadName == 'expunged' then
		songPos = getSongPosition()
    	local currentBeat = (songPos/1000)*(bpm/180)
    	doTweenY('dadTweenY', 'dad', -200 - 80*math.sin((currentBeat*0.25)*math.pi),0.001)
	end
end