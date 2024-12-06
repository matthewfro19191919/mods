function onCreate()

	makeLuaSprite('cheaterbackground', 'backgrounds/void/cheater', -1400, -800)
    addLuaSprite('cheaterbackground')
    addGlitchEffect('cheaterbackground',2,5,0.1)
	scaleObject('cheaterbackground', 2, 2)
	setScrollFactor('cheaterbackground', 0)

end

function onBeatHit( ... )--for every beat
   -- body
end

function onStepHit( ... )--for every step
	-- body
end

function onUpdate( ... )
	-- body
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if getProperty('health') > 0.1 then
        setProperty('health', getProperty('health') - 0.02)
    end
end

function onUpdate(elapsed)
  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/80)
    doTweenY(dadTweenY, 'dad', 240-80*math.sin((currentBeat*0.25)*math.pi),0.001)
  end
end