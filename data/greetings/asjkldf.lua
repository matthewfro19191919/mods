function onSongStart()
  makeLuaSprite('coolerSTUFF', '', -1000, -1000)
  makeGraphic('coolerSTUFF', 5000, 5000, 'FFFFFF')
  setScrollFactor('coolerSTUFF', 0, 0)
  setProperty('coolerSTUFF.alpha', 0)
  addLuaSprite('coolerSTUFF', true)
end
function onBeatHit()
  if curBeat == 123 then
    doTweenAlpha('coolerSTUFFfff', 'coolerSTUFF', 1, 2.63)
    doTweenZoom('fuckmystupidasslife', 'camGame', 1, 2.63)
  elseif curBeat == 128 then
    removeLuaSprite('coolerSTUFF')
  end
end