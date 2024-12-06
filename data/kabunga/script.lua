function onCreatePost()
    for strumLineNotes = 0,7 do
        if strumLineNotes < 4 then
            setPropertyFromGroup('strumLineNotes', strumLineNotes,'texture','notes/NOTE_assets_3D')
        end
    end
end

function onUpdate()
    for notesLength = 0,getProperty('notes.length') do
       if getPropertyFromGroup('notes', notesLength,'mustPress') == false and getPropertyFromGroup('notes', notesLength,'noteType') == '' then
           setPropertyFromGroup('notes',notesLength,'texture','notes/NOTE_assets_3D')
        end
    end
end

--function onCreatePost()
--    setProperty('defaultCamZoom',0.75)
--end