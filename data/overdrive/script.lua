function onCreatePost()
    makeLuaSprite('healthbaralt2','ui/fnfengine',getProperty('healthBarBG.x'),getProperty('healthBarBG.y'))
	addLuaSprite('healthbaralt2')
	setObjectCamera('healthbaralt2','hud')
	setObjectOrder('healthbaralt2',getObjectOrder('healthBar'))
    setProperty("healthbaralt.visible", false)

    setProperty('gf.visible', false)
    setProperty('timeTxt.visible', false)

    setTextFont('scoreTxt', 'ariblk.ttf')
end

function onCountdownTick(swagCounter)
    if swagCounter == 0 then
        playSound('introSounds/dave/intro1_dave', 1)
	    setProperty('intro0.volume', 0)
    end
    if swagCounter == 1 then
        makeLuaSprite('ready', 'ui/spr_start_sprites_0', screenWidth / 2 - 279, screenHeight / 2 - 215);
        setObjectCamera('ready','other');
        doTweenAlpha('slamOneAlpha', 'ready', 0, crochet / 1000, 'cubeInOut');
        setProperty('countdownOne.visible', false);
        addLuaSprite('ready', true);
        screenCenter('ready')
        playSound('introSounds/dave/intro2_dave', 1)
	    setProperty('intro3.volume', 0)
    end
    if swagCounter == 2 then
        makeLuaSprite('set', 'ui/spr_start_sprites_1', screenWidth / 2 - 279, screenHeight / 2 - 215);
        setObjectCamera('set','other');
        doTweenAlpha('slamTwoAlpha', 'set', 0, crochet / 1000, 'cubeInOut');
        setProperty('countdownTwo.visible', false);
        addLuaSprite('set', true);
        screenCenter('set')
        playSound('introSounds/dave/intro3_dave', 1)
	    setProperty('intro2.volume', 0)
    end
    if swagCounter == 3 then
        makeLuaSprite('Go', 'ui/spr_start_sprites_2', screenWidth / 2 - 279, screenHeight / 2 - 215);
        setObjectCamera('Go','other');
        doTweenAlpha('slamGoAlpha', 'Go', 0, crochet / 1000, 'cubeInOut');
        addLuaSprite('Go', true);
        screenCenter('Go')
        playSound('introSounds/dave/introGo_dave', 1)
	    setProperty('introGo.volume', 0)
    end
end

function onUpdate(elapsed)
    setTextString('scoreTxt', 'score: ' ..score)
end

function onSongStart()
    setProperty('black.alpha', 0)
    setProperty('gray.alpha', 0)
    setProperty('green.alpha', 0)
end

function onTweenCompleted(tag)
    if tag == 'slamGoAlpha' then
        removeLuaSprite('Go', true);
    elseif tag == 'slamTwoAlpha' then
        removeLuaSprite('set', true);
    elseif tag == 'slamOneAlpha' then
        removeLuaSprite('ready', true);
    elseif tag == 'slam3Alpha' then
        removeLuaSprite('3', true);
    end
end