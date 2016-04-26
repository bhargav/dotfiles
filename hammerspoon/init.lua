hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
    hs.alert.show("Config Reloaded")
end)

hs.hotkey.bind({"cmd", "j"}, "s", function()
    hs.application.launchOrFocus("Spotify.app")
end