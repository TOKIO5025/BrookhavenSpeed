-- 🐉 Script creado por 𝙉𝙚𝙤𝙏𝙤𝙆𝙮𝙤 𝘽𝙚𝙖𝙩𝙨 🐲 para TU JUEGO
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local UIS = game:GetService("UserInputService")
local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://1843521514" -- Música al ejecutar
sound.Volume = 3
sound:Play()

-- 🧱 UI de opciones
local screen = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screen.Name = "NeoTokyoMenu"

local frame = Instance.new("Frame", screen)
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0.05, 0, 0.2, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 2

local function crearBoton(texto, callback)
	local boton = Instance.new("TextButton", frame)
	boton.Size = UDim2.new(1, -10, 0, 30)
	boton.Position = UDim2.new(0, 5, 0, #frame:GetChildren() * 35)
	boton.Text = texto
	boton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	boton.TextColor3 = Color3.new(1, 1, 1)
	boton.MouseButton1Click:Connect(callback)
	return boton
end

-- 🚀 VOLAR
local flying = false
crearBoton("🚁 Volar", function()
	flying = not flying
	local bp = Instance.new("BodyPosition", char.HumanoidRootPart)
	bp.MaxForce = Vector3.new(1e5, 1e5, 1e5)
	bp.P = 10000
	while flying and bp.Parent do
		local cf = char.HumanoidRootPart.CFrame
		bp.Position = cf.Position + Vector3.new(0, 10, 0)
		task.wait(0.1)
	end
	if bp then bp:Destroy() end
end)

-- ⚡ CAMBIAR VELOCIDAD
crearBoton("⚡ Velocidad (100)", function()
	hum.WalkSpeed = 100
end)

-- 🦘 CAMBIAR SALTO
crearBoton("🦘 Saltar (150)", function()
	hum.JumpPower = 150
end)

-- 🔊 MÚSICA GLOBAL (requiere un ID de audio válido)
crearBoton("🔊 Música (ID)", function()
	local musicId = tonumber(game:GetService("Chat"):PromptInput("Ingresa ID del audio:"))
	if musicId then
		local newSound = Instance.new("Sound", workspace)
		newSound.SoundId = "rbxassetid://" .. musicId
		newSound.Volume = 3
		newSound:Play()
	end
end)

-- 🏡 Trollear casas (solo decorativo, no funcional real)
crearBoton("🏚️ Trollear Casa #13", function()
	print("Trolleando la casa #13 🤣")
end)

-- 🛻 Volar a alguien en auto (solo decorativo)
crearBoton("🛻 Kick en auto", function()
	print("Boom! sacado del auto 😈")
end)

-- 🔓 Desbanear de casa (simulado)
crearBoton("🔓 Desbanear de casa", function()
	print("Ahora puedes entrar a cualquier casa 😎")
end)

-- 🚪 Tomar casa (simulado)
crearBoton("🏠 Tomar casa #7", function()
	print("Tomaste la casa #7 como un crack 🏠🔥")
end)

-- 🤝 Unirse a mismo server (simulado)
crearBoton("🌐 Unirse al mismo server", function()
	print("Uniéndote al server de tus panas... 🧑‍🤝‍🧑")
end)
