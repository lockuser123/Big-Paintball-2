local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Retrax | Big Paintball 2",
    Icon = "door-open",
    Author = "by q105 | discord.gg/jEVhaP8sjr",
    Folder = "Retrax",
    
    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },

        local Tab = Window:Tab({
    Title = "Auto Farm",
    Icon = "target",
    Locked = false,
})

        local Tab = Window:Tab({
    Title = "`Target",
    Icon = "bird",
    Locked = false,
})
