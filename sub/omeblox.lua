local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()

local Window = Luna:CreateWindow({
	Name = "Millie X2", -- This Is Title Of Your Window
	Subtitle = "Universal Script", -- A Gray Subtitle next To the main title.
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

local roomTab = Window:CreateTab({
	Name = "Room",
	Icon = "room",
	ImageSource = "Material",
	ShowTitle = true -- This will determine whether the big header text in the tab will show
})

local Button = roomTab:CreateButton({
	Name = "Connect!",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("storage_remotes", 9e9):WaitForChild("remotes_room", 9e9):WaitForChild("room_client", 9e9):WaitForChild("RequestQueue", 9e9):FireServer()
    	end
})

local Button = roomTab:CreateButton({
	Name = "Disconnect!",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("storage_remotes", 9e9):WaitForChild("remotes_room", 9e9):WaitForChild("room_client", 9e9):WaitForChild("RequestStop", 9e9):FireServer()
    	end
})

roomTab:CreateDivider()

local Input = Tab:CreateInput({
	Name = "Type in chat!",
	Description = nil,
	PlaceholderText = "Enter Message",
	CurrentValue = "", -- the current text
	Numeric = false, -- When true, the user may only type numbers in the box (Example walkspeed)
	MaxCharacters = nil, -- if a number, the textbox length cannot exceed the number
	Enter = true, -- When true, the callback will only be executed when the user presses enter.
    	Callback = function(Text)
      game:GetService("ReplicatedStorage"):WaitForChild("storage_remotes", 9e9):WaitForChild("remotes_room", 9e9):WaitForChild("room_client", 9e9):WaitForChild("RequestMessage", 9e9):FireServer(Text)
    	end
}, "Input") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlapsgame:GetService("ReplicatedStorage"):WaitForChild("storage_remotes", 9e9):WaitForChild("remotes_room", 9e9):WaitForChild("room_client", 9e9):WaitForChild("RequestMessage", 9e9):FireServer(Text)
