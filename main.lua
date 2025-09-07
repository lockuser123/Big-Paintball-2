local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- Basic Window
local Window = WindUI:CreateWindow({
    Title = "My Script",
    Icon = "geist:window",
    Author = "Loaded",
    Folder = "WindUI_Script",
    Size = UDim2.fromOffset(580, 490),
    Theme = "Dark",
    Acrylic = true,
    SideBarWidth = 200,
    HideSearchBar = true,
    User = { Enabled = false }
})

-- Tags
Window:Tag({
    Title = "v1.0",
    Color = Color3.fromRGB(48, 255, 106)
})

-- Topbar theme switcher
Window:CreateTopbarButton("theme-switcher", "moon", function()
    WindUI:SetTheme(WindUI:GetCurrentTheme() == "Dark" and "Light" or "Dark")
end, 990)

-- Main Sections
local Tabs = {
    Player = Window:Section({ Title = "Player", Opened = true }),
    Target = Window:Section({ Title = "Target", Opened = true }),
    AutoFarm = Window:Section({ Title = "AutoFarm", Opened = true })
}

-- Player Tab Example
local PlayerTab = Tabs.Player:Tab({ Title = "Player Options", Icon = "user" })
PlayerTab:Paragraph({
    Title = "Player Controls",
    Desc = "Modify your player settings here."
})
PlayerTab:Toggle({
    Title = "God Mode",
    Value = false,
    Callback = function(state)
        print("God Mode:", state)
    end
})

-- Target Tab Example
local TargetTab = Tabs.Target:Tab({ Title = "Target Options", Icon = "crosshair" })
TargetTab:Paragraph({
    Title = "Target System",
    Desc = "Target related settings."
})
TargetTab:Dropdown({
    Title = "Select Target",
    Values = { "Enemy1", "Enemy2", "Enemy3" },
    Value = "Enemy1",
    Callback = function(selected)
        print("Selected Target:", selected)
    end
})

-- AutoFarm Tab Example
local FarmTab = Tabs.AutoFarm:Tab({ Title = "AutoFarm Options", Icon = "cpu" })
FarmTab:Paragraph({
    Title = "AutoFarm System",
    Desc = "Automated farming features."
})
FarmTab:Toggle({
    Title = "Enable AutoFarm",
    Value = false,
    Callback = function(state)
        print("AutoFarm:", state)
    end
})

-- Window Events
Window:OnClose(function()
    print("Window closed")
end)

Window:OnDestroy(function()
    print("Window destroyed")
end)
