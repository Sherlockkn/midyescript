local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

local localPlayer = Players.LocalPlayer

-- ==================== KEY SİSTEMİ ====================
local VALID_KEYS = {
    ["3zU5w92Z85N2Q6jTeqnLJbC1jGtTYq8B"] = true,
    ["33VqD7QoeLHDWeH5h1VRF8Lu7JvVUcTW"] = true,
    ["a9YZHK84x38zQRiNeGxj2kfhVkmwFXB2"] = true,
    ["vxZ525Z3SX1gbKEUr7PaRDAxhy86Ww7x"] = true,
    ["K44j8KTv4p2fKyFqDepcfhWB7wSYWvb3"] = true,
    ["GayMert"] = true,
    ["123"] = true,
}

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "MidyeKeySystem"
keyGui.ResetOnSpawn = false
keyGui.Parent = game:GetService("CoreGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 420, 0, 220)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
keyFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
keyFrame.BackgroundTransparency = 0
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyGui

local keyFrameCorner = Instance.new("UICorner")
keyFrameCorner.CornerRadius = UDim.new(0, 16)
keyFrameCorner.Parent = keyFrame

local keyFrameStroke = Instance.new("UIStroke")
keyFrameStroke.Color = Color3.fromRGB(48, 54, 61)
keyFrameStroke.Thickness = 2
keyFrameStroke.Transparency = 0
keyFrameStroke.Parent = keyFrame

-- Başlık
local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 55)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "⚡ MIDYE SCRIPT"
keyTitle.TextColor3 = Color3.fromRGB(88, 166, 255)
keyTitle.TextSize = 20
keyTitle.TextTruncate = Enum.TextTruncate.AtEnd
keyTitle.Font = Enum.Font.GothamBold
keyTitle.Parent = keyFrame

-- Açıklama
local keyDesc = Instance.new("TextLabel")
keyDesc.Size = UDim2.new(1, -20, 0, 30)
keyDesc.Position = UDim2.new(0, 10, 0, 65)
keyDesc.BackgroundTransparency = 1
keyDesc.Text = "Devam etmek için geçerli bir key girin"
keyDesc.TextColor3 = Color3.fromRGB(139, 148, 158)
keyDesc.TextSize = 16
keyDesc.TextTruncate = Enum.TextTruncate.AtEnd
keyDesc.Font = Enum.Font.Gotham
keyDesc.Parent = keyFrame

-- Key input kutusu
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -30, 0, 48)
keyBox.Position = UDim2.new(0, 15, 0, 105)
keyBox.BackgroundColor3 = Color3.fromRGB(30, 37, 46)
keyBox.Text = ""
keyBox.PlaceholderText = "Key girin..."
keyBox.PlaceholderColor3 = Color3.fromRGB(88, 166, 255)
keyBox.TextColor3 = Color3.fromRGB(230, 237, 243)
keyBox.TextSize = 16
keyBox.TextTruncate = Enum.TextTruncate.AtEnd
keyBox.Font = Enum.Font.Gotham
keyBox.ClearTextOnFocus = false
keyBox.Parent = keyFrame

local keyBoxCorner = Instance.new("UICorner")
keyBoxCorner.CornerRadius = UDim.new(0, 8)
keyBoxCorner.Parent = keyBox

local keyBoxStroke = Instance.new("UIStroke")
keyBoxStroke.Color = Color3.fromRGB(48, 54, 61)
keyBoxStroke.Thickness = 1.5
keyBoxStroke.Transparency = 0
keyBoxStroke.Parent = keyBox

-- Giriş butonu
local keyEnterBtn = Instance.new("TextButton")
keyEnterBtn.Size = UDim2.new(1, -30, 0, 44)
keyEnterBtn.Position = UDim2.new(0, 15, 0, 163)
keyEnterBtn.BackgroundColor3 = Color3.fromRGB(31, 111, 235)
keyEnterBtn.Text = "GİRİŞ YAP"
keyEnterBtn.TextColor3 = Color3.fromRGB(230, 237, 243)
keyEnterBtn.TextSize = 17
keyEnterBtn.TextTruncate = Enum.TextTruncate.AtEnd
keyEnterBtn.Font = Enum.Font.GothamBold
keyEnterBtn.AutoButtonColor = false
keyEnterBtn.Parent = keyFrame

local keyEnterBtnCorner = Instance.new("UICorner")
keyEnterBtnCorner.CornerRadius = UDim.new(0, 8)
keyEnterBtnCorner.Parent = keyEnterBtn

local keyEnterBtnStroke = Instance.new("UIStroke")
keyEnterBtnStroke.Color = Color3.fromRGB(88, 166, 255)
keyEnterBtnStroke.Thickness = 1.5
keyEnterBtnStroke.Transparency = 0.5
keyEnterBtnStroke.Parent = keyEnterBtn

keyEnterBtn.MouseEnter:Connect(function()
    keyEnterBtn.BackgroundColor3 = Color3.fromRGB(56, 139, 255)
end)
keyEnterBtn.MouseLeave:Connect(function()
    keyEnterBtn.BackgroundColor3 = Color3.fromRGB(31, 111, 235)
end)

-- Hata mesajı
local keyError = Instance.new("TextLabel")
keyError.Size = UDim2.new(1, -20, 0, 20)
keyError.Position = UDim2.new(0, 10, 0, 163)
keyError.BackgroundTransparency = 1
keyError.Text = ""
keyError.TextColor3 = Color3.fromRGB(218, 54, 51)
keyError.TextSize = 15
keyError.TextTruncate = Enum.TextTruncate.AtEnd
keyError.Font = Enum.Font.Gotham
keyError.Visible = false
keyError.Parent = keyFrame

local function tryKey()
    local entered = keyBox.Text
    if VALID_KEYS[entered] then
        keyGui:Destroy()
        loadMainScript()
    else
        keyError.Text = "❌ Geçersiz key!"
        keyError.Visible = true
        keyBoxStroke.Color = Color3.fromRGB(218, 54, 51)
        keyBox.Text = ""
        task.delay(2, function()
            keyError.Visible = false
            keyBoxStroke.Color = Color3.fromRGB(48, 54, 61)
        end)
    end
end

keyEnterBtn.MouseButton1Click:Connect(tryKey)
keyBox.FocusLost:Connect(function(enter)
    if enter then tryKey() end
end)

-- Ana scripti yükleyen fonksiyon
function loadMainScript()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MidyeNeighboursPanel"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

-- Ana Panel (Glassmorphism efekti)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 580, 0, 640)
mainFrame.Position = UDim2.new(0.5, -290, 0.5, -320)
mainFrame.BackgroundColor3 = Color3.fromRGB(13, 17, 23)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.ClipsDescendants = true
mainFrame.BackgroundTransparency = 0

local mainFrameCorner = Instance.new("UICorner")
mainFrameCorner.CornerRadius = UDim.new(0, 16)
mainFrameCorner.Parent = mainFrame

