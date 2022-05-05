local log   = hs.logger.new('stackline', 'info')

stackline = require "stackline"
stackline:init()

--- start quick open applications 
function open_app(name)
    return function()
        apps = hs.application.runningApplications()
        for i, app in ipairs(apps) do
            log.i('test::::::::::::::::', app)
            log.i('test::::::::::::::::', app:bundleID())
        end
        app = hs.application.get(name) 
        hs.notify.new({title="Hammerspoon", informativeText="fdaafd"}):send()
        if app == nil then
            log.i('not launched', name)
        elseif app:isFrontmost() then
            app:hide()
        elseif app:isHidden() or app:isRunning() then
            app:activate(app:allWindows())
        else
            log.i('test::::::::::::::::', app)
        end
    end
end

--- quick open applications
hs.hotkey.bind({"cmd"}, ".", open_app("io.alacritty"))
hs.hotkey.bind({"control", "shift"}, "W", open_app("com.tencent.xinWeChat"))
hs.hotkey.bind({"control", "shift"}, "P", open_app("com.cocoatech.PathFinder"))
hs.hotkey.bind({"control", "shift"}, "S", open_app("com.spotify.client"))
hs.hotkey.bind({"control", "shift"}, "T", open_app("abnerworks.Typora"))
hs.hotkey.bind({"control", "shift"}, "O", open_app("md.obsidian"))
hs.hotkey.bind({"control", "shift"}, "Q", open_app("com.tencent.qq"))







function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
