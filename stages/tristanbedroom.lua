function onCreate()
	makeLuaSprite('sky','backgrounds/bedroom/sky',-300, 50)
	addLuaSprite('sky',false)
	setScrollFactor('sky', 0.5, 0.5);

	makeLuaSprite('bg','backgrounds/bedroom/bg',-700, -150)
	addLuaSprite('bg',false)
	setScrollFactor('bg', 1, 1);

	makeLuaSprite('bgNight','backgrounds/bedroom/night/bg',-700, -150)
	addLuaSprite('bgNight',false)
	setScrollFactor('bgNight', 1, 1);
	setProperty('bgNight.alpha', 0)

	makeLuaSprite('bed','backgrounds/bedroom/bed', 800, 650)
	addLuaSprite('bed',false)
	setScrollFactor('bed', 1, 1);

	makeLuaSprite('bedNight','backgrounds/bedroom/night/bed', 800, 650)
	addLuaSprite('bedNight',false)
	setScrollFactor('bedNight', 1, 1);
	setProperty('bedNight.alpha', 0)
	
	makeAnimatedLuaSprite('tristan', 'backgrounds/bedroom/TristanSitting', 900, 550)
	addAnimationByPrefix('tristan', 'idle', 'daytime', 24, false)
	addAnimationByPrefix('tristan', 'idle2', 'nighttime', 24, false)
	addLuaSprite('tristan', false)

	makeLuaSprite('tv', 'backgrounds/bedroom/tv', -800, 700)
	addLuaSprite('tv', true)

	makeLuaSprite('farmlandnightoverlay','splitathonoverlay',0,-600)
	setObjectCamera('farmlandnightoverlay', 'camHUD')
	setObjectOrder('farmlandnightoverlay', -990)
	addLuaSprite('farmlandnightoverlay',false)
	setProperty('farmlandnightoverlay.alpha', 0)

end

function onBeatHit()
	if curBeat % 2 == 0 then
		if curBeat >= 1 and curBeat <= 223 then
			playAnim('tristan', 'idle', true)
		elseif curBeat >= 224 and curBeat <= 99999999 then
			playAnim('tristan', 'idle2', true)
		end
	end
end

function onStepHit()
	if curStep == 896 then
		playSound('lightswitch')
		setProperty('bedNight.alpha', 1)
		setProperty('bgNight.alpha', 1)
		setProperty('farmlandnightoverlay.alpha', 0.5)
	end
end


function onCreatePost()
	setProperty("gf.alpha", 0)
end