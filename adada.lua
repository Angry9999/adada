wait(2)
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Gui Loaded", -- Required
	Text = "Gui installed successfully.", -- Required
  Text = "Made By r/angry099#1000.", -- Required
	Icon = "rbxassetid://1234567890" -- Optional
})
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Angry Hub", "LightTheme")

--Main
local Tab = Window:NewTab("Main")
local MainSection = Tab:NewSection("Main")

MainSection:NewButton("Fly ( Press E)", "Press once, otherwise it may work poorly.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Angry9999/FlyScript/main/Fly.lua'))()
end)

MainSection:NewButton("CtrlTP", "If you hold down ctrl and click somewhere, you will teleport there.", function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/Angry9999/Ctrltp/main/ctrltp.lua'))()
end)

MainSection:NewToggle("SuperHuman", "Go fast and jump height", function(state)
    if state then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 120
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 120
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
end)

MainSection:NewButton("Noclip", "Press once, otherwise it may work poorly.", function()
    local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() -- to toggle noclip() and clip()
end)
MainSection:NewButton("Infinite Yeild", "Open İnfinite Yeild", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


--LOCALPLAYER
local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Player")

PlayerSection:NewSlider("Walkspeed", "Change Walk Speed", 500, 16, function(s) -- 500 (MaxValue) | 16 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Change Jump Power", 350, 50, function(s) -- 350 (MaxValue) | 50 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewButton("Reset Jump/Walk", "Reset All", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)

--OTHER
local Other = Window:NewTab("Other")
local OtherSection = Other:NewSection("Other")

OtherSection:NewButton("Chat Spoofer", "Let's you chat for other people.", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Angry9999/ChatSpoofer0/main/ChatSpoofer.lua'),true))()
end)

OtherSection:NewButton("Esp", "See All People", function()
    local color = BrickColor.new(50,0,250)
local transparency = .8

local Players = game:GetService("Players")
local function _ESP(c)
  repeat wait() until c.PrimaryPart ~= nil
  for i,p in pairs(c:GetChildren()) do
    if p.ClassName == "Part" or p.ClassName == "MeshPart" then
      if p:FindFirstChild("shit") then p.shit:Destroy() end
      local a = Instance.new("BoxHandleAdornment",p)
      a.Name = "shit"
      a.Size = p.Size
      a.Color = color
      a.Transparency = transparency
      a.AlwaysOnTop = true    
      a.Visible = true    
      a.Adornee = p
      a.ZIndex = true    

    end
  end
end
local function ESP()
  for i,v in pairs(Players:GetChildren()) do
    if v ~= game.Players.LocalPlayer then
      if v.Character then
        _ESP(v.Character)
      end
      v.CharacterAdded:Connect(function(chr)
        _ESP(chr)
      end)
    end
  end
  Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(chr)
      _ESP(chr)
    end)  
  end)
end
ESP()
end)

--CREDİT
local Credit = Window:NewTab("Credit")
local CreditSection = Credit:NewSection("Credit")

CreditSection:NewButton("Made By r/angry099#1000", ".", function()
    
end)
CreditSection:NewButton("Click To Copy Discord Server", ".", function()
    setclipboard("https://discord.gg/FSfdZ724cS")
    game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Successful", -- Required
	Text = "Copied Discord Link", -- Required
	Icon = "rbxassetid://1234567890" -- Optional
})
end)