local mainFrameStroke = Instance.new("UIStroke")
mainFrameStroke.Color = Color3.fromRGB(48, 54, 61)
mainFrameStroke.Thickness = 2
mainFrameStroke.Transparency = 0
mainFrameStroke.Parent = mainFrame

-- Glow efekti
local glowFrame = Instance.new("Frame")
glowFrame.Size = UDim2.new(1, 4, 1, 4)
glowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
glowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
glowFrame.BackgroundColor3 = Color3.fromRGB(88, 166, 255)
glowFrame.BackgroundTransparency = 0.95
glowFrame.BorderSizePixel = 0
glowFrame.ZIndex = 0
glowFrame.Parent = mainFrame

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(0, 18)
glowCorner.Parent = glowFrame

-- Başlık Çubuğu (Premium tasarım)
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame
titleBar.ZIndex = 2

local titleBarCorner = Instance.new("UICorner")
titleBarCorner.CornerRadius = UDim.new(0, 16)
titleBarCorner.Parent = titleBar

local titleBarGradient = Instance.new("UIGradient")
titleBarGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 166, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(63, 185, 80))
}
titleBarGradient.Rotation = 90
titleBarGradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0.88),
    NumberSequenceKeypoint.new(1, 0.96)
}
titleBarGradient.Parent = titleBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -110, 1, 0)
titleLabel.Position = UDim2.new(0, 18, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "⚡ MIDYE SCRIPT - MERTE GOTTEN"
titleLabel.TextColor3 = Color3.fromRGB(201, 209, 217)
titleLabel.TextSize = 20
titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Buton grubu (sağ üst, premium macOS tarzı)
local btnGroup = Instance.new("Frame")
btnGroup.Size = UDim2.new(0, 65, 0, 22)
btnGroup.Position = UDim2.new(1, -75, 0.5, -11)
btnGroup.BackgroundTransparency = 1
btnGroup.Parent = titleBar
btnGroup.ZIndex = 3

-- Minimize butonu (sarı daire - solda)
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 22, 0, 22)
minimizeBtn.Position = UDim2.new(0, 0, 0, 0)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(210, 153, 34)
minimizeBtn.Text = ""
minimizeBtn.AutoButtonColor = false
minimizeBtn.Parent = btnGroup
minimizeBtn.ZIndex = 4

local minimizeBtnCorner = Instance.new("UICorner")
minimizeBtnCorner.CornerRadius = UDim.new(1, 0)
minimizeBtnCorner.Parent = minimizeBtn

local minimizeBtnStroke = Instance.new("UIStroke")
minimizeBtnStroke.Color = Color3.fromRGB(160, 110, 0)
minimizeBtnStroke.Thickness = 1
minimizeBtnStroke.Transparency = 0.3
minimizeBtnStroke.Parent = minimizeBtn

