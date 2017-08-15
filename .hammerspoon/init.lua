-- require 'launcher'

local hyper = {"ctrl", "alt", "cmd"}
local hyper_sh = {"ctrl", "alt", "cmd", "shift"}
local ca = {"ctrl", "alt"}

local hotkey = require "hs.hotkey"
local tiling = require "hs.tiling"

-- Launch applications
hotkey.bind(ca, '1', function () hs.application.launchOrFocus("iTerm 3") end)
hotkey.bind(ca, '2', function () hs.application.launchOrFocus("Google Chrome") end)
-- Launch WorkFlowy
hotkey.bind(ca, '3', function () hs.application.launchOrFocus("/Users/adithya/Applications/Chrome Apps.localized/Default koegeopamaoljbmhnfjbclbocehhgmkm.app") end)

--------
--Tiling
--------

hotkey.bind(hyper, "c", function() tiling.cycleLayout() end)
hotkey.bind(hyper, "j", function() tiling.cycle(1) end)
hotkey.bind(hyper, "k", function() tiling.cycle(-1) end)
hotkey.bind(hyper, "space", function() tiling.promote() end)
hotkey.bind(hyper, "f", function() tiling.goToLayout("fullscreen") end)
hotkey.bind(hyper, "v", function() tiling.goToLayout("main-vertical") end)
hotkey.bind(hyper, "h", function() tiling.goToLayout("main-horizontal") end)
hotkey.bind(hyper, "b", function() tiling.goToLayout("gp-vertical") end)
hotkey.bind(hyper, "g", function() tiling.goToLayout("gp-horizontal") end)

-- If you want to set the layouts that are enabled
tiling.set('layouts', {
  'fullscreen', 'main-vertical', 'main-horizontal', 'gp-vertical', 'gp-horizontal'
})

-- require 'moveWindowOneSpace'

-- disable animation
hs.window.animationDuration = 0
-----------------------------------------------
 -- hyper_sh h for left one half window
