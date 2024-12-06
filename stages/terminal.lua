--technically this isnt yoinked code cause its lua
--but this is still basically just the source code shoved into lua
--so credits to the people that worked on terminalstate.hx
function onCreate()
    initSaveData('DavePsychEngine')
  luaDebugMode = true
  addHaxeLibrary('FlxKey', 'flixel.input.keyboard')
  psych.makeLuaText = makeLuaText
  psych.addLuaText = addLuaText
  makeLuaText = function(tag, x, y, width, text, size)
    psych.makeLuaText(tag, text, width, x, y)
    setTextSize(tag, size)
  end
  addLuaText = function(tag)
    setObjectCamera(tag, 'other')
    psych.addLuaText(tag)
  end
  
  
  --NOTE EXAMPLE COMMAND:
  
  makeCommand('exampleCommand', getAwesome('put something in terminalList.txt and put the name here'), function(args)
    --function thats called when the command is inputted
    
    --string output, not required
    local output = [[
    hello this is the test command!
    cool
    ]]
    updateText('\n'..output)
  end)
  makeCommand('characters', getAwesome('term_char_ins'), function(args) --add a char here if you want
      --DIEDIEDEID(false)
      updateText("\ndave.dat\nbambi.dat\ntristan.dat\nexpunged.dat\nexbungo.dat\nrecurser.dat\nmoldy.dat")
  end)
  makeCommand('admin', getAwesome('term_admin_ins'), function(args) --add to argstuff
      --DIEDIEDEID(false)
      if #args == 0 then
        --DIEDIEDEID(false)
        updateText('\nloser list lol!')
      elseif #args ~= 2 then
        --DIEDIEDEID(false)
        updateText(getAwesome('term_admin_error1')..' '..tostring(#args)..getAwesome('term_admin_error2'))
      else
        if args[1] == 'grant' then
          local argStuff = {
            ['dave.dat'] = function()
              save.set('terminalModChart', 'dave')
              loadSong('house', -1)
            end,
            ['tristan.dat'] = function()
              save.set('terminalModChart', 'tristan')
              loadSong('house', -1)
            end,
            ['exbungo.dat'] = function()
              save.set('terminalModChart', 'exbungo')
              songs = {"house","insanity","polygonized","five-nights","splitathon","shredder"}
              loadSong(songs[getRandomInt(1, #songs)], -1)
            end,
            ['bambi.dat'] = function()
              save.set('terminalModChart', 'bambi')
              loadSong('shredder', -1)
            end,
            ['recurser.dat'] = function()
              loadSong('polygonized', -1)
            end,
            ['expunged.dat'] = function()
              
            end,
            ['moldy.dat'] = function()
              updateText(getAwesome('term_moldy_error'))
              runTimer('gofuckyourself', 2)
            end
          }
          if argStuff[args[2]] ~= nil and argStuff[args[2]:lower()] then
              argStuff[args[2]:lower()]()
              else
                  updateText('\ninvalid text11!!!!')
          end
          else
              updateText('\ninvasvdi saf')
        end
      end
  end)
  makeCommand('open', getAwesome('term_texts_ins'), function(args)
      --DIEDIEDEID(false)
      local txt = 'File not found.'
      local argStuff = {
          ['dave'] = "Forever lost and adrift.\nTrying to change his destiny.\nDespite this, it pulls him by a lead.\nIt doesn't matter to him though.\nHe has a child to feed.",
          ['bambi'] = "A forgotten GOD.\nThe truth will never be known.\nThe extent of his POWERs won't ever unfold.",
          ['god'] = "Artifact 1:\nA stone with symbols and writing carved into it.\nDescription:Its a figure that has hundreds of EYEs all across its body.\nNotes: Why does it look so much like Bambi?",
          ['artifact'] = "Artifact 1:\nA stone with symbols and writing carved into it.\nDescription:Its a figure that has hundreds of EYEs all across its body.\nNotes: Why does it look so much like Bambi?",
          ['eye'] = "Our LORD told us that he would remove one of his eyes everyday.\nHe tells me that he's doing this to save us.\nThat he might one day become unreasonable and we need to have faith in ourselves.\n...\nPlease, I promise you that's what he said. I-I'm not lying.\nDon't hurt me.",
          ['lord'] = "A being of many eyes. A being so wise. He gives it all up to ensure, that the golden one will have a bright future.",
          ['artifact2'] = "Artifact 2:\nAn almost entirely destroyed red robe.\nDescription: A red robe. \nIt has a symbol that resembles Bambi's hat, etched on it.",
          ['artifact3'] = "Artifact 3:\nA notebook, found on the floor of the 3D realm.\nNotes: I haven't bothered with the cypher yet.\nI have more important matters.",
          ['artifact4'] = "\"Artifact\" 4:\nA weird email, with attached images that use the same cypher as Artifact 3.\nNotes: Who sent this?",
          ['tristan'] = "The key to defeating the one whose name shall not be stated.\nA heart of gold that will never become faded.",
          ['expunged'] = "add later",
          ['deleted'] = "The unnamable never was a god and never will be. Just an accident.",
          ['exbungo'] = "[FAT AND UGLY.]",
          ['recurser'] = "A being of chaos that wants to spread ORDER.\nDespite this, his sanity is at the border.",
          ['moldy'] = "Let me show you my DS family!",
          ['1'] = "LOG 1\nHello. I'm currently writing this from in my lab.\nThis entry will probably be short.\nTristan is only 3 and will wake up soon.\nBut this is mostly just to test things. Bye.",
          ['2'] = "LOG 2\nI randomly turned 3-Dimensional again, but things were different this time...\nI appeared in a void with\nrandom red geometric shapes scattered everywhere and an unknown light source.\nWhat is that place?\nCan I visit it again?",
          ['3'] = "LOG 3\nI'm currently working on studying interdimensional dislocation.\nThere has to be a root cause. Some trigger.\nI hope there aren't any long term side effects.",
          ['4'] = "LOG 4\nI'm doing various tests on myself, trying to figure out what causes the POLYGONization.\nIt hurts a lot, \nBut I must keep a smile. For Tristan's sake.",
          ['5'] = "[FILE DELETED]",
          ['6'] = "LOG 6\nNot infront of Tristan. I almost lost him in that void. I- [DATA DELETED]",
          ['7'] = "LOG 7\nMy interdimensional dislocation appears to be caused by mass amount of stress.\nHow strange.\nMaybe I could isolate this effect somehow?",
          ['8'] = "LOG 8\nHey, Muko here. Dave recently called me to assist with the PROTOTYPE. \nIt's been kind of fun. He won't tell me what it does though.",
          ['9'] = "[FILE DELETED]",
          ['10'] = "LOG 10\nWorking on the prototype.",
          ['11'] = "[FILE DELETED]",
          ['12'] = "LOG 12\nThe prototype going pretty well.\nDave still won't tell me what this thing does.\nI can't figure it out even with the\nblue--prints.\nI managed to convince him to take a break and\ngo to Cicis Pizza with me and Maldo.\nHe brought Tristan long as well. It was fun.\n-Maldo",
          ['13'] = "[FILE DELETED]",
          ['14'] = "LOG 14\nI need to stop naming these numerically its getting confusing.",
          ['prototype'] = "Project <P.R.A.E.M>\nNotes: The SOLUTION.\nEstimated Build Time: 2 years.",
          ['solution'] = "I feel every ounce of my being torn to shreds and reconstructed with some parts removed.\nI can hear the electronical hissing of the machine.\nEvery fiber in my being is begging me to STOP.\nI don't.",
          ['stop'] = "A reflection that is always wrong now has appeared in his dreams.\nIt's a part thats now missing.\nA chunk out of his soul.",
          ['boyfriend'] = "LOG [REDACTED]\nA multiversal constant, for some reason. Must dive into further research.",
          ['order'] = "What is order? There are many definitions. Recurser doesn't use any of these though.\nThey want to keep everything the way they love it.\nTo them, that's order.",
          ['power'] = "[I HATE THEM.] [THEY COULD'VE HAD SO MUCH POWER, BUT THEY THREW IT AWAY.]\n[AND IN THAT HEAP OF UNWANTED POWER, I WAS CREATED.]",
          ['birthday'] = "Sent back to the void, a shattered soul encounters his broken <reflection>.",
          ['polygonized'] = "He will never be <free>.",
          ['polygon'] = "He will never be <free>.",
          ['3d'] = "He will never be <free>.",
          ['p.r.a.e.m'] = "Name: Power Removal And Extraction Machine\nProgress: Complete\nNotes: Took longer than expected. Tristans 7th BIRTHDAY is in a month.",
          ['cGVyZmVjdGlvbg'] = "[BLADE WOULD'VE BEEN PERFECT. BUT DAVE HAD TO REFUSE.]",
          ['bGlhcg'] = "LOG 331\nI refuse to put Tristan through the torture that is P.R.A.E.M. Especially for [DATA EXPUNGED]. Not now. Not ever.",
          ['YmVkdGltZSBzb25n'] = "Even when you're feeling blue.\nAnd the world feels like its crumbling around you.\nJust know that I'll always be there.\nI wish I knew, everything that will happen to you.\nBut I don't, and that's okay.\nAs long as I'm here you'll always see a sunny day.",
          ['Y29udmVyc2F0aW9u'] = "Log 336\nI encountered some entity in the void today.\nCalled me \"Out of Order\".\nIt mentioned [DATA EXPUNGED] and I asked it for help.\nI don't know if I can trust it but I don't really have\nany other options.",
          ['YXJ0aWZhY3QzLWE='] = "http://gg.gg/davetabase-artifact3",
          ['YmlydGhkYXk'] = "http://gg.gg/davetabase-birthday",
          ['ZW1haWw='] = "http://gg.gg/davetabase-mysterious-email"
      }
      if args[1] ~= nil and argStuff[args[1]:lower()] then
          txt = argStuff[args[1]:lower()]
      elseif args[1] ~= nil and argStuff[args[1]] then
          txt = argStuff[args[1]]
      end
      updateText('\n'..txt)
  end)
  makeCommand('help', getAwesome('term_help_ins'), function(args)
      --DIEDIEDEID(false)
      local awesomeText = ''
      for k,v in pairs(commands) do
          if v.showInHelp then
          	awesomeText = awesomeText..(v.name..' - '..v.help..'\n')
          end
      end
      updateText('\n'..awesomeText)
  end)
  makeCommand('clear', getAwesome('term_clear_ins'), function(args)
      displayText = ''
      updateText('')
  end)
  makeCommand('vault', getAwesome('term_vault_ins'), function(args)
      --DIEDIEDEID(false)
      local requiredStuff = {'free', 'reflection', 'p.r.a.e.m'}
      local numOfKeys = 0
      for k,v in pairs(requiredStuff) do
          if args[k] == v then
              numOfKeys = numOfKeys + 1
          end
      end
      if numOfKeys == 3 then
          updateText("\nVault unlocked.\ncGVyZmVjdGlvbg\nbGlhcg\nYmVkdGltZSBzb25n\ndGhlIG1lZXRpbmcgcDE=\ndGhlIG1lZXRpbmcgcDI=\nYmlydGhkYXk=\nZW1haWw=\nYXJ0aWZhY3QzLWE=")
      else
          updateText("\nInvalid keys. Valid keys: "..tostring(numOfKeys))
      end
  end)
  makeCommand('secret mod leak', getAwesome('term_leak_ins'), function(args)
      --print('entering secret leak!')
  end, false, true)
  displayText = getAwesome('term_introduction')
  displayText = displayText..'> '
  makeLuaText('terminalText', 0, 0, screenWidth, displayText, 32)
  setTextAlignment('terminalText', 'left')
  runHaxeCode[[
    var displayText = game.getLuaObject('terminalText');
    displayText.setFormat(Paths.font("fixedsys.ttf"), 16);
    displayText.size *= 2;
    displayText.antialiasing = false;
  ]]
  addLuaText('terminalText')
  --debugPrint('made everything')
  --debugPrint(awesomeHeight)
end

--boring stuff
awesomeHeight = 38.5
function onCreatePost()
  setProperty('camHUD.visible', false)
  setProperty('camGame.visible', false)
end
curCommand = ''
save = {}
function save.get(field, other)
  if field == nil then return nil end
  return getDataFromSave('DavePsychEngine', field, other)
end
function save.set(field, value)
  setDataFromSave('DavePsychEngine', field, value)
end
function onUpdate()
  local holdingShift = (runHaxeCode[[
    return FlxG.keys.pressed.SHIFT;
  ]])
  for k,v in pairs(keyList) do
    if keyboardJustPressed(k) then
      local thingToShow = ''
      if not holdingShift then
        thingToShow = v
      else
        -- --debugPrint('sdfs')
        if keyListUpper[k] ~= nil then
          thingToShow = keyListUpper[k]
        else
          thingToShow = v:upper()
        end
      end
      curCommand = curCommand..thingToShow
      updateText(thingToShow)
      playSound('terminal_space', 1, 'terminalKey')
    end
  end
  if keyJustPressed('accept') then
    -- --debugPrint('oh yeah do the command')
    local oldy = displayText
    -- displayText = displayText:sub(1, #displayText - #curCommand - 2) 
    -- updateText(curCommand) --add the command to the list
    runCommand(curCommand)
    curCommand = ''
    updateText('\n> ')
    updatePreviousText(false, oldy)
  elseif keyboardJustPressed('BACKSPACE') then
    deleteLastChar()
  end
  if keyboardPressed('BACKSPACE') then
    deleteHoldTime = deleteHoldTime + 1
  else
    deleteHoldTime = 0
    startedDeleting = false
  end
  if deleteHoldTime > 100 and not startedDeleting then
    startedDeleting = true
    runTimer('deleteLastChar', 0.05)
  end
end
function onTimerCompleted(tag)
  if tag == 'deleteLastChar' and deleteHoldTime > 0 then
    deleteLastChar()
    runTimer('deleteLastChar', 0.05)
  elseif tag == 'gofuckyourself' then
    os.execute('start https://www.youtube.com/watch?v=azMGySH8fK8')
    setPropertyFromClass('flixel.FlxG', 'autoPause', false)
    runTimer('exitGame', 0.25)
  elseif tag == 'exitGame' then
    os.exit(0)
  end
end
deleteHoldTime = 0
function deleteLastChar()
  if #curCommand > 0 then
    displayText = displayText:sub(1, -2)
    curCommand = curCommand:sub(1, -2)
    updateText('')
    -- --debugPrint('deleted')
  end
  playSound('terminal_bkspc', 1, 'terminalKey')
end
function makeCommand(name, help, func, showInHelp, oneCommand)
  if showInHelp == nil then
  	showInHelp = true
  end
  table.insert(commands, {
    name = name, 
    help = help, 
    func = func, 
    showInHelp = showInHelp, 
    oneCommand = oneCommand == true
  })
end
function getAwesome(name)
  local subLines = split(getTextFromFile('terminalList.txt'), '\n')
  local subs = {}
  for k,v in pairs(subLines) do
    if not stringStartsWith(v, '//') and #v > 1 then
      local definethings = split(v, '==')
      subs[definethings[1]] = definethings[2]
    end
  end
  return coolSub(coolSub(subs[name]:gsub("[\n\r]", " "), ':linebreak:', '\n'), ':addquote:', "'"):sub(1, -2);
end
function coolSub(str, getOutNowIdiot, hello)
  return runHaxeCode([[
    var str = "]]..str..[[";

    return StringTools.replace(str, "]]..getOutNowIdiot..[[", "]]..hello..[[");
  ]])
end
function updateText(thing)
    displayText = displayText..thing
    setTextString('terminalText', displayText)
end
function updatePreviousText(reset, prevShit)
  local newBit = string.sub(displayText, #prevShit, #displayText)
  -- --debugPrint(newBit)
  if getProperty('terminalText.height') > 720 then
    local lines = select(2, newBit:gsub('\n', '\n'))
    if lines == 0 then
      lines = 1
    end
    setProperty('terminalText.y', 720 - getProperty('terminalText.height'))
  end
end
function contains(tab, what)
    for k,v in pairs(tab) do
        if v == what then
            return true;
        end
    end
    return false; --psych engine is weird
end
function runCommand(what)
    args = split(what)
    local realArgs = {}
    for k,v in pairs(args) do
        if k ~= 1 then
            table.insert(realArgs, v)
        end
    end
    for k,v in pairs(commands) do
        if v.name == args[1] then
            v.func(realArgs)
            return v;
        end
    end
    --print('unknown command: '..args[1])
    updateText(getAwesome('term_unknown')..what.."'")
    return;
end
function split(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end
-- for k,v in pairs(commandsToRun) do
--     --print('running command:', v)
--     runCommand(v)
-- end

--a bunch of stuff

unformattedIdiots = {
    "period",
    "backslash",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "zero",
    "shift",
    "semicolon",
    "alt",
    "lbracket",
    "rbracket",
    "comma",
    "plus"
}
formattedAwesome = {
    ".",
    "/",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
    "",
    ";",
    "",
    "[",
    "]",
    ",",
    "="
}
-- commandsToRun = {
--     'characters'
-- } --for testing online
commands = {}
displayText = ''
psych = {}
keyList = { -- I hate my life ACTUALLY i dont cause i stole this from someone on the psych discord LOLOLOLOL
	A = "a",
	B = "b",
	C = "c",
	D = "d",
	E = "e",
	F = "f",
	G = "g",
	H = "h",
	I = "i",
	J = "j",
	K = "k",
	L = "l",
	M = "m",
	N = "n",
	O = "o",
	P = "p",
	Q = "q",
	R = "r",
	S = "s",
	T = "t",
	U = "u",
	V = "v",
	W = "w",
	X = "x",
	Y = "y",
	Z = "z",
	SPACE = " ",
	ZERO = "0",
	ONE = "1",
	TWO = "2",
	THREE = "3",
	FOUR = "4",
	FIVE = "5",
	SIX = "6",
	SEVEN = "7",
	EIGHT = "8",
	NINE = "9",
	NUMPADZERO= "0",
	NUMPADONE= "1",
	NUMPADTWO= "2",
	NUMPADTHREE= "3",
	NUMPADFOUR= "4",
	NUMPADFIVE= "5",
	NUMPADSIX= "6",
	NUMPADSEVEN= "7",
	NUMPADEIGHT= "8",
	NUMPADNINE= "9",
	NUMPADMINUS = "-",
	NUMPADPLUS = "+",
	NUMPADPERIOD = ".",
	NUMPADMULTIPLY = "*",
	LBRACKET = "[",
	RBRACKET = "]",
	BACKSLASH = "\\",
	SEMICOLON = ";",
	QUOTE = "'",
	COMMA = ",",
	PERIOD = ".",
	SLASH = "/",
	MINUS = "-",
	PLUS = "=",

}
keyListUpper = { -- I hate my life*@ (get it, because it's shif- I'll see myself out) --wtf ho ever made this is SO flippin unfunny!!
	ZERO = ")",
	ONE = "!",
	TWO = "@",
	THREE = "#",
	FOUR = "$",
	FIVE = "%",
	SIX = "^",
	SEVEN = "&",
	EIGHT = "*",
	NINE = "(",
	LBRACKET = "{",
	RBRACKET = "}",
	BACKSLASH = "|",
	SEMICOLON = ":",
	QUOTE = "\"",
	COMMA = "<",
	PERIOD = ">",
	SLASH = "?",
	-- GRAVEACCENT = "~",
	MINUS = "_",
	PLUS = "+",

}