-- Kapat butonu (kırmızı daire - sağda)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 22, 0, 22)
closeBtn.Position = UDim2.new(0, 33, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(218, 54, 51)
closeBtn.Text = ""
closeBtn.AutoButtonColor = false
closeBtn.Parent = btnGroup
closeBtn.ZIndex = 4

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(1, 0)
closeBtnCorner.Parent = closeBtn

local closeBtnStroke = Instance.new("UIStroke")
closeBtnStroke.Color = Color3.fromRGB(160, 30, 30)
closeBtnStroke.Thickness = 1
closeBtnStroke.Transparency = 0.3
closeBtnStroke.Parent = closeBtn

-- Hover animasyonları
minimizeBtn.MouseEnter:Connect(function() 
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(230, 175, 50)
end)
minimizeBtn.MouseLeave:Connect(function() 
    minimizeBtn.BackgroundColor3 = Color3.fromRGB(210, 153, 34)
end)

closeBtn.MouseEnter:Connect(function() 
    closeBtn.BackgroundColor3 = Color3.fromRGB(240, 80, 75)
end)
closeBtn.MouseLeave:Connect(function() 
    closeBtn.BackgroundColor3 = Color3.fromRGB(218, 54, 51)
end)

closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

-- Minimize / Restore (resizeHandle tanımlandıktan sonra bağlanacak)
local isMinimized = false
local normalSize = mainFrame.Size
local normalPosition = mainFrame.Position

-- DRAG FONKSİYONU (Başlık çubuğundan ve alt çubuktan sürükle)
local dragging = false
local dragInput, dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

local function attachDrag(handle)
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
end

-- Alt sürükleme çubuğu (saydam, info bar)
local bottomHandle = Instance.new("Frame")
bottomHandle.Size = UDim2.new(1, -32, 0, 32)
bottomHandle.Position = UDim2.new(0, 0, 1, -32)
bottomHandle.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
bottomHandle.BackgroundTransparency = 0
bottomHandle.BorderSizePixel = 0
bottomHandle.ZIndex = 8
bottomHandle.Parent = mainFrame

local bottomHandleCorner = Instance.new("UICorner")
bottomHandleCorner.CornerRadius = UDim.new(0, 16)
bottomHandleCorner.Parent = bottomHandle

-- Üst ince ayırıcı çizgi kaldırıldı

-- Info bar: discord ve gunslol yan yana, sağa yaslanmış, taşmaz
local infoBar = Instance.new("Frame")
infoBar.Size = UDim2.new(1, -12, 1, 0)
infoBar.Position = UDim2.new(0, 6, 0, 0)
infoBar.BackgroundTransparency = 1
infoBar.ClipsDescendants = true
infoBar.ZIndex = 16
infoBar.Parent = bottomHandle

local infoLayout = Instance.new("UIListLayout")
infoLayout.FillDirection = Enum.FillDirection.Horizontal
infoLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
infoLayout.VerticalAlignment = Enum.VerticalAlignment.Center
infoLayout.Padding = UDim.new(0, 10)
infoLayout.Parent = infoBar

local infoBarPadding = Instance.new("UIPadding")
infoBarPadding.PaddingLeft = UDim.new(0, 12)
infoBarPadding.Parent = infoBar

local discordLabel = Instance.new("TextButton")
discordLabel.Size = UDim2.new(0, 0, 1, 0)
discordLabel.AutomaticSize = Enum.AutomaticSize.X
discordLabel.BackgroundTransparency = 1
discordLabel.Text = "💬 discord → sherlockn"
discordLabel.TextColor3 = Color3.fromRGB(88, 166, 255)
discordLabel.TextTransparency = 0.1
discordLabel.TextSize = 15
discordLabel.TextTruncate = Enum.TextTruncate.AtEnd
discordLabel.Font = Enum.Font.Gotham
discordLabel.AutoButtonColor = false
discordLabel.ZIndex = 16
discordLabel.Parent = infoBar


local gunsLabel = Instance.new("TextButton")
gunsLabel.Size = UDim2.new(0, 0, 1, 0)
gunsLabel.AutomaticSize = Enum.AutomaticSize.X
gunsLabel.BackgroundTransparency = 1
gunsLabel.Text = "🎮 gunslol → realsherlock"
gunsLabel.TextColor3 = Color3.fromRGB(63, 185, 80)
gunsLabel.TextTransparency = 0.1
gunsLabel.TextSize = 15
gunsLabel.TextTruncate = Enum.TextTruncate.AtEnd
gunsLabel.Font = Enum.Font.Gotham
gunsLabel.AutoButtonColor = false
gunsLabel.ZIndex = 16
gunsLabel.Parent = infoBar

-- ============ TOAST BİLDİRİMİ ============
local toastGui = Instance.new("ScreenGui")
toastGui.Name = "MidyeToast"
toastGui.ResetOnSpawn = false
toastGui.Parent = game:GetService("CoreGui")

local toastFrame = Instance.new("Frame")
toastFrame.Size = UDim2.new(0, 340, 0, 60)
toastFrame.AnchorPoint = Vector2.new(0.5, 0.5)
toastFrame.Position = UDim2.new(0.5, 0, 0.6, 0)
toastFrame.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
toastFrame.BackgroundTransparency = 1
toastFrame.BorderSizePixel = 0
toastFrame.ZIndex = 999
toastFrame.Visible = false
toastFrame.Parent = toastGui

local toastCorner = Instance.new("UICorner")
toastCorner.CornerRadius = UDim.new(0, 14)
toastCorner.Parent = toastFrame

local toastStroke = Instance.new("UIStroke")
toastStroke.Color = Color3.fromRGB(88, 166, 255)
toastStroke.Thickness = 1.5
toastStroke.Transparency = 0.4
toastStroke.Parent = toastFrame

local toastIcon = Instance.new("TextLabel")
toastIcon.Size = UDim2.new(0, 44, 1, -16)
toastIcon.Position = UDim2.new(0, 8, 0, 8)
toastIcon.BackgroundTransparency = 1
toastIcon.Text = "✅"
toastIcon.TextSize = 22
toastIcon.TextTruncate = Enum.TextTruncate.AtEnd
toastIcon.Font = Enum.Font.GothamBold
toastIcon.TextTransparency = 1
toastIcon.ZIndex = 1000
toastIcon.Parent = toastFrame

local toastTitle = Instance.new("TextLabel")
toastTitle.Size = UDim2.new(1, -60, 0, 26)
toastTitle.Position = UDim2.new(0, 52, 0, 8)
toastTitle.BackgroundTransparency = 1
toastTitle.Text = ""
toastTitle.TextColor3 = Color3.fromRGB(230, 237, 243)
toastTitle.TextTransparency = 1
toastTitle.TextSize = 15
toastTitle.TextTruncate = Enum.TextTruncate.AtEnd
toastTitle.Font = Enum.Font.GothamBold
toastTitle.TextXAlignment = Enum.TextXAlignment.Left
toastTitle.ZIndex = 1000
toastTitle.Parent = toastFrame

local toastLabel = Instance.new("TextLabel")
toastLabel.Size = UDim2.new(1, -60, 0, 16)
toastLabel.Position = UDim2.new(0, 52, 0, 32)
toastLabel.BackgroundTransparency = 1
toastLabel.Text = ""
toastLabel.TextColor3 = Color3.fromRGB(88, 166, 255)
toastLabel.TextTransparency = 1
toastLabel.TextSize = 12
toastLabel.TextTruncate = Enum.TextTruncate.AtEnd
toastLabel.Font = Enum.Font.Gotham
toastLabel.TextXAlignment = Enum.TextXAlignment.Left
toastLabel.ZIndex = 1000
toastLabel.Parent = toastFrame

local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(1, -16, 0, 2)
progressBg.Position = UDim2.new(0, 8, 1, -6)
progressBg.BackgroundColor3 = Color3.fromRGB(30, 37, 46)
progressBg.BorderSizePixel = 0
progressBg.ZIndex = 1000
progressBg.Parent = toastFrame

local progressBgCorner = Instance.new("UICorner")
progressBgCorner.CornerRadius = UDim.new(1, 0)
progressBgCorner.Parent = progressBg

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(1, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(88, 166, 255)
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 1001
progressBar.Parent = progressBg

local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(1, 0)
progressBarCorner.Parent = progressBar

local toastActive = false
local toastThread = nil
local TS = game:GetService("TweenService")

local function showToast(title, sub)
    if toastThread then
        task.cancel(toastThread)
        toastThread = nil
    end

    toastActive = true
    toastTitle.Text = title or ""
    toastLabel.Text = sub or ""
    progressBar.Size = UDim2.new(1, 0, 1, 0)

    toastFrame.Position = UDim2.new(0.5, 0, 0.58, 0)
    toastFrame.BackgroundTransparency = 1
    toastTitle.TextTransparency = 1
    toastLabel.TextTransparency = 1
    toastIcon.TextTransparency = 1
    toastFrame.Visible = true

    local tweenIn = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    TS:Create(toastFrame,  tweenIn, {Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 0}):Play()
    TS:Create(toastTitle,  tweenIn, {TextTransparency = 0}):Play()
    TS:Create(toastLabel,  tweenIn, {TextTransparency = 0}):Play()
    TS:Create(toastIcon,   tweenIn, {TextTransparency = 0}):Play()
    TS:Create(progressBar, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)}):Play()

    toastThread = task.delay(3, function()
        if not toastActive then return end
        local tweenOut = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
        TS:Create(toastFrame,  tweenOut, {Position = UDim2.new(0.5, 0, 0.58, 0), BackgroundTransparency = 1}):Play()
        TS:Create(toastTitle,  tweenOut, {TextTransparency = 1}):Play()
        TS:Create(toastLabel,  tweenOut, {TextTransparency = 1}):Play()
        TS:Create(toastIcon,   tweenOut, {TextTransparency = 1}):Play()
        task.delay(0.3, function()
            toastFrame.Visible = false
            toastActive = false
            toastThread = nil
        end)
    end)
end

-- Kopyalama olayları
discordLabel.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://discord.com/users/394377899530125322") end)
    showToast("Midye Discord", "discord linki panoya kopyalandı")
end)
discordLabel.MouseEnter:Connect(function()
    discordLabel.TextTransparency = 0
end)
discordLabel.MouseLeave:Connect(function()
    discordLabel.TextTransparency = 0.1
end)

gunsLabel.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://guns.lol/realsherlock") end)
    showToast("Midye Guns.lol", "gunslol linki panoya kopyalandı")
end)
gunsLabel.MouseEnter:Connect(function()
    gunsLabel.TextTransparency = 0
end)
gunsLabel.MouseLeave:Connect(function()
    gunsLabel.TextTransparency = 0.1
end)

attachDrag(titleBar)
attachDrag(bottomHandle)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

-- RESIZE HANDLE (küçük, modern)
local resizeHandle = Instance.new("TextButton")
resizeHandle.Size = UDim2.new(0, 28, 0, 28)
resizeHandle.Position = UDim2.new(1, -30, 1, -30)
resizeHandle.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
resizeHandle.BackgroundTransparency = 0
resizeHandle.Text = ""
resizeHandle.AutoButtonColor = false
resizeHandle.Parent = mainFrame
resizeHandle.ZIndex = 10

