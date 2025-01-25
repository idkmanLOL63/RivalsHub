local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "RivalsHub",
   Icon = 0,
   LoadingTitle = "LOADING OMGGGGG",
   LoadingSubtitle = "by Sirius",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local dhlock = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/DH-Lua-Lock/refs/heads/main/Main.lua"))()

-- 1. Load the library
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

local espTab = Window:CreateTab("Visuals", "eye")
local Section = espTab:CreateSection("Esp Settings")

local Toggle = espTab:CreateToggle({
   Name = "Esp Box",
   CurrentValue = false,
   Flag = "Toggle1", 
   Callback = function(Value)
       -- 2. Change the configuration based on toggle state
       if Value then
           Sense.teamSettings.enemy.enabled = true
           Sense.teamSettings.enemy.box = true
           Sense.teamSettings.enemy.boxColor[1] = Color3.new(255, 255, 255)

           -- 3. Load the ESP when it's enabled
           Sense.Load()
       else
           -- Disable ESP when toggle is off
           Sense.teamSettings.enemy.enabled = false
           Sense.teamSettings.enemy.box = false

           -- Optionally, you can unload ESP if needed (not required, but it's cleaner)
           Sense.Unload()
       end
   end,
})

local aimbotTab = Window:CreateTab("Main", "crosshair") -- Title, Image
local Section = aimbotTab:CreateSection("Aimbot Settings")
local Toggle = aimbotTab:CreateToggle({
   Name = "Aimbot",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    getgenv().dhlock.enabled = Value
   end,
})

 local Toggle = aimbotTab:CreateToggle({
    Name = "fov",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
       getgenv().dhlock.showfov = Value
    end,
 })


local Slider = aimbotTab:CreateSlider({
   Name = "fov",
   Range = {0, 300},
   Increment = 10,
   Suffix = "FOV",
   CurrentValue = 50,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    getgenv().dhlock.fov = Value
   end,
})

local Section = aimbotTab:CreateSection("Players Settings")

local Slider = aimbotTab:CreateSlider({
   Name = "Player Speed",
   Range = {16, 1000},
   Increment = 1,
   Suffix = "WS",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Section = MiscTab:CreateSection("Xray Settings")

local Toggle = MiscTab:CreateToggle({
    Name = "X-ray",
    CurrentValue = false,
    Flag = "ToggleXray", -- Unique flag for configuration saving
    Callback = function(Value)
        if Value then
            -- Enable X-ray: Set transparency for all parts to make them visible through walls
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.LocalTransparencyModifier = 0.5 -- Adjust transparency for X-ray effect
                end
            end
            print("X-ray Enabled")
        else
            -- Disable X-ray: Reset transparency back to normal
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.LocalTransparencyModifier = 0 -- Reset transparency to normal
                end
            end
            print("X-ray Disabled")
        end
    end,
})

local Toggle = aimbotTab:CreateToggle({
   Name = "SilentAim x Esp (Rivals and maybe detected)",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      loadstring(game:HttpGet("https://raw.githubusercontent.com/idkmanLOL63/idkk/refs/heads/main/sss"))()
   end,
})
