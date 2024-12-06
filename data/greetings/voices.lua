function onCreatePost()
    if boyfriendName == 'shaggy' or boyfriendName == 'redshaggy' or boyfriendName  == 'supershaggy' or boyfriendName == 'godshaggy' then
        addHaxeLibrary('FlxSound', 'flixel.system')
        runHaxeCode([[
            game.vocals = new FlxSound().loadEmbedded(Paths.returnSound('songs', Paths.formatToSongPath("greetings") + '/VoicesShaggy'));
            FlxG.sound.list.add(game.vocals);
        ]])
   end
    if boyfriendName == 'bf' or boyfriendName == 'dave-fnaf' then
        addHaxeLibrary('FlxSound', 'flixel.system')
        runHaxeCode([[
            game.vocals = new FlxSound().loadEmbedded(Paths.returnSound('songs', Paths.formatToSongPath("greetings") + '/Voices'));
            FlxG.sound.list.add(game.vocals);
        ]])
    end
end