local resizeCorner = Instance.new("UICorner")
resizeCorner.CornerRadius = UDim.new(0, 8)
resizeCorner.Parent = resizeHandle

local resizeStroke = Instance.new("UIStroke")
resizeStroke.Color = Color3.fromRGB(48, 54, 61)
resizeStroke.Thickness = 1.5
resizeStroke.Transparency = 0.3
resizeStroke.Parent = resizeHandle

-- Köşegen nokta deseni (3x3 grid, köşegen)
local dotPositions = {
    {x = 6,  y = 14},
    {x = 11, y = 9},
    {x = 16, y = 4},
    {x = 11, y = 14},
    {x = 16, y = 9},
    {x = 16, y = 14},
}
for _, pos in ipairs(dotPositions) do
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0, 3, 0, 3)
    dot.Position = UDim2.new(0, pos.x, 0, pos.y)
    dot.BackgroundColor3 = Color3.fromRGB(88, 166, 255)
    dot.BackgroundTransparency = 0.2
    dot.BorderSizePixel = 0
    dot.ZIndex = 11
    dot.Parent = resizeHandle
    local dc = Instance.new("UICorner")
    dc.CornerRadius = UDim.new(1, 0)
    dc.Parent = dot
end

resizeHandle.MouseEnter:Connect(function()
    resizeHandle.BackgroundColor3 = Color3.fromRGB(30, 37, 46)
    resizeStroke.Transparency = 0
end)
resizeHandle.MouseLeave:Connect(function()
    resizeHandle.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
    resizeStroke.Transparency = 0.3
end)

-- Minimize callback'ini burada bağla (resizeHandle artık tanımlı)
local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local resizing = false
local resizeStart, resizeStartSize

resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing = true
        resizeStart = input.Position
        resizeStartSize = mainFrame.Size
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                resizing = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - resizeStart
        local newWidth = math.max(400, resizeStartSize.X.Offset + delta.X)
        local newHeight = math.max(580, resizeStartSize.Y.Offset + delta.Y)
        mainFrame.Size = UDim2.new(0, newWidth, 0, newHeight)
    end
end)

-- Sol Bölüm - Oyuncu Listesi (Premium)
local leftSection = Instance.new("Frame")
leftSection.Size = UDim2.new(0.45, -10, 1, -82)
leftSection.Position = UDim2.new(0, 10, 0, 45)
leftSection.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
leftSection.BorderSizePixel = 0
leftSection.Parent = mainFrame
leftSection.ClipsDescendants = true
leftSection.BackgroundTransparency = 0

local leftSectionCorner = Instance.new("UICorner")
leftSectionCorner.CornerRadius = UDim.new(0, 12)
leftSectionCorner.Parent = leftSection

local leftSectionStroke = Instance.new("UIStroke")
leftSectionStroke.Color = Color3.fromRGB(48, 54, 61)
leftSectionStroke.Thickness = 1.5
leftSectionStroke.Transparency = 0
leftSectionStroke.Parent = leftSection

-- Başlık
local playerListTitle = Instance.new("TextLabel")
playerListTitle.Size = UDim2.new(1, 0, 0, 40)
playerListTitle.BackgroundTransparency = 1
playerListTitle.Text = "👥 OYUNCULAR"
playerListTitle.TextColor3 = Color3.fromRGB(201, 209, 217)
playerListTitle.TextSize = 20
playerListTitle.TextTruncate = Enum.TextTruncate.AtEnd
playerListTitle.Font = Enum.Font.GothamBold
playerListTitle.Parent = leftSection

-- Arama ve Temizle
local searchContainer = Instance.new("Frame")
searchContainer.Size = UDim2.new(1, -10, 0, 50)
searchContainer.Position = UDim2.new(0, 5, 0, 40)
searchContainer.BackgroundTransparency = 1
searchContainer.ClipsDescendants = true
searchContainer.Parent = leftSection

local searchLayout = Instance.new("UIListLayout")
searchLayout.FillDirection = Enum.FillDirection.Horizontal
searchLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
searchLayout.VerticalAlignment = Enum.VerticalAlignment.Center
searchLayout.Padding = UDim.new(0, 6)
searchLayout.Parent = searchContainer

local searchPadding = Instance.new("UIPadding")
searchPadding.PaddingLeft = UDim.new(0, 5)
searchPadding.PaddingRight = UDim.new(0, 5)
searchPadding.Parent = searchContainer

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(0.62, 0, 0, 42)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 37, 46)
searchBox.Text = ""
searchBox.PlaceholderText = "🔍 İsim ara..."
searchBox.PlaceholderColor3 = Color3.fromRGB(139, 148, 158)
searchBox.TextColor3 = Color3.fromRGB(230, 237, 243)
searchBox.TextSize = 18
searchBox.TextTruncate = Enum.TextTruncate.AtEnd
searchBox.Font = Enum.Font.GothamBold
searchBox.Parent = searchContainer

local searchBoxCorner = Instance.new("UICorner")
searchBoxCorner.CornerRadius = UDim.new(0, 8)
searchBoxCorner.Parent = searchBox

local searchBoxStroke = Instance.new("UIStroke")
searchBoxStroke.Color = Color3.fromRGB(48, 54, 61)
searchBoxStroke.Thickness = 1.5
searchBoxStroke.Transparency = 0
searchBoxStroke.Parent = searchBox

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0.35, 0, 0, 42)
clearBtn.BackgroundColor3 = Color3.fromRGB(31, 111, 235)
clearBtn.Text = "TEMİZLE"
clearBtn.TextTruncate = Enum.TextTruncate.AtEnd
clearBtn.TextColor3 = Color3.fromRGB(230, 237, 243)
clearBtn.TextSize = 15
clearBtn.Font = Enum.Font.GothamBold
clearBtn.AutoButtonColor = false
clearBtn.Parent = searchContainer

local clearBtnCorner = Instance.new("UICorner")
clearBtnCorner.CornerRadius = UDim.new(0, 8)
clearBtnCorner.Parent = clearBtn

local clearBtnStroke = Instance.new("UIStroke")
clearBtnStroke.Color = Color3.fromRGB(88, 166, 255)
clearBtnStroke.Thickness = 1.5
clearBtnStroke.Transparency = 0.5
clearBtnStroke.Parent = clearBtn

local clearBtnGradient = Instance.new("UIGradient")
clearBtnGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 139, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(31, 111, 235))
}
clearBtnGradient.Rotation = 45
clearBtnGradient.Parent = clearBtn

clearBtn.MouseEnter:Connect(function()
    clearBtn.BackgroundColor3 = Color3.fromRGB(56, 139, 255)
end)
clearBtn.MouseLeave:Connect(function()
    clearBtn.BackgroundColor3 = Color3.fromRGB(31, 111, 235)
end)

-- Oyuncu Listesi
local playerListFrame = Instance.new("ScrollingFrame")
playerListFrame.Size = UDim2.new(1, -10, 1, -270)
playerListFrame.Position = UDim2.new(0, 5, 0, 95)
playerListFrame.BackgroundTransparency = 1
playerListFrame.ScrollBarThickness = 5
playerListFrame.ScrollBarImageColor3 = Color3.fromRGB(88, 166, 255)
playerListFrame.BorderSizePixel = 0
playerListFrame.Parent = leftSection

