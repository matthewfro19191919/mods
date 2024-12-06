function onCreate()

	makeLuaSprite('cheaterbackground', 'backgrounds/void/cheater', -1400, -800)
    addLuaSprite('cheaterbackground')
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
