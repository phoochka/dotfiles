
-- caffiene in hammerspoon
local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("☕️ ")
    else
        caffeine:setTitle("💤 ")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

-- switch fn F-keys 
local fn = hs.menubar.new()

function functionClicked()
	hs.osascript.applescript([[
		tell application "System Preferences"
			reveal anchor "keyboardTab" of pane "com.apple.preference.keyboard"
		end tell
		tell application "System Events" to tell process "System Preferences"
			click checkbox 1 of tab group 1 of window 1
		end tell
		quit application "System Preferences"
     ]])
end

if fn then 
    fn:setTitle("F")
	fn:setClickCallback(functionClicked)
end
 



-- paste
hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)

-- window auto-sizing
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, ",", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + 20
    f.y = max.y + 20
    f.w = (max.w / 2) - 40
    f.h = max.h - 40
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, ".", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2) + 20
    f.y = max.y + 20
    f.w = (max.w / 2) - 40
    f.h = max.h - 40
    win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x 
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

-- Config reload
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")


-- loading menubar
local menubar = require 'menubar'
menubar.init()

-- dofile("anycomplete.lua")
