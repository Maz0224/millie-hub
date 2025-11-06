local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()

-- variables & functions -- 
_G.infwins = false
_G.infst = false

local function infwins()
	while _G.infwins do
		game:GetService("ReplicatedStorage").Remotes.Events.AddWinsToPlayer:FireServer(1000000000)
		task.wait(0.01)
	end
end

local function infst()
	while _G.infst do
		game:GetService("ReplicatedStorage").Remotes.Events.CurrencyCollected:FireServer(10000000, "Strength")
		task.wait(0.01)
	end
end

local Window = Luna:CreateWindow({
	Name = "Millie X2", -- This Is Title Of Your Window
	Subtitle = "Fling Yourself Script", -- A Gray Subtitle next To the main title.
	LogoID = nil, -- The Asset ID of your logo. Set to nil if you do not have a logo for Luna to use.
	LoadingEnabled = true, -- Whether to enable the loading animation. Set to false if you do not want the loading screen or have your own custom one.
	LoadingTitle = "Millie • V2", -- Header for loading screen
	LoadingSubtitle = "by maz24", -- Subtitle for loading screen

	ConfigSettings = {
		RootFolder = nil, -- The Root Folder Is Only If You Have A Hub With Multiple Game Scripts and u may remove it. DO NOT ADD A SLASH
		ConfigFolder = "Big Hub" -- The Name Of The Folder Where Luna Will Store Configs For This Script. DO NOT ADD A SLASH
	},

	KeySystem = false, -- As Of Beta 6, Luna Has officially Implemented A Key System!
	KeySettings = {
		Title = "Luna Example Key",
		Subtitle = "Key System",
		Note = "Best Key System Ever! Also, Please Use A HWID Keysystem like Pelican, Luarmor etc. that provide key strings based on your HWID since putting a simple string is very easy to bypass",
		SaveInRoot = false, -- Enabling will save the key in your RootFolder (YOU MUST HAVE ONE BEFORE ENABLING THIS OPTION)
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		Key = {"Example Key"}, -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
		SecondAction = {
			Enabled = true, -- Set to false if you do not want a second action,
			Type = "Link", -- Link / Discord.
			Parameter = "" -- If Type is Discord, then put your invite link (DO NOT PUT DISCORD.GG/). Else, put the full link of your key system here.
		}
	}
})

Window:CreateHomeTab({
	SupportedExecutors = {"Delta", "Solara", "Xeno", "Krnl", "Wave"}, -- A Table Of Executors Your Script Supports. Add strings of the executor i for each executor.
	DiscordInvite = "1234", -- The Discord Invite Link. Do Not Include discord.gg/ | Only Include the code.
	Icon = 1, -- By Default, The Icon Is The Home Icon. If You would like to change it to dashboard, replace the interger with 2
})

-- PLAYER TAB --

local playerTab = Window:CreateTab({
	Name = "Player",
	Icon = "account_circle",
	ImageSource = "Material",
	ShowTitle = true -- This will determine whether the big header text in the tab will show
})

playerTab:CreateSection("Local Player")

local WalkSpeedSlider = playerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 999},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
}, "Slider")

local JumpPowerSlider = playerTab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 999},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
}, "Slider")

-- ROOM TAB --

local gameTab = Window:CreateTab({
	Name = "Game",
	Icon = "gamepad",
	ImageSource = "Material",
	ShowTitle = true -- This will determine whether the big header text in the tab will show
})

local Toggle = gameTab:CreateToggle({
	Name = "Infinite Wins",
	Description = nil,
	CurrentValue = false,
    	Callback = function(Value)
			_G.infwins = Value
			infwins()
    	end
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Toggle = gameTab:CreateToggle({
	Name = "Infinite Strength",
	Description = nil,
	CurrentValue = false,
    	Callback = function(Value)
			_G.infst = Value
			infst()
    	end
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

