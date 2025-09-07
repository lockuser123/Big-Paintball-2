--// Load WindUI
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

--// Main Window
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

--// Tabs
local Tabs = {
    AutoFarm = Window:Section({ Title = "AutoFarm", Opened = true })
}

--// Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- Session ID for debug
local SessionID = string.gsub(tostring(math.random()):sub(3), "%d", function(c)
    return string.char(96 + math.random(1, 26))
end)

print("✅ | Running BigPaintball2.lua GUI Version [SessionID " .. SessionID .. "]")

-- Error handling
local function safeExecute(func)
    local success, errorMessage = pcall(func)
    if not success then
        warn("⛔ | Error occurred: " .. errorMessage .. " [SessionID " .. SessionID .. "]")
    end
end

-- Teleport enemies/entities
local function teleportEntities(cframe, team)
    local spawnPosition = cframe * CFrame.new(0, 0, -15)

    for _, entity in ipairs(Workspace.__THINGS.__ENTITIES:GetChildren()) do
        if entity:FindFirstChild("HumanoidRootPart") then
            local hrp = entity.HumanoidRootPart
            hrp.CanCollide = false
            hrp.Anchored = true
            hrp.CFrame = spawnPosition
        elseif entity:FindFirstChild("Hitbox") then
            local directory = entity:GetAttribute("Directory")
            if not (directory == "White" and entity:GetAttribute("OwnerUID") == LocalPlayer.UserId) and 
               (not team or directory ~= team.Name) then
                entity.Hitbox.CanCollide = false
                entity.Hitbox.Anchored = true
                entity.Hitbox.CFrame = spawnPosition * CFrame.new(math.random(-5,5),0,math.random(-5,5))
            end
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if not team or team.Name ~= player.Team.Name then
                if not player.Character:FindFirstChild("ForceField") then
                    local hrp = player.Character.HumanoidRootPart
                    hrp.CanCollide = false
                    hrp.Anchored = true
                    hrp.CFrame = spawnPosition * CFrame.new(math.random(-5,5),0,math.random(-5,5))
                end
            end
        end
    end
end

-- AutoFarm
local AutoFarmEnabled = false

task.spawn(function()
    while task.wait(0.1) do
        safeExecute(function()
            if AutoFarmEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                teleportEntities(LocalPlayer.Character.HumanoidRootPart.CFrame, LocalPlayer.Team)
            end
        end)
    end
end)

-- AutoFarm Tab
local FarmTab = Tabs.AutoFarm:Tab({ Title = "AutoFarm Options", Icon = "cpu" })
FarmTab:Paragraph({ Title = "AutoFarm System", Desc = "Toggle AutoFarm on or off." })
FarmTab:Toggle({
    Title = "Enable AutoFarm",
    Value = false,
    Callback = function(state)
        AutoFarmEnabled = state
        print((state and "✅ Enabled" or "❌ Disabled") .. " AutoFarm [SessionID " .. SessionID .. "]")
    end
})
