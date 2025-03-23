function onCreatePost()
    if boyfriendName == 'shaggy' or boyfriendName == 'redshaggy' or boyfriendName  == 'supershaggy' or boyfriendName == 'godshaggy' then
         setProperty("gfGroup.visible", false)
         addLuaScript('extra keys hscript')
	     runHaxeCode('game.setOnLuas("keyCount", 12)')
   end
    if boyfriendName == 'bf' or boyfriendName == 'dave-fnaf' then
         setProperty("gfGroup.visible", true)
    end
end
