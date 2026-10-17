-- Pet Spawner Script for Grow a Garden

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Function to spawn a pet
local function spawnPet(player, petType)
    local pet = Instance.new("Model")
    pet.Name = petType
    
    -- Add parts and other components to the pet
    local head = Instance.new("Part")
    head.Name = "Head"
    head.Size = Vector3.new(1, 1, 1)
    head.Position = Vector3.new(0, 0, 0)
    head.Anchored = true
    head.Parent = pet
    
    -- Add more parts and components as needed
    
    -- Attach the pet to the player's character
    local character = player.Character or player.CharacterAdded:Wait()
    pet.Parent = character
end

-- Remote event to handle pet spawning
local spawnPetEvent = Instance.new("RemoteEvent")
spawnPetEvent.Name = "SpawnPetEvent"
spawnPetEvent.Parent = ReplicatedStorage

spawnPetEvent.OnServerEvent:Connect(function(player, petType)
    spawnPet(player, petType)
end)

-- Client-side script to trigger pet spawning
local function createClientScript()
    local clientScript = Instance.new("LocalScript")
    clientScript.Name = "PetSpawnerClient"
    clientScript.Source = [[
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        
        local spawnPetEvent = ReplicatedStorage:WaitForChild("SpawnPetEvent")
        
        -- Example: Spawn a pet when a button is clicked
        local player = Players.LocalPlayer
        
        -- Replace this with your actual button click logic
        local function onButtonClick()
            spawnPetEvent:FireServer("ExamplePet")
        end
    ]]
    clientScript.Parent = script
end

createClientScript()