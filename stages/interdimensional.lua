--bad

sprs = {'dad', 'boyfriend', 'gf'}
nimbiSprs = {'nimbiland', 'nimbisign'}
daCrowd = {}
function onCreatePost()
  add = addLuaSprite
  addAnim = addAnimationByPrefix
  initLuaShader('GlitchShader')
	makeLuaSprite('redsky', 'backgrounds/void/interdimensions/interdimensionVoid', -700, -350)
  setProperty('redsky.antialiasing', false)
  scaleObject('redsky', 1.75, 1.75)
	add('redsky', false)

  setSpriteShader('redsky', 'GlitchShader')

  local precacheThisShitLmao = directoryFileList('mods/'..currentModDirectory..'/images/backgrounds/void/interdimensions')
  local nimbiShit = directoryFileList('mods/'..currentModDirectory..'/images/backgrounds/void/interdimensions/nimbi')
  local crowd = directoryFileList('mods/'..currentModDirectory..'/images/backgrounds/festival/scaredCrowd')

  for k,v in pairs(precacheThisShitLmao) do
    if stringEndsWith(v, '.png') then
      local goAway = stringSplit(v, '.')[1]
      precacheImage(idiot(goAway))
    end
  end
  for k,v in pairs(nimbiShit) do
    if stringEndsWith(v, '.png') then
      local goAway = stringSplit(v, '.')[1]
      precacheImage(idiot('nimbi/'..goAway))
    end
  end

  makeLuaSprite('nimbiland', idiot('nimbi/nimbi_land'), 200, 100)
  setProperty('nimbiland.antialiasing', false)
  setProperty('nimbiland.visible', false)
  scaleObject('nimbiland', 1.5, 1.5)
  add('nimbiland')
  
  makeLuaSprite('nimbisign', idiot('nimbi/sign'), 800, -73)
  setProperty('nimbisign.antialiasing', false)
  setProperty('nimbisign.visible', false)
  scaleObject('nimbisign', 0.2, 0.2)
  add('nimbisign')

  for k,v in pairs(crowd) do
    local goAway = stringSplit(v, '.')[1]
    makeSpr(goAway, 'backgrounds/festival/scaredCrowd/'..goAway, 500, 500)
    add(goAway)
    table.insert(daCrowd, goAway)
  end

  makeLuaSprite('coolerSTUFF', '', -1000, -1000)
  makeGraphic('coolerSTUFF', 5000, 5000, 'FFFFFF')
  setScrollFactor('coolerSTUFF', 0, 0)
  setProperty('coolerSTUFF.alpha', 0)
  add('coolerSTUFF', true)

  makeFestivalBG()
end
elapsedTime = 0
function onUpdate(elapsed)
  if not inGameOver then
    elapsedTime = elapsedTime + elapsed
    setShaderFloat('redsky', 'uTime', elapsedTime)

    for k,v in pairs(daCrowd) do
      setProperty(v..'.x', math.sin(elapsedTime + k) * 1000 + (k * 100))
      setProperty(v..'.y', math.cos(elapsedTime * 2 - k) * 1000 - (k * 100) + 750)
      setProperty(v..'.angle', getProperty(v..'.angle') + k)
    end
  end
end
beatShitAwesome = {
  [94] = function()
    doTweenAlpha('iieiid', 'coolerSTUFF', 1, 30.32-29.68)
  end,
  [96] = function()
    removeLuaSprite('coolerSTUFF', true)
  end,
  [160] = function()
    changeBG(('spike'))
  end,
  [288] = function()
    changeBG(('darkSpace'))
    for k,v in pairs(sprs) do
      setProperty(v..'.color', getColorFromHex('0000FF'))
    end
  end,
  [352] = function()
    changeBG(('hexagon'))
    for k,v in pairs(sprs) do
      setProperty(v..'.color', getColorFromHex('FFFFFF'))
    end
  end,
  [448] = function()
    changeBG(('nimbi/nimbiVoid'))
    for k,v in pairs(nimbiSprs) do
      setProperty(v..'.visible', true)
    end
  end,
  [544] = function()
    changeBG(('interdimensionVoid'))
    for k,v in pairs(nimbiSprs) do
      setProperty(v..'.visible', false)
    end
  end,
  [672] = function()
    for k,v in pairs(festivalShit) do
      doTweenAlpha(v, v, 1, 1)
    end
    doTweenX('sdfgsdh', 'boyfriendGroup', 770, 1)
    doTweenY('agfdsgfd', 'boyfriendGroup', 250, 1)
    doTweenX('asdhsdfgghdf', 'gfGroup', 400, 1)
    doTweenY('adhfdfgfds', 'gfGroup', 130, 1)
    doTweenX('agsdgds', 'dadGroup', 300, 1)
    doTweenY('sfasdgdf', 'dadGroup', 450 - 160, 1)
    setProperty('boyfriend.skipDance', true)
    setProperty('gf.skipDance', true)
    playAnim('gf', 'cheer')
    playAnim('boyfriend', 'hey')
    runHaxeCode[[
      for(bitch in game.opponentStrums)
      {
        bitch.kill();
        bitch.destroy();
      }
      game.generateStaticArrows(0);
    ]]
  end
}
function idiot(img)
  return 'backgrounds/void/interdimensions/'..img
end
timers = {blankTags = 0}
function ezTimer(tag, timer, callback)
  if tag == nil then
    tag = 'blank_tags-'..tostring(timers.blankTags)
    timers.blankTags = timers.blankTags + 1
  end
  timers[tag] = callback
  runTimer(tag, timer)
