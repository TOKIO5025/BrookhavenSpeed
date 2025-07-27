-- 🐲 NeoTokyo Loader by TOKIO5025

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local plrGui = player:WaitForChild("PlayerGui")
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/Wally/main/wally.lua"))()
local Window = Library:MakeWindow("NeoTokyo Menu", Color3.new(0, 0, 0))

-- Velocidad
local speedSlider = Window:AddSlider({ text = "Velocidad", min = 16, max = 200, value = 50 })
speedSlider:OnChanged(function(v)
    player.Character.Humanoid.WalkSpeed = v
end)

-- Salto
local jumpSlider = Window:AddSlider({ text = "JumpPower", min = 50, max = 300, value = 50 })
jumpSlider:OnChanged(function(v)
    player.Character.Humanoid.JumpPower = v
end)

-- Vuelo (toggle)
local flying = false
Window:AddToggle({
    text = "Vuelo (toggle)",
    callback = function(state)
        flying = state
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChild("Humanoid")
        if state then
            hum.PlatformStand = true
            local BodyVelocity = Instance.new("BodyVelocity", char.HumanoidRootPart)
            BodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            game:GetService("RunService").Heartbeat:Connect(function()
                if flying then
                    BodyVelocity.Velocity = Vector3.new(0, (UIS:IsKeyDown(Enum.KeyCode.Space) and 50 or 0), 0)
                end
            end)
        else
            if hum then hum.PlatformStand = false end
            local bv = char.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
            if bv then bv:Destroy() end
        end
    end
})

-- Desbanear casa
Window:AddButton({
    text = "🏠 Desbanearme de una casa",
    callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Banned" and v:IsA("Folder") then
                for _, obj in pairs(v:GetChildren()) do
                    if obj:IsA("StringValue") and obj.Value == player.Name then
                        obj:Destroy()
                        print("✅ Te desbaneaste de una casa.")
                    end
                end
            end
        end
    end
})

-- Música bienvenida
local sound = Instance.new("Sound", player:WaitForChild("Backpack"))
sound.SoundId = "rbxassetid://"
sound.Volume = 1
sound:Play()

Window:AddButton({
    text = "🎵 Ingresar ID de canción",
    callback = function()
        local userInput = window:Prompt("Ingresa la ID de audio")
        if userInput then
            sound.SoundId = "rbxassetid://" .. userInput
            sound:Play()
        end
    end
})

-- Firma
Window:AddLabel("🐲 NeoTokyo Loader by TOKIO5025")

-- Ejecutar
print("✅ NeoTokyo Loader cargado correctamente")
