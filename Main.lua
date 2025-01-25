local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "RivalsHub",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "RivalsHub is loading...",
    LoadingSubtitle = "by idk",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()
 local dhlock = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/DH-Lua-Lock/refs/heads/main/Main.lua"))()
 local speed = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Lua-Speed/refs/heads/main/speed.lua"))()

 local MainTab = Window:CreateTab("Main", 4483362458)

 local Section = MainTab:CreateSection("Aim Settings")

 local Toggle = MainTab:CreateToggle({
    Name = "Silent Aim x ESP (Maybe Detected)",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/idkmanLOL63/idkk/refs/heads/main/sss"))()
    end,
 })

local Toggle = MainTab:CreateToggle({
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

local Toggle = MainTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
     getgenv().dhlock.enabled = Value
    end,
 })

 local Toggle = MainTab:CreateToggle({
    Name = "fov",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
       getgenv().dhlock.showfov = Value
    end,
 })

 local Slider = MainTab:CreateSlider({
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
 
 local Section = MainTab:CreateSection("Player Settings")

 local Toggle = MainTab:CreateToggle({
    Name = "Enabled Speed",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        getgenv().speed.enabled = Value
    end,
 })
 
 
 local Slider = MainTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 0,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        getgenv().speed.speed = Value
    end,
 })
