-- 🐉 Script creado por NeoTokyo Beats para Brookhaven RP
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

-- 🔥 Configura aquí la velocidad y salto
humanoid.WalkSpeed = 100   -- (16 por defecto, 100 es rápido)
humanoid.JumpPower = 150   -- (50 por defecto, 150 es alto)

-- Mensaje de confirmación
game.StarterGui:SetCore("SendNotification", {
    Title = "🔥 Speed & Jump",
    Text = "Velocidad y salto activados",
    Duration = 5
})
