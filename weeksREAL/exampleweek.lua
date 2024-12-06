--example of a week file
--make sure to add the week to your wanted pack in stages/title.lua !!!!
local week = {
  songs = {
    {
      'Song-Json', --name of song json
      'icon', --name of icon (works like normal psych engine)
      'color', --color (more info below)
      'saveRequirement' --name of the save that needs to be true for the song to appear in freeplay
    },
    {
      'THERECANBEASMUCHSONGSASYOUWANT!!!!!!!!!!!!!!!!!!!', --name of song json
      'icon', --name of icon (works like normal psych engine)
      'color', --color (more info below)
      'saveRequirement' --name of the save that needs to be true for the song to appear in freeplay
    }
  },
  color = 'SONG_SPECIFIC', --set to a normal color for every song in this week to use this color
  storyColor = 'color', --color that appears in the background in the story mode menu
  banner = 'banner name', --name of the banner in images/title/weekBanners
  name = 'The week name!' -- name to appear in the top right
}
return week;