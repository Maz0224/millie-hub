local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Millie Hub",
    Icon = "code",
    Author = Universal Script",
    Folder = "millie"
  })

local player = Window:Tab({
    Title = "Player",
    Icon = "user-cog", -- optional
    Locked = false,
})

local Slider = player:Slider({
    Title = "Walk Speed",
    Desc = "",
    Step = 1,
    Value = {
        Min = 0,
        Max = 256,
        Default = 16,
    },
    Callback = function(value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

local Slider = player:Slider({
    Title = "Jump Power",
    Desc = "",
    Step = 1,
    Value = {
        Min = 0,
        Max = 256,
        Default = 50,
    },
    Callback = function(value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})