local playerListLayout = Instance.new("UIListLayout")
playerListLayout.Padding = UDim.new(0, 6)
playerListLayout.Parent = playerListFrame

-- Seçili Oyuncu Paneli (Premium)
local selectedPanel = Instance.new("Frame")
selectedPanel.Size = UDim2.new(1, -20, 0, 165)
selectedPanel.Position = UDim2.new(0, 10, 1, -175)
selectedPanel.BackgroundColor3 = Color3.fromRGB(30, 37, 46)
selectedPanel.BorderSizePixel = 0
selectedPanel.Parent = leftSection

local selectedPanelCorner = Instance.new("UICorner")
selectedPanelCorner.CornerRadius = UDim.new(0, 12)
selectedPanelCorner.Parent = selectedPanel

local selectedPanelStroke = Instance.new("UIStroke")
selectedPanelStroke.Color = Color3.fromRGB(48, 54, 61)
selectedPanelStroke.Thickness = 1.5
selectedPanelStroke.Transparency = 0
selectedPanelStroke.Parent = selectedPanel

local selectedLabel = Instance.new("TextLabel")
selectedLabel.Size = UDim2.new(1, -10, 0, 32)
selectedLabel.Position = UDim2.new(0, 5, 0, 8)
selectedLabel.BackgroundTransparency = 1
selectedLabel.Text = "🎯 Seçili: Yok"
selectedLabel.TextColor3 = Color3.fromRGB(88, 166, 255)
selectedLabel.TextSize = 18
selectedLabel.TextTruncate = Enum.TextTruncate.AtEnd
selectedLabel.Font = Enum.Font.GothamBold
selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
selectedLabel.Parent = selectedPanel

local viewBtn = Instance.new("TextButton")
viewBtn.Size = UDim2.new(0.9, 0, 0, 36)
viewBtn.Position = UDim2.new(0.05, 0, 0, 45)
viewBtn.BackgroundColor3 = Color3.fromRGB(63, 185, 80)
viewBtn.Text = "👁️ VIEW KAPALI"
viewBtn.TextColor3 = Color3.fromRGB(230, 237, 243)
viewBtn.TextSize = 18
viewBtn.TextTruncate = Enum.TextTruncate.AtEnd
viewBtn.Font = Enum.Font.GothamBold
viewBtn.AutoButtonColor = false
viewBtn.Parent = selectedPanel

local viewBtnCorner = Instance.new("UICorner")
viewBtnCorner.CornerRadius = UDim.new(0, 8)
viewBtnCorner.Parent = viewBtn

local viewBtnStroke = Instance.new("UIStroke")
viewBtnStroke.Color = Color3.fromRGB(63, 185, 80)
viewBtnStroke.Thickness = 1
viewBtnStroke.Transparency = 0.5
viewBtnStroke.Parent = viewBtn

local autoTPBtn = Instance.new("TextButton")
autoTPBtn.Size = UDim2.new(0.9, 0, 0, 36)
autoTPBtn.Position = UDim2.new(0.05, 0, 0, 86)
autoTPBtn.BackgroundColor3 = Color3.fromRGB(63, 185, 80)
autoTPBtn.Text = "⚡ AUTO TP KAPALI"
autoTPBtn.TextColor3 = Color3.fromRGB(230, 237, 243)
autoTPBtn.TextSize = 18
autoTPBtn.TextTruncate = Enum.TextTruncate.AtEnd
autoTPBtn.Font = Enum.Font.GothamBold
autoTPBtn.AutoButtonColor = false
autoTPBtn.Parent = selectedPanel

local autoTPBtnCorner = Instance.new("UICorner")
autoTPBtnCorner.CornerRadius = UDim.new(0, 8)
autoTPBtnCorner.Parent = autoTPBtn

local autoTPBtnStroke = Instance.new("UIStroke")
autoTPBtnStroke.Color = Color3.fromRGB(63, 185, 80)
autoTPBtnStroke.Thickness = 1
autoTPBtnStroke.Transparency = 0.5
autoTPBtnStroke.Parent = autoTPBtn

local manualTPBtn = Instance.new("TextButton")
manualTPBtn.Size = UDim2.new(0.9, 0, 0, 36)
manualTPBtn.Position = UDim2.new(0.05, 0, 0, 127)
manualTPBtn.BackgroundColor3 = Color3.fromRGB(31, 111, 235)
manualTPBtn.Text = "🚀 ŞİMDİ TP AT"
manualTPBtn.TextColor3 = Color3.fromRGB(230, 237, 243)
manualTPBtn.TextSize = 18
manualTPBtn.TextTruncate = Enum.TextTruncate.AtEnd
manualTPBtn.Font = Enum.Font.GothamBold
manualTPBtn.AutoButtonColor = false
manualTPBtn.Parent = selectedPanel

local manualTPBtnCorner = Instance.new("UICorner")
manualTPBtnCorner.CornerRadius = UDim.new(0, 8)
manualTPBtnCorner.Parent = manualTPBtn

local manualTPBtnStroke = Instance.new("UIStroke")
manualTPBtnStroke.Color = Color3.fromRGB(88, 166, 255)
manualTPBtnStroke.Thickness = 1
manualTPBtnStroke.Transparency = 0.5
manualTPBtnStroke.Parent = manualTPBtn

-- Sağ Bölüm - Hile Menüsü (Premium)
local rightSection = Instance.new("Frame")
rightSection.Size = UDim2.new(0.55, -10, 1, -82)
rightSection.Position = UDim2.new(0.45, 0, 0, 45)
rightSection.BackgroundColor3 = Color3.fromRGB(22, 27, 34)
rightSection.BorderSizePixel = 0
rightSection.ClipsDescendants = true
rightSection.Parent = mainFrame

local rightSectionCorner = Instance.new("UICorner")
rightSectionCorner.CornerRadius = UDim.new(0, 12)
rightSectionCorner.Parent = rightSection

local rightSectionStroke = Instance.new("UIStroke")
rightSectionStroke.Color = Color3.fromRGB(48, 54, 61)
rightSectionStroke.Thickness = 1.5
rightSectionStroke.Transparency = 0
rightSectionStroke.Parent = rightSection

local cheatTitle = Instance.new("TextLabel")
cheatTitle.Size = UDim2.new(1, 0, 0, 48)
cheatTitle.BackgroundTransparency = 1
cheatTitle.Text = "⚙️ HİLE MENÜSÜ"
cheatTitle.TextColor3 = Color3.fromRGB(201, 209, 217)
cheatTitle.TextSize = 24
cheatTitle.TextTruncate = Enum.TextTruncate.AtEnd
cheatTitle.Font = Enum.Font.GothamBold
cheatTitle.Parent = rightSection

