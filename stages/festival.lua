sprs = {}
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
function onCreate()
  addAnim = addAnimationByPrefix
  
  makeSpr('sky', 'backgrounds/shared/sky_festival', -600, -230, false, true)
  setScrollFactor('sky', 0.6, 0.6)
  add('sky')
  
  makeSpr('flatGrass', 'gm_flatgrass', 800, -100)
  setScrollFactor('flatGrass', 0.7, 0.7)
  add('flatGrass')
  
  makeSpr('farmHouse', 'farmHouse', -300, -150)
  setScrollFactor('farmHouse', 0.7, 0.7)
  add('farmHouse')
  
  makeSpr('hills', 'hills', -1000, -100)
  setScrollFactor('hills', 0.7, 0.7)
  add('hills')
  
  makeSpr('corn', 'corn', -1000, 120, true)
  addAnim('corn', 'idle', 'idle', 5)
  setScrollFactor('corn', 0.85, 0.85)
  playAnim('corn', 'idle')
  add('corn')
  
  makeSpr('cornGlow', 'cornGlow', -1000, 120, true)
  addAnim('cornGlow', 'idle', 'idle', 5)
  setScrollFactor('cornGlow', 0.85, 0.85)
  playAnim('cornGlow', 'idle')
  add('cornGlow')
  
  makeSpr('backGrass', 'backGrass - Copy', -1000, 475)
  setScrollFactor('backGrass', 0.85, 0.85)
  add('backGrass')
  
  makeSpr('crowd', 'crowd', -500, -150, true)
  addAnim('crowd', 'dance', 'crowdDance', 24, false)
  setScrollFactor('crowd', 0.85, 0.85)
  playAnim('crowd', 'dance')
  add('crowd')
  if crowdStuff[songName:lower()] ~= nil then
    mainCrowd = crowdStuff[songName:lower()];
    for k,v in pairs(mainCrowd) do
      makeSpr(v[1], 'mainCrowd/'..v[1], v[4], v[5], true)
      addAnim(v[1], 'idle', v[2], 24, false)
      setScrollFactor(v[1], 0.85, 0.85)
      scaleObject(v[1], v[3], v[3])
      add(v[1])
    end
  end
  
  makeSpr('frontGrass', 'frontGrass', -1300, 600)
  add('frontGrass')
  
  makeSpr('stageGlow', 'generalGlow', -450, 300, true)
  setScrollFactor('stageGlow', 0, 0)
  addAnim('stageGlow', 'glow', 'idle', 5)
  setBlendMode('stageGlow', 'add')
  playAnim('stageGlow', 'glow')
  add('stageGlow')
  
  callOnLuas('setRatingSetting', {'offset', {0, -100}})
end
function onBeatHit()
  if curBeat % 2 == 0 then
    playAnim('crowd', 'dance', true)
    for k,v in pairs(mainCrowd) do
      playAnim(v[1], 'idle', true)
    end
  end
end
function setPos(w, x, y)
  setProperty(w..'.x', x)
  setProperty(w..'.y', y)
end
function makeSpr(name, image, x, y, animated, fasd)
  local path = 'backgrounds/festival/'..image
  if fasd then path = image end
  local spritething = makeLuaSprite
  if animated then spritething = makeAnimatedLuaSprite end
  spritething(name, path, x, y)
  table.insert(sprs, name)
end
function add(tag)
  addLuaSprite(tag)
end