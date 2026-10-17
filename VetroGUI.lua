-- Vetro GUI for Roblox Pet Spawner

local VetroGUI = Instance.new("ScreenGui")
VetroGUI.Name = "VetroGUI"
VetroGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = VetroGUI

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.Text = "Vetro Pet Spawner"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextSize = 20
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = MainFrame

local SpawnButton = Instance.new("TextButton")
SpawnButton.Name = "SpawnButton"
SpawnButton.Size = UDim2.new(0.8, 0, 0, 30)
SpawnButton.Position = UDim2.new(0.1, 0, 0.2, 0)
SpawnButton.Text = "Spawn Pet"
SpawnButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpawnButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpawnButton.BorderSizePixel = 0
SpawnButton.Parent = MainFrame

local SizeDupeButton = Instance.new("TextButton")
SizeDupeButton.Name = "SizeDupeButton"
SizeDupeButton.Size = UDim2.new(0.8, 0, 0, 30)
SizeDupeButton.Position = UDim2.new(0.1, 0, 0.4, 0)
SizeDupeButton.Text = "Size Dupe"
SizeDupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SizeDupeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SizeDupeButton.BorderSizePixel = 0
SizeDupeButton.Parent = MainFrame

local MutateButton = Instance.new("TextButton")
MutateButton.Name = "MutateButton"
MutateButton.Size = UDim2.new(0.8, 0, 0, 30)
MutateButton.Position = UDim2.new(0.1, 0, 0.6, 0)
MutateButton.Text = "Give Mutation"
MutateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MutateButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MutateButton.BorderSizePixel = 0
MutateButton.Parent = MainFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0.2, 0, 0, 30)
CloseButton.Position = UDim2.new(0.8, 0, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Parent = MainFrame

-- Function to spawn a pet
local function spawnPet()
    -- Spawn pet logic here
    print("Pet spawned")
end

-- Function to size dupe
local function sizeDupe()
    -- Size dupe logic here
    print("Size duped")
end

-- Function to give mutation
local function giveMutation()
    -- Give mutation logic here
    print("Mutation given")
end

-- Connect buttons to functions
SpawnButton.MouseButton1Click:Connect(spawnPet)
SizeDupeButton.MouseButton1Click:Connect(sizeDupe)
MutateButton.MouseButton1Click:Connect(giveMutation)
CloseButton.MouseButton1Click:Connect(function()
    VetroGUI:Destroy()
end)

-- Make the GUI draggable
local UserInputService = game:GetService("UserInputService")

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