local cheatButtons = {}
local buttonData = {
    {Text = "✈️ FLY KAPALI", Color = Color3.fromRGB(63, 185, 80)},
    {Text = "👻 NOCLIP KAPALI", Color = Color3.fromRGB(63, 185, 80)},
    {Text = "🔍 ESP KAPALI", Color = Color3.fromRGB(63, 185, 80)},
    {Text = "🔄 REJOIN", Color = Color3.fromRGB(218, 54, 51)},
}

for i, data in ipairs(buttonData) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 58)
    btn.Position = UDim2.new(0.05, 0, 0, 58 + (i - 1) * 68)
    btn.BackgroundColor3 = data.Color
    btn.Text = data.Text
    btn.TextColor3 = Color3.fromRGB(230, 237, 243)
    btn.TextSize = 20
    btn.TextTruncate = Enum.TextTruncate.AtEnd
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = rightSection
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 12)
    btnCorner.Parent = btn
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(48, 54, 61)
    btnStroke.Thickness = 1.5
    btnStroke.Transparency = 0
    btnStroke.Parent = btn
    
    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, data.Color),
        ColorSequenceKeypoint.new(1, data.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.35))
    }
    btnGradient.Rotation = 45
    btnGradient.Parent = btn
    
    cheatButtons[data.Text] = btn
end

-- Hız ve DataLimit Ayarları (Premium)
local settingsContainer = Instance.new("Frame")
settingsContainer.Size = UDim2.new(0.9, 0, 0, 210)
settingsContainer.Position = UDim2.new(0.05, 0, 0, 338)
settingsContainer.BackgroundTransparency = 1
settingsContainer.Parent = rightSection

local settingsData = {
    {Label = "⚡ Uçuş Hızı:", Default = "120"},
    {Label = "🏃 Koşu Hızı:", Default = "16"},
    {Label = "📊 DataLimit (KBPS):", Default = "1"},
}

local controls = {}

for i, s in ipairs(settingsData) do
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 52)
    frame.Position = UDim2.new(0, 0, 0, (i - 1) * 58)
    frame.BackgroundTransparency = 1
    frame.Parent = settingsContainer

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.48, 0, 0, 42)
    label.BackgroundTransparency = 1
    label.Text = s.Label
    label.TextColor3 = Color3.fromRGB(201, 209, 217)
    label.TextSize = 18
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.5, -10, 0, 42)
    box.Position = UDim2.new(0.5, 5, 0, 0)
    box.BackgroundColor3 = Color3.fromRGB(30, 37, 46)
    box.Text = s.Default
    box.TextColor3 = Color3.fromRGB(88, 166, 255)
    box.TextSize = 19
    box.TextTruncate = Enum.TextTruncate.AtEnd
    box.Font = Enum.Font.GothamBold
    box.Parent = frame
    
    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 8)
    boxCorner.Parent = box
    
    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = Color3.fromRGB(48, 54, 61)
    boxStroke.Thickness = 1.5
    boxStroke.Transparency = 0
    boxStroke.Parent = box
    
    controls[s.Label] = box
end

-- Hover efektleri fonksiyonu (Smooth)
local function setHoverEffect(button, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = hoverColor or normalColor:Lerp(Color3.fromRGB(255, 255, 255), 0.15)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = normalColor
    end)
end

for _, btn in pairs(cheatButtons) do
    setHoverEffect(btn, btn.BackgroundColor3)
end
setHoverEffect(viewBtn, Color3.fromRGB(63, 185, 80), Color3.fromRGB(80, 210, 100))
setHoverEffect(autoTPBtn, Color3.fromRGB(63, 185, 80), Color3.fromRGB(80, 210, 100))
setHoverEffect(manualTPBtn, Color3.fromRGB(31, 111, 235), Color3.fromRGB(56, 139, 255))

-- ==================== FONKSİYONLAR ====================
local selectedPlayer = nil
local selectedButton = nil

local viewEnabled = false
local autoTPEnabled = false
local viewConnection = nil
local autoTPConnection = nil

local espEnabled = false
local espObjects = {}

local flying = false
local flySpeed = 120
local walkSpeed = 16
local bv, bg, flyConnection
local noclipEnabled = false
local noclipConnection = nil

local function updateSelectedUI()
    selectedLabel.Text = "🎯 Seçili: " .. (selectedPlayer and selectedPlayer.Name or "Yok")
end

-- VIEW
local function applyView()
    if viewConnection then viewConnection:Disconnect(); viewConnection = nil end
    local cam = workspace.CurrentCamera
    local myHum = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")
    if viewEnabled and selectedPlayer and selectedPlayer.Character then
        local targetHum = selectedPlayer.Character:FindFirstChildOfClass("Humanoid")
        if targetHum then
            cam.CameraType = Enum.CameraType.Custom
            cam.CameraSubject = targetHum
            viewConnection = RunService.RenderStepped:Connect(function()
                if viewEnabled and targetHum and targetHum.Parent then
                    cam.CameraType = Enum.CameraType.Custom
                    cam.CameraSubject = targetHum
                end
            end)
            return
        end
    end
    cam.CameraType = Enum.CameraType.Custom
    if myHum then cam.CameraSubject = myHum end
end

local function toggleView()
    viewEnabled = not viewEnabled
    viewBtn.Text = viewEnabled and "👁️ VIEW AÇIK" or "👁️ VIEW KAPALI"
    viewBtn.BackgroundColor3 = viewEnabled and Color3.fromRGB(218, 54, 51) or Color3.fromRGB(63, 185, 80)
    applyView()
end

-- AUTO TP
local function toggleAutoTP()
    autoTPEnabled = not autoTPEnabled
    autoTPBtn.Text = autoTPEnabled and "⚡ AUTO TP AÇIK" or "⚡ AUTO TP KAPALI"
    autoTPBtn.BackgroundColor3 = autoTPEnabled and Color3.fromRGB(218, 54, 51) or Color3.fromRGB(63, 185, 80)

    if autoTPEnabled then
        autoTPConnection = RunService.Heartbeat:Connect(function()
            if not autoTPEnabled or not selectedPlayer or not selectedPlayer.Character or not localPlayer.Character then return end
            local targetRoot = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            local myRoot = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot and myRoot then
                myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 5, 0)
            end
        end)
    else
        if autoTPConnection then autoTPConnection:Disconnect(); autoTPConnection = nil end
    end
end

local function manualTP()
    if not selectedPlayer or not selectedPlayer.Character then return end
    local myChar = localPlayer.Character
    local targetRoot = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if targetRoot and myRoot then
        myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 5, 0)
    end
end

