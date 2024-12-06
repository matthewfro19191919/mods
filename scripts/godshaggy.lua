if boyfriendName == 'godshaggy' then
local sh_r = 600
local bfControlY = 0
local endCheck = false
local trigger = 1
local shag_fly = true
local songStarted = false
----------------------------
local collected = false
local state0 = true
local vsp = -10
----------------------------
local dvsp = {-20, -20, -20}
local dhsp = {0, 0, 0}
local CdebId = 1
local Csx = {0,0,0}
local Csy = {0,0,0}
local Csc = {0,0,0}
local CtF = {0,0,0}
local CtD = {0,0,0}
local CpF = {0,0,0}
------Thanks to Bf Myt for this----------
local currentGhost = 0
local lastGhost = 0
local fps = 0

function onCreate()
	makeAnimatedLuaSprite('legs', 'characters/shaggy_god', 0, 0)
	addAnimationByPrefix('legs', 'Instance', 'solo_legs', 24, false)
	addOffset('legs', 'Instance', 0, 0)
	setObjectOrder('legs', getObjectOrder('boyfriendGroup'))
	addLuaSprite('legs', false);
end

local cut = 0
function onShaggyStart()
	cut = cut + 1
	if not isStoryMode or cut == 1 and seenCutscene then
		--nothing
	elseif cut == 1 then
		setProperty('legs.alpha', 0)
		setProperty('camFollow.x', getProperty('boyfriend.x')+200)
		setProperty('camFollow.y', getProperty('boyfriend.y')+300)
		runTimer('snap', 2)
		return Function_Stop;
	elseif cut == 2 then
		songStarted = true
	end
end

function onBeatHit()
	if curBeat < 32 then
		sh_r = 60
	elseif (curBeat >= 50*4 and curBeat <= 58*4) or curBeat >= 140 * 4 then
		sh_r = 60
	else
		sh_r = 600
	end
end


function onUpdate(elapsed)
	if not endCheck and allowCountdown then
		fps = fps + elapsed
		if fps >= 1/10 then
			if getProperty('legs.alpha') > 0 then
				createGhost('legs','FFFFF', getProperty('legs.animation.curAnim.name'), getProperty('boyfriend.imageFile'))
			end
			createGhost('dad', 'FFFFF', getProperty('boyfriend.animation.curAnim.name'), getProperty('boyfriend.imageFile'))
			fps = 0
		end
		rotRateShag = curStep / 9.25
		sh_toy = -2450 + -math.sin(rotRateShag * 2) * sh_r * 0.45
		sh_tox = -330 - math.cos(rotRateShag) * sh_r
		if shag_fly and curStep > 0 then
			setProperty('boyfriend.x', getProperty('boyfriend.x') + ((sh_tox - getProperty('boyfriend.x')) / 12))
			setProperty('boyfriend.y', getProperty('boyfriend.y') + ((sh_toy - getProperty('boyfriend.y')) / 12))
		elseif shag_fly and curStep <= 0 then
			setProperty('dad.x', getProperty('boyfriend.x') + (((sh_tox+800) - getProperty('boyfriend.x')) / 12))
			setProperty('dad.y', getProperty('boyfriend.y') + ((sh_toy - getProperty('boyfriend.y')) / 12))
		end

		if getProperty('boyfriend.animation.curAnim.name') == "idle" then
			setProperty('boyfriend.angle', math.sin(rotRateShag) * sh_r * 0.07 / 4)
			setProperty('legs.alpha', 1)
			setProperty('legs.angle', math.sin(rotRateShag) * sh_r * 0.07)
			setProperty('legs.x', (getProperty('boyfriend..x') + -25 + math.cos((getProperty('legs.angle') + 90) * (math.pi/180)) * 150))
			setProperty('legs.y', (getProperty('boyfriend..y') + 290 + math.sin((getProperty('legs.angle') + 90) * (math.pi/180)) * 150))
			setProperty('legs.x', getProperty('legs.x') - getProperty('legs.angle')*3.6)
			if getProperty('legs.angle') > 0 then
				setProperty('legs.y', getProperty('legs.y') + -getProperty('legs.angle')-getProperty('boyfriend..angle')*2)
			elseif getProperty('legs.angle') < 0 then
				setProperty('legs.y', getProperty('legs.y') + getProperty('legs.angle')-getProperty('boyfriend.angle')*2)
			end
		end
	end
end
end