end
function changeBG(img)
  if not inGameOver then
    local awesomescales = {
      ['interdimensionVoid'] = 1.75,
      ['spike'] = 3,
      ['darkSpace'] = 2.75,
      ['hexagon'] = 3,
      ['nimbi/nimbiVoid'] = 2.75
    }
    local pos = img == 'interdimensionVoid' and {-700, -350} or {-200, 0}
    loadGraphic('redsky', idiot(img))
    scaleObject('redsky', awesomescales[img], awesomescales[img])
    setPos('redsky', pos[1], pos[2])
  end
end
function onTimerCompleted(tag)
  if timers[tag] ~= nil and not inGameOver then
    timers[tag]()
    timers[tag] = nil
    if stringStartsWith(tag, 'blank_tags-') then
      timers.blankTags = tonumber(stringSplit(tag, '-')[2])
    end
  end
end

function makeSpr(name, path, x, y, animated, fasd) --used for crowd
  makeLuaSprite(name, path, x, y)
  table.insert(sprs, name)
end



--FESTIVAL BG
crowdStuff = {
  ['shredder'] = {
    {'dave', 'idle', 0.8, 175, 100},
    {'tristan', 'bop', 0.4, 800, 325}
  },
  ['greetings'] = {
    {'dave', 'idle', 0.8, 175, 100},
    {'bambi', 'bambi idle', 0.9, 700, 350}
  },
  ['interdimensional'] = {
    {'bambi', 'bambi idle', 0.9, 400, 350},
    {'tristan', 'bop', 0.4, 800, 325}
  },
  ['fakeOutCutsceneOmg'] = {
    {'bambi', 'bambi idle', 0.9, 400, 350},
    {'tristan', 'bop', 0.4, 800, 325}
  }
}
festivalShit = {}
function makeFestivalBG()
  --debugPrint('making festival bg')
  makeFestivalSpr('sky', 'backgrounds/shared/sky_festival', -600, -230, false, true)
  setScrollFactor('sky', 0.6, 0.6)
  add('sky')

  makeFestivalSpr('flatGrass', 'gm_flatgrass', 800, -100)
  setScrollFactor('flatGrass', 0.7, 0.7)
  add('flatGrass')

  makeFestivalSpr('farmHouse', 'farmHouse', -300, -150)
  setScrollFactor('farmHouse', 0.7, 0.7)
  add('farmHouse')

  makeFestivalSpr('hills', 'hills', -1000, -100)
  setScrollFactor('hills', 0.7, 0.7)
  add('hills')

  makeFestivalSpr('corn', 'corn', -1000, 120, true)
  addAnim('corn', 'idle', 'idle', 5)
  setScrollFactor('corn', 0.85, 0.85)
  playAnim('corn', 'idle')
  add('corn')

  makeFestivalSpr('cornGlow', 'cornGlow', -1000, 120, true)
  addAnim('cornGlow', 'idle', 'idle', 5)
  setScrollFactor('cornGlow', 0.85, 0.85)
  playAnim('cornGlow', 'idle')
  add('cornGlow')

  makeFestivalSpr('backGrass', 'backGrass - Copy', -1000, 475)
  setScrollFactor('backGrass', 0.85, 0.85)
  add('backGrass')

  makeFestivalSpr('crowd', 'crowd', -500, -150, true)
  addAnim('crowd', 'dance', 'crowdDance', 24, false)
  setScrollFactor('crowd', 0.85, 0.85)
  playAnim('crowd', 'dance')
  add('crowd')
    --debugPrint('getting to bullshit')
  if crowdStuff[songName:lower()] ~= nil then
    for k,v in pairs(crowdStuff[songName:lower()]) do
      makeFestivalSpr(v[1]..'2', 'mainCrowd/'..v[1], v[4], v[5], true)
      addAnim(v[1]..'2', 'idle', v[2])
      setScrollFactor(v[1]..'2', 0.85, 0.85)
      scaleObject(v[1]..'2', v[3], v[3])
      add(v[1]..'2')
    end
  end

  makeFestivalSpr('frontGrass', 'frontGrass', -1300, 600)
  add('frontGrass')

  makeFestivalSpr('stageGlow', 'generalGlow', -450, 300, true)
  setScrollFactor('stageGlow', 0, 0)
  addAnim('stageGlow', 'glow', 'idle', 5)
  setBlendMode('stageGlow', 'add')
  playAnim('stageGlow', 'glow')
  add('stageGlow')
  --debugPrint('made festival bg')

  -- callOnLuas('setRatingSetting', {'offset', {0, -100}})
end
function onBeatHit()
  if curBeat % 2 == 0 and not inGameOver then
    playAnim('crowd', 'dance', true)
    for k,v in pairs(crowdStuff[songName:lower()]) do
      playAnim(v[1]..'2', v[3], true)
    end
  end
  if beatShitAwesome[curBeat] and not inGameOver then
    beatShitAwesome[curBeat]()
  end
end
function setPos(w, x, y)
  setProperty(w..'.x', x)
  setProperty(w..'.y', y)
end
function makeFestivalSpr(name, image, x, y, animated, fasd)
  --debugPrint('making festival spr')
  local path = 'backgrounds/festival/'..image
  if fasd then path = image end
  local spritething = makeLuaSprite
  if animated then spritething = makeAnimatedLuaSprite end
  spritething(name, path, x, y)
  setProperty(name..'.alpha', 0)
  table.insert(festivalShit, name)
  --debugPrint('made festival spr')
end