-- ESP FONKSİYONLARI
local function createESP(plr)
    if espObjects[plr] or plr == localPlayer then return end

    local function applyToCharacter(character)
        if not character then return end
        local root = character:WaitForChild("HumanoidRootPart", 5)
        if not root then return end

        if espObjects[plr] then
            if espObjects[plr].DistConn then espObjects[plr].DistConn:Disconnect() end
            if espObjects[plr].TeamConn then espObjects[plr].TeamConn:Disconnect() end
            if espObjects[plr].Highlight then espObjects[plr].Highlight:Destroy() end
            if espObjects[plr].Billboard then espObjects[plr].Billboard:Destroy() end
            espObjects[plr] = nil
        end

        local head = character:FindFirstChild("Head")
        if head then
            for _, obj in ipairs(head:GetChildren()) do
                if obj:IsA("BillboardGui") then obj.Enabled = false end
            end
        end

        local function isSameTeam()
            return localPlayer.Team ~= nil and plr.Team ~= nil and localPlayer.Team == plr.Team
        end

        local function getTeamColors()
            if isSameTeam() then
                return Color3.fromRGB(0, 120, 255), Color3.fromRGB(150, 200, 255)
            else
                return Color3.fromRGB(220, 50, 50), Color3.fromRGB(255, 255, 255)
            end
        end

        local fillColor, outlineColor = getTeamColors()

        local highlight = Instance.new("Highlight")
        highlight.Name = "MidyeScript_Highlight"
        highlight.FillColor = fillColor
        highlight.OutlineColor = outlineColor
        highlight.FillTransparency = 0.55
        highlight.OutlineTransparency = 0
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Adornee = character
        highlight.Parent = character

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "MidyeScript_ESP"
        billboard.Adornee = root
        billboard.Size = UDim2.new(0, 120, 0, 36)
        billboard.StudsOffset = Vector3.new(0, 3.5, 0)
        billboard.AlwaysOnTop = true
        billboard.LightInfluence = 0
        billboard.Parent = character

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 0.55, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = plr.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameLabel.TextStrokeTransparency = 0.3
        nameLabel.TextSize = 12
        nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextXAlignment = Enum.TextXAlignment.Center
        nameLabel.Visible = not isSameTeam()
        nameLabel.Parent = billboard

        local distLabel = Instance.new("TextLabel")
        distLabel.Size = UDim2.new(1, 0, 0.45, 0)
        distLabel.Position = UDim2.new(0, 0, 0.55, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
        distLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        distLabel.TextStrokeTransparency = 0.3
        distLabel.TextSize = 14
        distLabel.TextTruncate = Enum.TextTruncate.AtEnd
        distLabel.Font = Enum.Font.Gotham
        distLabel.TextXAlignment = Enum.TextXAlignment.Center
        distLabel.Visible = not isSameTeam()
        distLabel.Parent = billboard

        local distConn = RunService.Heartbeat:Connect(function()
            if not distLabel.Parent then return end
            local myRoot = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myRoot and root.Parent then
                distLabel.Text = math.round((myRoot.Position - root.Position).Magnitude) .. "m"
            end
        end)

        local teamConn = plr:GetPropertyChangedSignal("Team"):Connect(function()
            local fill, outline = getTeamColors()
            if highlight.Parent then
                highlight.FillColor = fill
                highlight.OutlineColor = outline
            end
            local enemy = not isSameTeam()
            nameLabel.Visible = enemy
            distLabel.Visible = enemy
        end)

        espObjects[plr] = {Highlight = highlight, Billboard = billboard, DistConn = distConn, TeamConn = teamConn}
    end

    task.spawn(function()
        task.wait(0.5)
        if plr.Character then applyToCharacter(plr.Character) end
    end)

    plr.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if espEnabled then applyToCharacter(char) end
    end)
end

local function removeESP(plr)
    if espObjects[plr] then
        if espObjects[plr].Highlight then espObjects[plr].Highlight:Destroy() end
        if espObjects[plr].Billboard then espObjects[plr].Billboard:Destroy() end
        if espObjects[plr].DistConn then espObjects[plr].DistConn:Disconnect() end
        if espObjects[plr].HealthConn then espObjects[plr].HealthConn:Disconnect() end
        if espObjects[plr].TeamConn then espObjects[plr].TeamConn:Disconnect() end
        espObjects[plr] = nil
    end
end

local function toggleESP()
    espEnabled = not espEnabled
    cheatButtons["🔍 ESP KAPALI"].Text = espEnabled and "🔍 ESP AÇIK" or "🔍 ESP KAPALI"
    cheatButtons["🔍 ESP KAPALI"].BackgroundColor3 = espEnabled and Color3.fromRGB(218, 54, 51) or Color3.fromRGB(63, 185, 80)

    if espEnabled then
        for _, plr in ipairs(Players:GetPlayers()) do createESP(plr) end
    else
        for plr, _ in pairs(espObjects) do removeESP(plr) end
        espObjects = {}
    end
end

-- REJOIN
local function rejoinGame()
    local placeId = game.PlaceId
    local jobId = game.JobId
    if jobId and jobId ~= "" then
        TeleportService:TeleportToPlaceInstance(placeId, jobId, localPlayer)
    else
        TeleportService:Teleport(placeId, localPlayer)
    end
end

-- Buton referanslarını önceden al (toggleFly/toggleNoclip içinde kullanılıyor)
local flyBtn    = cheatButtons["✈️ FLY KAPALI"]
local noclipBtn = cheatButtons["👻 NOCLIP KAPALI"]
local espBtn    = cheatButtons["🔍 ESP KAPALI"]
local rejoinBtn = cheatButtons["🔄 REJOIN"]

-- FLY
local function toggleFly()
    local character = localPlayer.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    if flying then
        flying = false
        flyBtn.Text = "✈️ FLY KAPALI"
        flyBtn.BackgroundColor3 = Color3.fromRGB(63, 185, 80)
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
        if flyConnection then flyConnection:Disconnect() end
    else
        flying = true
        flyBtn.Text = "✈️ FLY AÇIK"
        flyBtn.BackgroundColor3 = Color3.fromRGB(218, 54, 51)

        bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(99999, 99999, 99999)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = root

        bg = Instance.new("BodyGyro")
        bg.MaxTorque = Vector3.new(99999, 99999, 99999)
        bg.P = 10000
        bg.D = 500
        bg.Parent = root

        flyConnection = RunService.Heartbeat:Connect(function()
            if not flying then return end
            local cam = workspace.CurrentCamera
            local dir = Vector3.new(0, 0, 0)

            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0, 1, 0) end

            if dir.Magnitude > 0 then dir = dir.Unit end
            bv.Velocity = dir * flySpeed
            bg.CFrame = cam.CFrame
        end)
    end
end

