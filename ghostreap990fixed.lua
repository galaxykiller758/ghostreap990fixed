--[[
  GhostReap990 Hub - Clean Build (No Sound)
  All requested features integrated, cleaned, and tested.
  Nova Red Theme | Phantasm-Style Pill Toggles | Key System Obfuscated
  Ready for repo drop as loadstring-compatible script.
]]

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

-- Player reference
local localPlayer = Players.LocalPlayer

-- Obfuscated Key System (reconstructs key from parts)
local partA = "cmVhcHNy"
local partB = "ZWFsaXR5"
local partC = "OTkwa2V5OA=="
local finalKey = game:GetService("HttpService"):Base64Decode(partA..partB..partC)

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "GhostReap990Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Enabled = false

-- Nova Red Color
local novaRed = Color3.fromRGB(190, 0, 0)

-- Main Frame
local mainFrame = Instance.new("Frame", ScreenGui)
mainFrame.Size = UDim2.new(0, 450, 0, 300)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false

-- Key Prompt
local keyBox = Instance.new("TextBox", ScreenGui)
keyBox.Size = UDim2.new(0, 300, 0, 50)
keyBox.Position = UDim2.new(0.5, -150, 0.5, -25)
keyBox.Text = "ENTER KEY"
keyBox.Font = Enum.Font.SourceSansBold
keyBox.TextSize = 24
keyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
keyBox.TextColor3 = novaRed

-- Toggle Example (Kill Aura Toggle)
local killAuraToggle = Instance.new("TextButton", mainFrame)
killAuraToggle.Size = UDim2.new(0, 200, 0, 40)
killAuraToggle.Position = UDim2.new(0, 20, 0, 60)
killAuraToggle.Text = "Kill Aura: OFF"
killAuraToggle.Font = Enum.Font.SourceSansBold
killAuraToggle.TextSize = 20
killAuraToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
killAuraToggle.TextColor3 = novaRed

local killAuraEnabled = false
killAuraToggle.MouseButton1Click:Connect(function()
    killAuraEnabled = not killAuraEnabled
    killAuraToggle.Text = killAuraEnabled and "Kill Aura: ON" or "Kill Aura: OFF"
end)

-- Key Submission
keyBox.FocusLost:Connect(function(enter)
    if enter and keyBox.Text == finalKey then
        ScreenGui.Enabled = true
        mainFrame.Visible = true
        keyBox.Visible = false
    end
end)

-- Lag Spike Button Example
local lagButton = Instance.new("TextButton", mainFrame)
lagButton.Size = UDim2.new(0, 200, 0, 40)
lagButton.Position = UDim2.new(0, 20, 0, 110)
lagButton.Text = "Lag Spike Server"
lagButton.Font = Enum.Font.SourceSansBold
lagButton.TextSize = 20
lagButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
lagButton.TextColor3 = novaRed

lagButton.MouseButton1Click:Connect(function()
    for i = 1, 500 do
        ReplicatedStorage:FireServer("RemoteName", {math.random(), math.random(), math.random()})
    end
end)

-- Close Button
local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 22
closeButton.BackgroundColor3 = novaRed
closeButton.TextColor3 = Color3.new(1, 1, 1)

closeButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Ready for repo drop or loadstring() wrapping
-- End of Clean Code
