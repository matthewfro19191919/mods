--Indentation is real. Don't mind the shitty code layout, I'll probably fix it soon.

local allowCountdown = false
local modchart = true

function onUpdate(elapsed)
  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/280)
    doTweenY(dadTweenY, 'dad', 240-80*math.sin((currentBeat*0.25)*math.pi),0.001)
  end
end

function onUpdatePost()
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
  if modchart == true then
    for i = 0, getProperty('unspawnNotes.length')-1 do
      setPropertyFromGroup('unspawnNotes',i,'multSpeed',getRandomFloat(0.2,1))
    end
  end
end
end

function onStartCountdown()
  setProperty('introSoundsSuffix', '-bambi')
  for i = 0, getProperty('unspawnNotes.length')-1 do
  if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
    setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_assets_3D'); --Change texture
    setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
  end
end
end

function onStepHit()
  if curStep == 3072 then
    setProperty('dad.visible', false)
    setProperty('iconP2.visible', false)
  end
end

function onDestroy()
  setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
end

--function onCreate()
--  setProperty('debugKeysChart', null)
--  setProperty('debugKeysCharacter', null)
--end
