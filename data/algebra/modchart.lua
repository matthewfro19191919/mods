function onStepHit()
  if curStep == 640 then
    setProperty('dave.visible', true)
  end
  if curStep == 1408 then
    setProperty('dave.visible', false)
    setProperty('spike.visible', true)
  end
  if curStep == 1728 then
    setProperty('dave2.visible', true)
    setProperty('spike.visible', false)
    removeLuaSprite('dave', true)
  end
  if curStep == 1760 then
    setProperty('dave2.visible', false)
    setProperty('spike.visible', true)
  end
  if curStep == 2048 then
    setProperty('dave2.visible', true)
    setProperty('spike.visible', true)
    setProperty('no2.visible', true)
  end
  if curStep == 3344 then
    setProperty('yes.visible', true)
    setProperty('no2.visible', false)
  end
  if curStep == 4544 then
    setProperty('no2.visible', false) --no more mr nice guy in 1.5 update :crying:
  end
  if curStep == 5176 then
    doTweenX('fire', 'dave2', 250, 0.50, 'sineinout')
    playAnim('dave2', 'full', false)
  end
  if curStep == 5184 then
    playAnim('dave2', 'last', true)
  end
  if curStep == 5744 then
    removeLuaSprite('dave2', true)
    setProperty('bruh.visible', true)
  end
end

function onCreatePost()
  setProperty('gf.visible', false)
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
  if mustHitSection == false and not isSustainNote then
    if noteData == 0 then
			playAnim('spike','singLEFT', true)
		end
		if noteData == 1 then
			playAnim('spike','singDOWN', true)
		end
		if noteData == 2 then
			playAnim('spike','singUP', true)
		end
		if noteData == 3 then
			playAnim('spike','singRIGHT', true)
		end
  end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
  if mustHitSection == true and not isSustainNote then
    if noteData == 0 then
			playAnim('spike','singLEFT', true)
		end
		if noteData == 1 then
			playAnim('spike','singDOWN', true)
		end
		if noteData == 2 then
			playAnim('spike','singUP', true)
		end
		if noteData == 3 then
			playAnim('spike','singRIGHT', true)
		end
  end
end