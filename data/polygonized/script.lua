function onUpdate()
    if curStep >= 0 and dadName == 'dave3d' then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/180)
        doTweenY('dadTweenY', 'dad', 200 - 80*math.sin((currentBeat*0.25)*math.pi),0.001)
    end
    if curStep == 2432 then
		setProperty('pink2.visible', false)
        cancelTween('dadTweenY')
    end
end

--function onCreatePost()
--    setProperty('defaultCamZoom',0.75)
--end