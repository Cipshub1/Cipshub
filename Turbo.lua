--====================================================
-- ❄️ CIPSHUB | REBORN KEY SYSTEM 2026 ❄️
-- STYLE: PREMIUM GLASSMORPHISM
--====================================================

local LP = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- CONFIGURATION
local CorrectKey = "CHIPSHUBV1"
local KeyLink = "https://chat.whatsapp.com/C9lws7uXig62tX1xcVnhfS?mode=gi_t"
local MainScriptURL = "https://raw.githubusercontent.com/Cipshub1/Script-ecek-ecek-/refs/heads/main/PANTEK.lua"

-- UI BUILDER
local Gui = Instance.new("ScreenGui", LP.PlayerGui)
Gui.Name = "CipsRebornAuth"
Gui.ResetOnSpawn = false

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.fromOffset(350, 220)
Main.Position = UDim2.new(0.5, -175, 0.5, -110)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)

-- Stroke Accent
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(0, 225, 255)
Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Background Glow Effect
local Glow = Instance.new("ImageLabel", Main)
Glow.Size = UDim2.fromScale(1.5, 1.5)
Glow.Position = UDim2.fromScale(-0.25, -0.25)
Glow.BackgroundTransparency = 1
Glow.Image = "rbxassetid://13411135402" -- Glow Texture
Glow.ImageColor3 = Color3.fromRGB(0, 225, 255)
Glow.ImageTransparency = 0.8
Glow.ZIndex = 0

-- Header
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Text = "CIPSHUB | ACCESS"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 22
Title.BackgroundTransparency = 1

local SubTitle = Instance.new("TextLabel", Main)
SubTitle.Size = UDim2.new(1, 0, 0, 20)
SubTitle.Position = UDim2.fromOffset(0, 45)
SubTitle.Text = "Please enter your premium key below"
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
SubTitle.TextSize = 12
SubTitle.BackgroundTransparency = 1

-- Input Area
local Box = Instance.new("TextBox", Main)
Box.Size = UDim2.new(0.85, 0, 0, 45)
Box.Position = UDim2.new(0.075, 0, 0.45, 0)
Box.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Box.Text = ""
Box.PlaceholderText = "Paste Key Here..."
Box.TextColor3 = Color3.new(1, 1, 1)
Box.Font = Enum.Font.GothamMedium
Box.TextSize = 14
Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 10)
local BoxStroke = Instance.new("UIStroke", Box)
BoxStroke.Color = Color3.fromRGB(50, 50, 70)

-- Buttons
local function CreateButton(txt, pos, color, textColor)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.4, 0, 0, 40)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = txt
    btn.Font = Enum.Font.GothamBold
    btn.TextColor3 = textColor
    btn.TextSize = 13
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    
    -- Hover Animation
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color:Lerp(Color3.new(1,1,1), 0.1)}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color}):Play()
    end)
    
    return btn
end

local GetBtn = CreateButton("GET KEY", UDim2.new(0.075, 0, 0.75, 0), Color3.fromRGB(35, 35, 45), Color3.new(1,1,1))
local CheckBtn = CreateButton("VERIFY", UDim2.new(0.525, 0, 0.75, 0), Color3.fromRGB(0, 225, 255), Color3.fromRGB(15, 15, 20))

-- DRAGGABLE
local dragging, dragInput, dragStart, startPos
Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = Main.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input) dragging = false end)

-- LOGIC
GetBtn.MouseButton1Click:Connect(function()
    setclipboard(KeyLink)
    pcall(function() game:GetService("GuiService"):OpenBrowserWindow(KeyLink) end)
    GetBtn.Text = "COPIED!"
    task.wait(2)
    GetBtn.Text = "GET KEY"
end)

CheckBtn.MouseButton1Click:Connect(function()
    if Box.Text == CorrectKey then
        CheckBtn.Text = "SUCCESS"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
        
        -- Closing Animation
        TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.fromOffset(0,0), BackgroundTransparency = 1}):Play()
        task.wait(0.5)
        Gui:Destroy()
        
        -- AUTO EXECUTE MAIN SCRIPT
        loadstring(game:HttpGet(MainScriptURL))()
    else
        CheckBtn.Text = "INVALID KEY"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 70)
        task.wait(1.5)
        CheckBtn.Text = "VERIFY"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 225, 255)
    end
end)

