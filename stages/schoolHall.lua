function onCreate()
	--Create Background sprites
	
	makeLuaSprite('algebraBg', 'algebra/algebraBg', -400, -100);
	scaleObject('algebraBg', 1.4, 1.4);

	makeLuaSprite('dave', 'algebra/bgJunkers/dave', 700, 330);
	setScrollFactor('dave', 1, 1);
	scaleObject('dave', 1.30, 1.30);
	setProperty('dave.visible', false)

--	makeLuaSprite('bitch', 'main/algebra/bgJunkers/bitch', 400, 270);
--	setScrollFactor('bitch', 1, 1);
--	scaleObject('bitch', 1.30, 1.30);
--	setProperty('bitch.visible', false)

	makeAnimatedLuaSprite('dave2', 'algebra/bgJunkers/davePiss', 810, 260)
	addAnimationByPrefix('dave2', 'first', 'GRR0000', 24, true)
	addAnimationByPrefix('dave2', 'last', 'GRR0015', 24, true)
	addAnimationByPrefix('dave2', 'full', 'GRR', 24, false)
	addOffset('dave2', 'full', 0, -100)
	addOffset('dave2', 'last', 0, -100)
	playAnim('dave2', 'first', true)
	scaleObject('dave2', 1.30, 1.30)
	setProperty('dave2.visible', false)

	makeAnimatedLuaSprite('spike', 'algebra/bgJunkers/spike_bg', 500, 270)
	addAnimationByPrefix('spike', 'idle', 'idle', 24, true)
	addAnimationByPrefix('spike', 'singLEFT', 'left', 24, false)
	addAnimationByPrefix('spike', 'singRIGHT', 'right', 24, false)
	addAnimationByPrefix('spike', 'singUP', 'up', 24, false)
	addAnimationByPrefix('spike', 'singDOWN', 'down', 24, false)
--	addAnimationByPrefix('dave2', 'last', 'GRR0015', 24, true)
--	addAnimationByPrefix('dave2', 'full', 'GRR', 24, false)
	playAnim('spike', 'idle', true)
	scaleObject('spike', 1, 1)
	setProperty('spike.visible', false)

--	makeLuaSprite('dave2', 'main/algebra/bgJunkers/dave2', 700, 330);
--	setScrollFactor('dave2', 1, 1);
--	scaleObject('dave2', 1.30, 1.30);
--	setProperty('dave2.visible', false)

	makeLuaSprite('no', 'algebra/bgJunkers/lanceyIsGoingToMakeAFakeLeakAndPostItInGeneral', 1200, -100);
	setScrollFactor('no', 1, 1);
	scaleObject('no', 1, 1.50);
	setProperty('no.visible', false)

	makeLuaSprite('no2', 'algebra/bgJunkers/Crafters_Ohno2', 1050, 170);
	setScrollFactor('no2', 1, 1);
	scaleObject('no2', 1.2, 1.2);
	setProperty('no2.visible', false)

	makeLuaSprite('yes', 'algebra/bgJunkers/rubyIsAngryRN', 1500, 300);
	setScrollFactor('yes', 1, 1);
	scaleObject('yes', 1.30, 1.30);
	setProperty('yes.visible', false)

	makeLuaSprite('bruh', 'algebra/bgJunkers/myInternetJustWentOut', -200, 500);
	setScrollFactor('bruh', 1, 1);
	scaleObject('bruh', 1.30, 1.30);
	setProperty('bruh.visible', false)



	addLuaSprite('bg', false);
	addLuaSprite('algebraBg', false);
	addLuaSprite('dave', false);
	addLuaSprite('bitch', false);
	addLuaSprite('dave2', false);
	addLuaSprite('no', false);
	addLuaSprite('no2', false);
	addLuaSprite('yes', false);
	addLuaSprite('bruh', false);
	addLuaSprite('spike', false)
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end