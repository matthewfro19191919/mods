local allowCountdown = false

function onUpdate(elapsed)
	if curStep >= 0 and curStep < 9999 then
		songPos = getSongPosition()
		local currentBeat = (songPos/5000)*(curBpm/60)

		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 350*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 350 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 320*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 320 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)

		noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 350*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 350 - 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)
		noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 320*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 370 - 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)

	end
	for i=0,4,1 do
		setPropertyFromGroup('opponentStrums', i, 'texture', 'notes/NOTE_assets_3D')
		setPropertyFromGroup('opponentStrums', i, 'antialiasing', false)
	end
end

function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D'); --Change texture
		end

		if getPropertyFromGroup('unspawnNotes', i, 'mustPress') and math.random(0, 2) == 1 then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D'); --Change texture
		end
	end
end

function onStartCountdown()
    for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
		end
	end
end