function onCreate()
	-- background shit
	makeLuaSprite('backgrounds/office/office', 'backgrounds/office/office', -600, -300);
	setScrollFactor('backgrounds/office/office', 0.9, 0.9);

	addLuaSprite('backgrounds/office/office', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end
