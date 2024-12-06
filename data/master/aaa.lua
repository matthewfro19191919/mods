function onUpdate(elapsed)
	if mustHitSection then
		setProperty('defaultCamZoom', 0.5)
	else
		setProperty('defaultCamZoom', 0.7)
	end
end