-- NOCLIP
local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    cheatButtons["👻 NOCLIP KAPALI"].Text = noclipEnabled and "👻 NOCLIP AÇIK" or "👻 NOCLIP KAPALI"
    cheatButtons["👻 NOCLIP KAPALI"].BackgroundColor3 = noclipEnabled and Color3.fromRGB(218, 54, 51) or Color3.fromRGB(63, 185, 80)
    
    if noclipEnabled then
        noclipConnection = RunService.Stepped:Connect(function()
            local char = localPlayer.Character
            if char and noclipEnabled then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    else
        if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end
    end
end

-- ==================== OYUNCU LİSTESİ VE FİLTRELEME ====================
local function refreshPlayers(filter)
    filter = filter or ""
    filter = filter:lower()

    for _, child in ipairs(playerListFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end

    for _, plr in ipairs(Players:GetPlayers()) do
        if filter == "" or plr.Name:lower():find(filter) then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 38)
            btn.BackgroundColor3 = (selectedPlayer == plr) and Color3.fromRGB(31, 111, 235) or Color3.fromRGB(30, 37, 46)
            btn.Text = plr.Name .. (plr == localPlayer and " (SEN)" or "")
            btn.TextColor3 = Color3.fromRGB(230, 237, 243)
            btn.TextSize = 18
            btn.TextTruncate = Enum.TextTruncate.AtEnd
            btn.Font = Enum.Font.GothamBold
            btn.AutoButtonColor = false
            btn.Parent = playerListFrame
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 8)
            btnCorner.Parent = btn
            
            local btnStroke = Instance.new("UIStroke")
            btnStroke.Color = (selectedPlayer == plr) and Color3.fromRGB(88, 166, 255) or Color3.fromRGB(48, 54, 61)
            btnStroke.Thickness = 1.5
            btnStroke.Transparency = 0.3
            btnStroke.Parent = btn
            
            -- Hover efekti
            btn.MouseEnter:Connect(function()
                if selectedPlayer ~= plr then
                    btn.BackgroundColor3 = Color3.fromRGB(38, 46, 56)
                end
            end)
            btn.MouseLeave:Connect(function()
                if selectedPlayer ~= plr then
                    btn.BackgroundColor3 = Color3.fromRGB(30, 37, 46)
                end
            end)

            btn.MouseButton1Click:Connect(function()
                if selectedButton then 
                    selectedButton.BackgroundColor3 = Color3.fromRGB(30, 37, 46)
                    local oldStroke = selectedButton:FindFirstChildOfClass("UIStroke")
                    if oldStroke then oldStroke.Color = Color3.fromRGB(48, 54, 61) end
                end
                selectedPlayer = plr
                selectedButton = btn
                btn.BackgroundColor3 = Color3.fromRGB(31, 111, 235)
                btnStroke.Color = Color3.fromRGB(88, 166, 255)
                updateSelectedUI()
                applyView()
            end)
        end
    end
    playerListFrame.CanvasSize = UDim2.new(0, 0, 0, playerListLayout.AbsoluteContentSize.Y + 10)
end

-- Arama ve Temizle fonksiyonları
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    refreshPlayers(searchBox.Text)
end)

clearBtn.MouseButton1Click:Connect(function()
    searchBox.Text = ""
    refreshPlayers("")
end)

-- Buton olayları
local function setButtonHover(button)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = button.BackgroundColor3:Lerp(Color3.fromRGB(50,50,50), 0.2)
    end)
    button.MouseLeave:Connect(function()
        -- Orijinal renkleri saklayıp geri dönebilirsin
        -- Ama burada basitçe orijinal renk kullanıldı
        if button.Name == "viewBtn" then
            button.BackgroundColor3 = viewBtn.BackgroundColor3
        elseif button.Name == "autoTPBtn" then
            button.BackgroundColor3 = autoTPBtn.BackgroundColor3
        elseif button.Name == "manualTPBtn" then
            button.BackgroundColor3 = manualTPBtn.BackgroundColor3
        elseif button.Name == "closeBtn" then
            button.BackgroundColor3 = closeBtn.BackgroundColor3
        else
            -- Diğerleri
        end
    end)
end

setButtonHover(closeBtn)
-- viewBtn, autoTPBtn, manualTPBtn için setHoverEffect zaten bağlandı, tekrar bağlamıyoruz

-- Bağlantılar

flyBtn.MouseButton1Click:Connect(toggleFly)
noclipBtn.MouseButton1Click:Connect(toggleNoclip)
espBtn.MouseButton1Click:Connect(toggleESP)
rejoinBtn.MouseButton1Click:Connect(rejoinGame)

viewBtn.MouseButton1Click:Connect(toggleView)
autoTPBtn.MouseButton1Click:Connect(toggleAutoTP)
manualTPBtn.MouseButton1Click:Connect(manualTP)

-- E tuşu ile ESP aç/kapat
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then
        toggleESP()
    end
end)

-- Hız ayarları
local flySpeedBox = controls["⚡ Uçuş Hızı:"]
local walkSpeedBox = controls["🏃 Koşu Hızı:"]
local dataLimitBox = controls["📊 DataLimit (KBPS):"]

flySpeedBox.FocusLost:Connect(function(enterPressed)
    local newSpeed = tonumber(flySpeedBox.Text)
    if newSpeed then
        flySpeed = newSpeed
    else
        flySpeedBox.Text = tostring(flySpeed)
    end
end)

walkSpeedBox.FocusLost:Connect(function(enterPressed)
    local newSpeed = tonumber(walkSpeedBox.Text)
    if newSpeed then
        walkSpeed = newSpeed
        local hum = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
        if hum then 
            hum.WalkSpeed = walkSpeed
        end
    else
        walkSpeedBox.Text = tostring(walkSpeed)
    end
end)

dataLimitBox.FocusLost:Connect(function(enterPressed)
    local val = tonumber(dataLimitBox.Text)
    if val then
        pcall(function() 
            game:GetService("NetworkClient"):SetOutgoingKBPSLimit(val)
        end)
    else
        dataLimitBox.Text = "1"
    end
end)

-- Karakter yeniden spawn olduğunda koşu hızını uygula
localPlayer.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local hum = char:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = walkSpeed
    end
end)

-- Oyuncu ekleme ve çıkarma
Players.PlayerAdded:Connect(function(plr)
    refreshPlayers(searchBox.Text)
    if espEnabled then createESP(plr) end
end)

Players.PlayerRemoving:Connect(function(plr)
    if selectedPlayer == plr then
        selectedPlayer = nil
        updateSelectedUI()
        applyView()
        if autoTPEnabled then toggleAutoTP() end
    end
    removeESP(plr)
    refreshPlayers(searchBox.Text)
end)

-- İlk yükleme - Mevcut oyuncuları listele
task.spawn(function()
    task.wait(0.1)
    refreshPlayers("")
end)

-- Minimize / Restore callback (leftSection ve rightSection burada tanımlı)
minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        normalSize = mainFrame.Size
        normalPosition = mainFrame.Position

        leftSection.Visible = false
        rightSection.Visible = false
        resizeHandle.Visible = false
        bottomHandle.Visible = false
        titleLabel.Text = "⚡ MIDYE"
        mainFrame.ClipsDescendants = true

        local sizeTween = TweenService:Create(mainFrame, tweenInfo, {Size = UDim2.new(0, 220, 0, 40)})
        sizeTween:Play()
    else
        local sizeTween = TweenService:Create(mainFrame, tweenInfo, {Size = normalSize})
        sizeTween:Play()

        task.delay(0.3, function()
            leftSection.Visible = true
            rightSection.Visible = true
            resizeHandle.Visible = true
            bottomHandle.Visible = true
            titleLabel.Text = "⚡ MIDYE SCRIPT"
        end)
    end
end)

end -- loadMainScript sonu