-----------------------------------------------
hs.hotkey.bind(hyper_sh, "h", function()
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

-----------------------------------------------
 -- hyper_sh l for right one half window
-----------------------------------------------
hs.hotkey.bind(hyper_sh, "l", function()
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

-----------------------------------------------
 -- hyper_sh b for fullscreen
-----------------------------------------------
hs.hotkey.bind(hyper_sh, "b", function()
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

-----------------------------------------------
 -- hyper_sh u for top left one quarter window
-----------------------------------------------
hs.hotkey.bind(hyper_sh, "u", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
 win:setFrame(f)
end)
-----------------------------------------------
 -- hyper_sh i for top right one quarter window
-----------------------------------------------
hs.hotkey.bind(hyper_sh, "i", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-----------------------------------------------
 -- hyper_sh m for bottom right one quarter window
-----------------------------------------------
hs.hotkey.bind(hyper_sh, "m", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-----------------------------------------------
 -- hyper_sh n for bottom left one quarter window
-----------------------------------------------
hs.hotkey.bind(hyper_sh, "n", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-----------------------------------------------
 -- hyper i to show window hints
-----------------------------------------------

hs.hotkey.bind(hyper, 'i', function()
     hs.hints.windowHints()
end)

-----------------------------------------------
 -- hyper yuio to focus specific windows 
-----------------------------------------------

-----------------------------------------------
 -- hyper hjkl to switch window focus
-----------------------------------------------
--hs.hotkey.bind(hyper, 'k', function()
    --if hs.window.focusedWindow() then
        --hs.window.focusedWindow():focusWindowNorth()
    --else
        --hs.alert.show("No active window")
    --end
--end)

--hs.hotkey.bind(hyper, 'j', function()
    --if hs.window.focusedWindow() then
        --hs.window.focusedWindow():focusWindowSouth()
    --else
        --hs.alert.show("No active window")
    --end
--end)

--hs.hotkey.bind(hyper, 'l', function()
    --if hs.window.focusedWindow() then
    --hs.window.focusedWindow():focusWindowEast()
    --else
        --hs.alert.show("No active window")
    --end
--end)

--hs.hotkey.bind(hyper, 'h', function()
    --if hs.window.focusedWindow() then
        --hs.window.focusedWindow():focusWindowWest()
    --else
        --hs.alert.show("No active window")
    --end
--end)
-----------------------------------------------
 -- Hyper ,. to move spaces
-----------------------------------------------
function moveonespaceright()
  local keyevent = hs.eventtap.event.newkeyevent(hyper, '.', true)
  keyevent:post()
end

function moveonespaceleft()
  local keyevent = hs.eventtap.event.newkeyevent(hyper, ',', true)
  keyevent:post()
end

-----------------------------------------------
 -- hyper_sh op to move window between screens 
-----------------------------------------------

hs.hotkey.bind(hyper_sh, 'o', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(hyper_sh, "p", hs.grid.pushWindowPrevScreen)

-----------------------------------------------
 -- Function to move windows between spaces - currently unbound.
-----------------------------------------------
function movewindowonespace(direction)
   local mouseorigin = hs.mouse.getabsoluteposition()
   local win = hs.window.focusedwindow()
   local clickpoint = win:zoombuttonrect()

   clickpoint.x = clickpoint.x + clickpoint.w + 5
   clickpoint.y = clickpoint.y + (clickpoint.h / 2)

   local mouseclickevent = hs.eventtap.event.newmouseevent(hs.eventtap.event.types.leftmousedown, clickpoint)
   mouseclickevent:post()
   hs.timer.usleep(150000)

   local nextspacedownevent = hs.eventtap.event.newkeyevent({"ctrl"}, direction, true)
   nextspacedownevent:post()
   hs.timer.usleep(150000)

   local nextspaceupevent = hs.eventtap.event.newkeyevent({"ctrl"}, direction, false)
   nextspaceupevent:post()
   hs.timer.usleep(150000)

   local mousereleaseevent = hs.eventtap.event.newmouseevent(hs.eventtap.event.types.leftmouseup, clickpoint)
   mousereleaseevent:post()
   hs.timer.usleep(150000)

   hs.mouse.setabsoluteposition(mouseorigin)
end

-- hs.hotkey.bind(hyper_sh, '.', movewindowonespace('right'))
-- hs.hotkey.bind(hyper_sh, ',', movewindowonespace('left'))


-----------------------------------------------
 -- Work in progress - hyper 1 to create a "workspace" (automatically launch standard windows) 
-----------------------------------------------

--[[
hs.hotkey.bind(hyper, '1', function()
  os.execute('open http://workflowy.com http://mail.google.com http://calendar.google.com')
  moveonespaceright()
  hs.timer.usleep(150000)
  hs.application.launchorfocus('iterm')
  moveonespaceright()
  hs.timer.usleep(150000)
  hs.application.launchorfocus('spotify')
  hs.application.launchorfocus('chrome')
end)
--]]
--
--
--
-- smart app launch or focus or cycle windows
function smartLaunchOrFocus(launchApps)
  local frontmostWindow = hs.window.frontmostWindow()
  local runningApps     = hs.application.runningApplications()
  local runningWindows  = {}

  -- filter running applications by apps array
  local runningApps = hs.fnutils.map(launchApps, function(launchApp)
    return hs.application.get(launchApp)
  end)

  -- create table of sorted windows per application
  hs.fnutils.each(runningApps, function(runningApp)
    local standardWindows = hs.fnutils.filter(runningApp:allWindows(), function(win)
      return win:isStandard()
    end)

    table.sort(standardWindows, function(a, b) return a:id() < b:id() end)

    runningWindows = standardWindows
  end)

  if #runningApps == 0 then
    -- if no apps are running then launch first one in list
    ext.app.forceLaunchOrFocus(launchApps[1])
  elseif #runningWindows == 0 then
    -- if some apps are running, but no windows - force create one
    ext.app.forceLaunchOrFocus(runningApps[1]:title())
  else
    -- check if one of windows is already focused
    local currentIndex = hs.fnutils.indexOf(runningWindows, frontmostWindow)

    if not currentIndex then
      -- if none of them is selected focus the first one
      runningWindows[1]:focus()
    else
      -- otherwise cycle through all the windows
      local newIndex = currentIndex + 1
      if newIndex > #runningWindows then newIndex = 1 end

      runningWindows[newIndex]:focus()
    end
  end
end


--hs.hotkey.bind(hyper, 'y', function () LaunchOrFocus("iTerm") end)
--hs.hotkey.bind(hyper, 'u', function () smartLaunchOrFocus("Google Chrome") end)

-----------------------------------------------
 -- reload config on write 
-----------------------------------------------
function reload_config(files)
  hs.reload()
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("config loaded")


-----------------------------------------------
 -- cmd-ctrl+1
-----------------------------------------------
-- This doesn't work too well because it requires desktop switching
--hs.hotkey.bind({"cmd", "ctrl"}, "1", function()
--  hs.application.launchOrFocus("Terminal")
--end)
