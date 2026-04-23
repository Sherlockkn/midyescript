local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")

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

-- ── Yardımcı: anlık tween ──────────────────────────────────────────────────
local function tween(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end

local EASE_OUT  = TweenInfo.new(0.35, Enum.EasingStyle.Quint,  Enum.EasingDirection.Out)
local EASE_IN   = TweenInfo.new(0.25, Enum.EasingStyle.Quint,  Enum.EasingDirection.In)
local EASE_FAST = TweenInfo.new(0.18, Enum.EasingStyle.Quart,  Enum.EasingDirection.Out)

-- ══════════════════════════════════════════════════════════════════════════════
--  RENK PALETİ  (tek yerden yönet)
-- ══════════════════════════════════════════════════════════════════════════════
local C = {
    BG          = Color3.fromRGB( 10,  10,  14),   -- en koyu zemin
    SURFACE     = Color3.fromRGB( 18,  18,  24),   -- panel yüzeyi
    SURFACE2    = Color3.fromRGB( 26,  26,  34),   -- girdi / kart
    BORDER      = Color3.fromRGB( 42,  42,  56),   -- kenarlık
    BORDER_GLOW = Color3.fromRGB( 88, 101, 242),   -- vurgu kenarlık (indigo)

    ACCENT      = Color3.fromRGB( 88, 101, 242),   -- ana vurgu: indigo
    ACCENT2     = Color3.fromRGB(114, 137, 218),   -- açık indigo
    GREEN       = Color3.fromRGB( 59, 165,  93),   -- aktif / açık
    GREEN_H     = Color3.fromRGB( 72, 199, 112),   -- hover
    RED         = Color3.fromRGB(237,  66,  69),   -- kapalı / tehlike
    RED_H       = Color3.fromRGB(255,  85,  88),
    BLUE        = Color3.fromRGB( 88, 101, 242),
    BLUE_H      = Color3.fromRGB(110, 124, 255),

    TEXT        = Color3.fromRGB(220, 221, 228),
    TEXT_MUTED  = Color3.fromRGB(114, 118, 125),
    TEXT_DIM    = Color3.fromRGB( 72,  75,  84),
}

-- ══════════════════════════════════════════════════════════════════════════════
--  YARDIMCI FONKSİYONLAR
-- ══════════════════════════════════════════════════════════════════════════════
local function addCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 10)
    c.Parent = parent
    return c
end

local function addStroke(parent, color, thick, trans)
    local s = Instance.new("UIStroke")
    s.Color       = color or C.BORDER
    s.Thickness   = thick or 1.5
    s.Transparency= trans or 0
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function addGradient(parent, c0, c1, rot)
    local g = Instance.new("UIGradient")
    g.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, c0),
        ColorSequenceKeypoint.new(1, c1)
    }
    g.Rotation = rot or 135
    g.Parent = parent
    return g
end

-- Parlama halkası (UIStroke renk animasyonu)
local function pulseStroke(stroke, col1, col2, period)
    period = period or 3
    task.spawn(function()
        local t = 0
        while stroke and stroke.Parent do
            t = t + task.wait(0.05)
            local alpha = (math.sin(t * (math.pi * 2 / period)) + 1) / 2
            stroke.Color = col1:Lerp(col2, alpha)
        end
    end)
end

-- Hover yardımcısı
local function hookHover(btn, normal, hover, dur)
    dur = dur or 0.18
    btn.MouseEnter:Connect(function()
        tween(btn, TweenInfo.new(dur, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
              {BackgroundColor3 = hover})
    end)
    btn.MouseLeave:Connect(function()
        tween(btn, TweenInfo.new(dur, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
              {BackgroundColor3 = normal})
    end)
end

-- Toggle butonları için dinamik hover — o anki rengi baz alır, MouseLeave'de toggle rengi korunur
local function hookToggleHover(btn, dur)
    dur = dur or 0.18
    local baseColor = btn.BackgroundColor3
    btn.MouseEnter:Connect(function()
        baseColor = btn.BackgroundColor3
        tween(btn, TweenInfo.new(dur, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
              {BackgroundColor3 = baseColor:Lerp(Color3.fromRGB(255,255,255), 0.18)})
    end)
    btn.MouseLeave:Connect(function()
        tween(btn, TweenInfo.new(dur, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
              {BackgroundColor3 = baseColor})
    end)
end

-- Basma "sıkışma" efekti
local function hookPress(btn)
    btn.MouseButton1Down:Connect(function()
        tween(btn, TweenInfo.new(0.08, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
              {Size = btn.Size - UDim2.new(0,4,0,4),
               Position = btn.Position + UDim2.new(0,2,0,2)})
    end)
    btn.MouseButton1Up:Connect(function()
        tween(btn, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
              {Size = btn.Size + UDim2.new(0,4,0,4),   -- geri aslına
               Position = btn.Position - UDim2.new(0,2,0,2)})
    end)
end

-- ══════════════════════════════════════════════════════════════════════════════
--  KEY SİSTEMİ GUI
-- ══════════════════════════════════════════════════════════════════════════════
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "MidyeKeySystem"
keyGui.ResetOnSpawn = false
keyGui.Parent = game:GetService("CoreGui")


-- Ana kart
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 420, 0, 220)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
keyFrame.BackgroundColor3 = C.SURFACE
keyFrame.BackgroundTransparency = 0
keyFrame.BorderSizePixel = 0
keyFrame.ZIndex = 2
keyFrame.Parent = keyGui
addCorner(keyFrame, 18)

local kfStroke = addStroke(keyFrame, C.BORDER, 1.5)

-- İnce üst çizgi (renk şeridi)
local keyAccentBar = Instance.new("Frame")
keyAccentBar.Size = UDim2.new(1, -40, 0, 2)
keyAccentBar.Position = UDim2.new(0, 20, 0, 0)
keyAccentBar.BackgroundColor3 = C.ACCENT
keyAccentBar.BorderSizePixel = 0
keyAccentBar.ZIndex = 3
keyAccentBar.Parent = keyFrame
addCorner(keyAccentBar, 2)
addGradient(keyAccentBar, C.ACCENT, C.ACCENT2, 90)

-- Logo / başlık (renkli harf sistemi)
local keyTitle = Instance.new("Frame")
keyTitle.Size = UDim2.new(1, 0, 0, 55)
keyTitle.BackgroundTransparency = 1
keyTitle.ClipsDescendants = false
keyTitle.ZIndex = 3
keyTitle.Parent = keyFrame

local keyTitleLayout = Instance.new("UIListLayout")
keyTitleLayout.FillDirection = Enum.FillDirection.Horizontal
keyTitleLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
keyTitleLayout.VerticalAlignment = Enum.VerticalAlignment.Center
keyTitleLayout.Padding = UDim.new(0, 0)
keyTitleLayout.Parent = keyTitle

local keyTitleText = "MIDYE SCRIPT"
local keyTitleColors = {
    Color3.fromRGB( 99, 102, 241),
    Color3.fromRGB(109,  93, 245),
    Color3.fromRGB(124,  77, 255),
    Color3.fromRGB(139,  92, 246),
    Color3.fromRGB(155,  89, 240),
    Color3.fromRGB(168,  85, 247),
    Color3.fromRGB(180,  80, 230),
    Color3.fromRGB(155,  89, 240),
    Color3.fromRGB(124,  77, 255),
    Color3.fromRGB(100, 100, 255),
    Color3.fromRGB( 79, 120, 255),
    Color3.fromRGB( 56, 145, 255),
}
local keyTitleCharLabels = {}

for i = 1, #keyTitleText do
    local ch = keyTitleText:sub(i, i)
    local col = keyTitleColors[i] or keyTitleColors[#keyTitleColors]
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 0, 1, 0)
    lbl.AutomaticSize = Enum.AutomaticSize.X
    lbl.BackgroundTransparency = 1
    lbl.Text = ch
    lbl.TextColor3 = col
    lbl.TextTransparency = 1
    lbl.TextSize = 26
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.Parent = keyTitle
    keyTitleCharLabels[i] = lbl
end

-- Wave animasyonu
task.spawn(function()
    local t = 0
    while keyTitle and keyTitle.Parent do
        t = t + task.wait(0.05)
        for i, lbl in ipairs(keyTitleCharLabels) do
            if not lbl.Parent then break end
            local offset = (i / #keyTitleCharLabels) + t * 0.4
            local alpha  = (math.sin(offset * math.pi * 2) + 1) / 2
            lbl.TextColor3 = Color3.fromRGB(99, 102, 241):Lerp(
                             Color3.fromRGB(56, 145, 255), alpha)
        end
    end
end)

-- Alt başlık
local keyDesc = Instance.new("TextLabel")
keyDesc.Size = UDim2.new(1, -20, 0, 30)
keyDesc.Position = UDim2.new(0, 10, 0, 55)
keyDesc.BackgroundTransparency = 1
keyDesc.Text = "Devam etmek için geçerli bir key girin"
keyDesc.TextColor3 = C.TEXT_MUTED
keyDesc.TextSize = 15
keyDesc.TextTruncate = Enum.TextTruncate.AtEnd
keyDesc.Font = Enum.Font.Gotham
keyDesc.ZIndex = 3
keyDesc.Parent = keyFrame

-- Key input
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -30, 0, 48)
keyBox.Position = UDim2.new(0, 15, 0, 95)
keyBox.BackgroundColor3 = C.SURFACE2
keyBox.Text = ""
keyBox.PlaceholderText = "Key girin..."
keyBox.PlaceholderColor3 = C.TEXT_MUTED
keyBox.TextColor3 = C.TEXT
keyBox.TextSize = 15
keyBox.TextTruncate = Enum.TextTruncate.AtEnd
keyBox.Font = Enum.Font.Gotham
keyBox.ClearTextOnFocus = false
keyBox.ZIndex = 3
keyBox.Parent = keyFrame
addCorner(keyBox, 10)
local kbStroke = addStroke(keyBox, C.BORDER, 1.5)

keyBox.Focused:Connect(function()
    tween(kbStroke, EASE_FAST, {Color = C.ACCENT})
end)
keyBox.FocusLost:Connect(function()
    tween(kbStroke, EASE_FAST, {Color = C.BORDER})
end)

-- Giriş butonu
local keyEnterBtn = Instance.new("TextButton")
keyEnterBtn.Size = UDim2.new(1, -30, 0, 44)
keyEnterBtn.Position = UDim2.new(0, 15, 0, 155)
keyEnterBtn.BackgroundColor3 = C.ACCENT
keyEnterBtn.Text = "GİRİŞ YAP"
keyEnterBtn.TextColor3 = Color3.fromRGB(255,255,255)
keyEnterBtn.TextSize = 15
keyEnterBtn.TextTruncate = Enum.TextTruncate.AtEnd
keyEnterBtn.Font = Enum.Font.GothamBold
keyEnterBtn.AutoButtonColor = false
keyEnterBtn.ZIndex = 3
keyEnterBtn.Parent = keyFrame
addCorner(keyEnterBtn, 10)
addGradient(keyEnterBtn, C.ACCENT, C.ACCENT2, 135)
hookHover(keyEnterBtn, C.ACCENT, C.BLUE_H)
hookPress(keyEnterBtn)

-- Hata etiketi
local keyError = Instance.new("TextLabel")
keyError.Size = UDim2.new(1, -20, 0, 20)
keyError.Position = UDim2.new(0, 10, 0, 155)
keyError.BackgroundTransparency = 1
keyError.Text = ""
keyError.TextColor3 = C.RED
keyError.TextSize = 13
keyError.TextTruncate = Enum.TextTruncate.AtEnd
keyError.Font = Enum.Font.Gotham
keyError.Visible = false
keyError.ZIndex = 4
keyError.Parent = keyFrame

-- Giriş animasyonu — kart scale+fade, harfler stagger ile gelir
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -130)
keyFrame.BackgroundTransparency = 1
keyFrame.Size = UDim2.new(0, 400, 0, 210)
keyDesc.TextTransparency = 1
keyDesc.Position = UDim2.new(0, 10, 0, 65)

task.spawn(function()
    task.wait(0.05)
    -- Kart büyüyerek + yukarı çıkarak gelir
    tween(keyFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -210, 0.5, -110),
        BackgroundTransparency = 0,
        Size = UDim2.new(0, 420, 0, 220),
    })
    task.wait(0.2)
    -- Harfler soldan sağa stagger ile belirir
    for i, lbl in ipairs(keyTitleCharLabels) do
        task.delay((i - 1) * 0.04, function()
            lbl.Position = UDim2.new(0, 0, 0.15, 0)
            tween(lbl, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                Position = UDim2.new(0, 0, 0, 0),
            })
        end)
    end
    task.wait(0.3)
    -- Alt yazı yukarıdan kayar
    tween(keyDesc, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        TextTransparency = 0,
        Position = UDim2.new(0, 10, 0, 55),
    })
    -- Stroke hafif pulse
    task.wait(0.1)
    pulseStroke(kfStroke, C.BORDER, C.ACCENT, 3)
end)

local function tryKey()
    local entered = keyBox.Text
    if VALID_KEYS[entered] then
        -- Başarı: yeşil flash + dissolve
        tween(kbStroke, EASE_FAST, {Color = C.GREEN})
        tween(keyFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
              {BackgroundTransparency = 1, Position = UDim2.new(0.5,-210,0.5,-70)})
        task.wait(0.45)
        keyGui:Destroy()
        loadMainScript()
    else
        keyError.Text = "❌ Geçersiz key!"
        keyError.Visible = true
        keyEnterBtn.Visible = false
        tween(kbStroke, EASE_FAST, {Color = C.RED})
        -- Sarsma animasyonu
        local origPos = keyBox.Position
        local function shake(dx)
            tween(keyBox, TweenInfo.new(0.05, Enum.EasingStyle.Linear),
                  {Position = origPos + UDim2.new(0, dx, 0, 0)})
        end
        task.spawn(function()
            for _, dx in ipairs({8,-8,6,-6,4,-4,0}) do
                shake(dx) task.wait(0.05)
            end
        end)
        keyBox.Text = ""
        task.delay(2, function()
            keyError.Visible = false
            keyEnterBtn.Visible = true
            tween(kbStroke, EASE_FAST, {Color = C.BORDER})
        end)
    end
end

keyEnterBtn.MouseButton1Click:Connect(tryKey)
keyBox.FocusLost:Connect(function(enter) if enter then tryKey() end end)

-- ══════════════════════════════════════════════════════════════════════════════
--  ANA SCRIPT
-- ══════════════════════════════════════════════════════════════════════════════
function loadMainScript()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MidyeNeighboursPanel"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

-- ── Ana panel ──────────────────────────────────────────────────────────────
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 580, 0, 640)
mainFrame.Position = UDim2.new(0.5, -290, 0.5, -320)
mainFrame.BackgroundColor3 = C.BG
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.ClipsDescendants = true
mainFrame.BackgroundTransparency = 0
addCorner(mainFrame, 18)

local mfStroke = addStroke(mainFrame, C.BORDER, 1.5)

-- Giriş animasyonu
mainFrame.BackgroundTransparency = 1
mainFrame.Position = UDim2.new(0.5,-290,0.5,-370)
task.spawn(function()
    task.wait(0.05)
    tween(mainFrame, EASE_OUT, {
        BackgroundTransparency = 0,
        Position = UDim2.new(0.5,-290,0.5,-320)
    })
end)

-- Arka plan doku (çok ince nokta desen - Frame mosaic)
local dotCanvas = Instance.new("Frame")
dotCanvas.Size = UDim2.new(1,0,1,0)
dotCanvas.BackgroundTransparency = 1
dotCanvas.ZIndex = 0
dotCanvas.Parent = mainFrame
do
    local step = 28
    for row = 0, 22 do
        for col = 0, 20 do
            local d = Instance.new("Frame")
            d.Size = UDim2.new(0,2,0,2)
            d.Position = UDim2.new(0, col*step, 0, row*step)
            d.BackgroundColor3 = C.ACCENT
            d.BackgroundTransparency = 0.93
            d.BorderSizePixel = 0
            d.ZIndex = 0
            d.Parent = dotCanvas
            addCorner(d, 1)
        end
    end
end

-- ── Başlık çubuğu ──────────────────────────────────────────────────────────
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = C.SURFACE
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 2
titleBar.Parent = mainFrame
addCorner(titleBar, 18)

-- Başlık çubuğu alt kısmını düzleştir
local titleBarFill = Instance.new("Frame")
titleBarFill.Size = UDim2.new(1,0,0.5,0)
titleBarFill.Position = UDim2.new(0,0,0.5,0)
titleBarFill.BackgroundColor3 = C.SURFACE
titleBarFill.BorderSizePixel = 0
titleBarFill.ZIndex = 2
titleBarFill.Parent = titleBar

-- Çok ince gradient şerit (başlık alt sınırı)
local titleDivider = Instance.new("Frame")
titleDivider.Size = UDim2.new(1,0,0,1)
titleDivider.Position = UDim2.new(0,0,1,-1)
titleDivider.BackgroundColor3 = C.ACCENT
titleDivider.BackgroundTransparency = 0.6
titleDivider.BorderSizePixel = 0
titleDivider.ZIndex = 3
titleDivider.Parent = titleBar

-- ── Renkli başlık (her harf ayrı renk) ────────────────────────────────────
local titleLabel = Instance.new("Frame")
titleLabel.Size = UDim2.new(1, -110, 1, 0)
titleLabel.Position = UDim2.new(0, 18, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.ClipsDescendants = false
titleLabel.ZIndex = 3
titleLabel.Parent = titleBar

local titleLayout = Instance.new("UIListLayout")
titleLayout.FillDirection = Enum.FillDirection.Horizontal
titleLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
titleLayout.VerticalAlignment = Enum.VerticalAlignment.Center
titleLayout.Padding = UDim.new(0, 0)
titleLayout.Parent = titleLabel

-- Renk gradyanı: indigo → violet → soft pink → sky blue → indigo
local titleColors = {
    Color3.fromRGB( 99, 102, 241),  -- indigo
    Color3.fromRGB(109,  93, 245),  -- indigo-violet
    Color3.fromRGB(124,  77, 255),  -- violet
    Color3.fromRGB(139,  92, 246),  -- purple
    Color3.fromRGB(155,  89, 240),  -- soft purple
    Color3.fromRGB(168,  85, 247),  -- violet-pink
    Color3.fromRGB(180,  80, 230),  -- pink-violet
    Color3.fromRGB(192,  75, 210),  -- soft pink
    Color3.fromRGB(180,  80, 230),  -- pink-violet
    Color3.fromRGB(155,  89, 240),  -- soft purple
    Color3.fromRGB(124,  77, 255),  -- violet
    Color3.fromRGB(100, 100, 255),  -- blue-violet
    Color3.fromRGB( 79, 120, 255),  -- soft blue
    Color3.fromRGB( 56, 145, 255),  -- sky blue
    Color3.fromRGB( 79, 120, 255),  -- soft blue
    Color3.fromRGB(100, 100, 255),  -- blue-violet
    Color3.fromRGB(109,  93, 245),  -- indigo-violet
    Color3.fromRGB( 99, 102, 241),  -- indigo
    Color3.fromRGB(109,  93, 245),
    Color3.fromRGB(124,  77, 255),
    Color3.fromRGB(139,  92, 246),
    Color3.fromRGB(155,  89, 240),
    Color3.fromRGB(168,  85, 247),
    Color3.fromRGB(180,  80, 230),
    Color3.fromRGB(192,  75, 210),
    Color3.fromRGB(180,  80, 230),
    Color3.fromRGB(155,  89, 240),
    Color3.fromRGB(124,  77, 255),
    Color3.fromRGB(100, 100, 255),
    Color3.fromRGB( 79, 120, 255),
}

local titleText = "MIDYE SCRIPT"
local titleCharLabels = {}

-- Emoji için ayrı label (GothamBold emoji render etmiyor)
local emojiLbl = Instance.new("TextLabel")
emojiLbl.Size = UDim2.new(0, 0, 1, 0)
emojiLbl.AutomaticSize = Enum.AutomaticSize.X
emojiLbl.BackgroundTransparency = 1
emojiLbl.Text = "⚡ "
emojiLbl.TextColor3 = Color3.fromRGB(255, 220, 80)
emojiLbl.TextSize = 11
emojiLbl.Font = Enum.Font.Legacy
emojiLbl.TextXAlignment = Enum.TextXAlignment.Left
emojiLbl.ZIndex = 3
emojiLbl.Parent = titleLabel

for i = 1, #titleText do
    local ch = titleText:sub(i, i)
    local col = titleColors[i] or titleColors[#titleColors]
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 0, 1, 0)
    lbl.AutomaticSize = Enum.AutomaticSize.X
    lbl.BackgroundTransparency = 1
    lbl.Text = ch
    lbl.TextColor3 = col
    lbl.TextSize = 19
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.Parent = titleLabel
    titleCharLabels[i] = lbl
end

-- Başlık renk kayma animasyonu (wave effect)
task.spawn(function()
    local t = 0
    while titleLabel and titleLabel.Parent do
        t = t + task.wait(0.05)
        for i, lbl in ipairs(titleCharLabels) do
            if not lbl.Parent then break end
            local offset = (i / #titleCharLabels) + t * 0.4
            local alpha  = (math.sin(offset * math.pi * 2) + 1) / 2
            -- indigo ↔ sky blue arası yumuşak geçiş
            lbl.TextColor3 = Color3.fromRGB( 99, 102, 241):Lerp(
                             Color3.fromRGB( 56, 145, 255), alpha)
        end
    end
end)

-- Minimize için renkli MIDYE label sistemi
local titleLabelMin = Instance.new("Frame")
titleLabelMin.Size = UDim2.new(1, -110, 1, 0)
titleLabelMin.Position = UDim2.new(0, 18, 0, 0)
titleLabelMin.BackgroundTransparency = 1
titleLabelMin.ClipsDescendants = false
titleLabelMin.ZIndex = 3
titleLabelMin.Visible = false
titleLabelMin.Parent = titleBar

local titleLayoutMin = Instance.new("UIListLayout")
titleLayoutMin.FillDirection = Enum.FillDirection.Horizontal
titleLayoutMin.HorizontalAlignment = Enum.HorizontalAlignment.Left
titleLayoutMin.VerticalAlignment = Enum.VerticalAlignment.Center
titleLayoutMin.Padding = UDim.new(0, 0)
titleLayoutMin.Parent = titleLabelMin

-- Emoji
local emojiLblMin = Instance.new("TextLabel")
emojiLblMin.Size = UDim2.new(0, 0, 1, 0)
emojiLblMin.AutomaticSize = Enum.AutomaticSize.X
emojiLblMin.BackgroundTransparency = 1
emojiLblMin.Text = "⚡ "
emojiLblMin.TextColor3 = Color3.fromRGB(255, 220, 80)
emojiLblMin.TextSize = 13
emojiLblMin.Font = Enum.Font.Legacy
emojiLblMin.TextXAlignment = Enum.TextXAlignment.Left
emojiLblMin.ZIndex = 3
emojiLblMin.Parent = titleLabelMin

local minText = "MIDYE"
local minCharLabels = {}
for i = 1, #minText do
    local ch = minText:sub(i, i)
    local col = titleColors[i] or titleColors[#titleColors]
    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 0, 1, 0)
    lbl.AutomaticSize = Enum.AutomaticSize.X
    lbl.BackgroundTransparency = 1
    lbl.Text = ch
    lbl.TextColor3 = col
    lbl.TextSize = 19
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.Parent = titleLabelMin
    minCharLabels[i] = lbl
end

-- Minimize başlık wave animasyonu
task.spawn(function()
    local t = 0
    while titleLabelMin and titleLabelMin.Parent do
        t = t + task.wait(0.05)
        for i, lbl in ipairs(minCharLabels) do
            if not lbl.Parent then break end
            local offset = (i / #minCharLabels) + t * 0.4
            local alpha  = (math.sin(offset * math.pi * 2) + 1) / 2
            lbl.TextColor3 = Color3.fromRGB(99, 102, 241):Lerp(
                             Color3.fromRGB(56, 145, 255), alpha)
        end
    end
end)

local btnGroup = Instance.new("Frame")
btnGroup.Size = UDim2.new(0, 65, 0, 22)
btnGroup.Position = UDim2.new(1, -75, 0.5, -11)
btnGroup.BackgroundTransparency = 1
btnGroup.ZIndex = 3
btnGroup.Parent = titleBar

local function makeDotBtn(xOff, col, strokeCol)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 22, 0, 22)
    b.Position = UDim2.new(0, xOff, 0, 0)
    b.BackgroundColor3 = col
    b.Text = ""
    b.AutoButtonColor = false
    b.ZIndex = 4
    b.Parent = btnGroup
    addCorner(b, 11)
    addStroke(b, strokeCol, 1, 0.2)
    hookHover(b, col, col:Lerp(Color3.fromRGB(255,255,255), 0.25))
    return b
end

local minimizeBtn = makeDotBtn(0,  Color3.fromRGB(255, 189,  46), Color3.fromRGB(180,130,  0))
local closeBtn    = makeDotBtn(33, Color3.fromRGB(255,  95,  87), Color3.fromRGB(180, 40, 40))

-- Küçük ikon (hover'da görünür)
local minIcon = Instance.new("TextLabel")
minIcon.Size = UDim2.new(1,0,1,0)
minIcon.BackgroundTransparency = 1
minIcon.Text = "–"
minIcon.TextColor3 = Color3.fromRGB(120,80,0)
minIcon.TextSize = 14
minIcon.Font = Enum.Font.GothamBold
minIcon.TextTransparency = 1
minIcon.ZIndex = 5
minIcon.Parent = minimizeBtn

local clsIcon = Instance.new("TextLabel")
clsIcon.Size = UDim2.new(1,0,1,0)
clsIcon.BackgroundTransparency = 1
clsIcon.Text = "×"
clsIcon.TextColor3 = Color3.fromRGB(120,30,30)
clsIcon.TextSize = 14
clsIcon.Font = Enum.Font.GothamBold
clsIcon.TextTransparency = 1
clsIcon.ZIndex = 5
clsIcon.Parent = closeBtn

minimizeBtn.MouseEnter:Connect(function() tween(minIcon, EASE_FAST, {TextTransparency=0}) end)
minimizeBtn.MouseLeave:Connect(function() tween(minIcon, EASE_FAST, {TextTransparency=1}) end)
closeBtn.MouseEnter:Connect(function()    tween(clsIcon, EASE_FAST, {TextTransparency=0}) end)
closeBtn.MouseLeave:Connect(function()    tween(clsIcon, EASE_FAST, {TextTransparency=1}) end)

closeBtn.MouseButton1Click:Connect(function()
    local origSize = mainFrame.Size
    local origPos  = mainFrame.Position
    -- Merkeze doğru küçülerek yok olur
    tween(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(
            origPos.X.Scale, origPos.X.Offset + origSize.X.Offset / 2,
            origPos.Y.Scale, origPos.Y.Offset + origSize.Y.Offset / 2
        ),
        BackgroundTransparency = 1,
    })
    tween(mfStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Transparency = 1,
    })
    task.wait(0.37)
    screenGui:Destroy()
end)

-- ── Sürükleme ───────────────────────────────────────────────────────────────
local dragging, dragInput, dragStart, startPos = false, nil, nil, nil

local function updateDrag(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

local function attachDrag(handle)
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging  = true
            dragStart = input.Position
            startPos  = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
    end)
end

-- ── Alt çubuk ───────────────────────────────────────────────────────────────
local bottomHandle = Instance.new("Frame")
bottomHandle.Size = UDim2.new(1, -32, 0, 32)
bottomHandle.Position = UDim2.new(0, 0, 1, -32)
bottomHandle.BackgroundColor3 = C.SURFACE
bottomHandle.BackgroundTransparency = 0
bottomHandle.BorderSizePixel = 0
bottomHandle.ZIndex = 8
bottomHandle.Parent = mainFrame
addCorner(bottomHandle, 18)

local bottomFill = Instance.new("Frame")
bottomFill.Size = UDim2.new(1,0,0.5,0)
bottomFill.BackgroundColor3 = C.SURFACE
bottomFill.BorderSizePixel = 0
bottomFill.ZIndex = 8
bottomFill.Parent = bottomHandle

local topDiv = Instance.new("Frame")
topDiv.Size = UDim2.new(1,0,0,1)
topDiv.BackgroundColor3 = C.ACCENT
topDiv.BackgroundTransparency = 0.7
topDiv.BorderSizePixel = 0
topDiv.ZIndex = 9
topDiv.Parent = bottomHandle

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
discordLabel.TextColor3 = C.ACCENT2
discordLabel.TextTransparency = 0.1
discordLabel.TextSize = 13
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
gunsLabel.TextColor3 = C.GREEN
gunsLabel.TextTransparency = 0.1
gunsLabel.TextSize = 13
gunsLabel.TextTruncate = Enum.TextTruncate.AtEnd
gunsLabel.Font = Enum.Font.Gotham
gunsLabel.AutoButtonColor = false
gunsLabel.ZIndex = 16
gunsLabel.Parent = infoBar

-- ── TOAST ──────────────────────────────────────────────────────────────────
local toastGui = Instance.new("ScreenGui")
toastGui.Name = "MidyeToast"
toastGui.ResetOnSpawn = false
toastGui.Parent = game:GetService("CoreGui")

-- Ana toast kartı
local toastFrame = Instance.new("Frame")
toastFrame.Size = UDim2.new(0, 320, 0, 80)
toastFrame.AnchorPoint = Vector2.new(0.5, 0.5)
toastFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
toastFrame.BackgroundColor3 = C.SURFACE
toastFrame.BackgroundTransparency = 1
toastFrame.BorderSizePixel = 0
toastFrame.ZIndex = 999
toastFrame.Visible = false
toastFrame.Parent = toastGui
addCorner(toastFrame, 40)
addStroke(toastFrame, C.BORDER, 1.5, 0)

-- İkon alanı
local toastIcon = Instance.new("TextLabel")
toastIcon.Size = UDim2.new(0, 36, 0, 36)
toastIcon.Position = UDim2.new(0, 26, 0.5, -18)
toastIcon.BackgroundColor3 = C.SURFACE2
toastIcon.BackgroundTransparency = 0
toastIcon.Text = "📋"
toastIcon.TextSize = 18
toastIcon.Font = Enum.Font.Legacy
toastIcon.TextTransparency = 1
toastIcon.ZIndex = 1001
toastIcon.Parent = toastFrame
addCorner(toastIcon, 10)
addStroke(toastIcon, C.BORDER, 1, 0.3)

-- Başlık
local toastTitle = Instance.new("TextLabel")
toastTitle.Size = UDim2.new(1, -82, 0, 24)
toastTitle.Position = UDim2.new(0, 72, 0, 14)
toastTitle.BackgroundTransparency = 1
toastTitle.Text = ""
toastTitle.TextColor3 = C.TEXT
toastTitle.TextTransparency = 1
toastTitle.TextSize = 18
toastTitle.TextTruncate = Enum.TextTruncate.AtEnd
toastTitle.Font = Enum.Font.GothamBold
toastTitle.TextXAlignment = Enum.TextXAlignment.Left
toastTitle.ZIndex = 1001
toastTitle.Parent = toastFrame

-- Alt yazı
local toastLabel = Instance.new("TextLabel")
toastLabel.Size = UDim2.new(1, -82, 0, 18)
toastLabel.Position = UDim2.new(0, 72, 0, 40)
toastLabel.BackgroundTransparency = 1
toastLabel.Text = ""
toastLabel.TextColor3 = C.TEXT_MUTED
toastLabel.TextTransparency = 1
toastLabel.TextSize = 14
toastLabel.TextTruncate = Enum.TextTruncate.AtEnd
toastLabel.Font = Enum.Font.Gotham
toastLabel.TextXAlignment = Enum.TextXAlignment.Left
toastLabel.ZIndex = 1001
toastLabel.Parent = toastFrame

-- Progress bar (alt)
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(1, -80, 0, 3)
progressBg.Position = UDim2.new(0, 40, 1, -10)
progressBg.BackgroundColor3 = C.SURFACE2
progressBg.BorderSizePixel = 0
progressBg.ZIndex = 1001
progressBg.Parent = toastFrame
addCorner(progressBg, 2)

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(1, 0, 1, 0)
progressBar.BackgroundColor3 = C.ACCENT
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 1002
progressBar.Parent = progressBg
addCorner(progressBar, 2)
addGradient(progressBar, C.ACCENT, Color3.fromRGB(56, 145, 255), 90)

local toastActive = false
local toastThread = nil
local progressTween = nil

local function showToast(title, sub, icon, accentColor)
    if toastThread then task.cancel(toastThread); toastThread = nil end
    if progressTween then progressTween:Cancel(); progressTween = nil end
    toastActive = true
    toastTitle.Text = title or ""
    toastLabel.Text = sub   or ""
    toastIcon.Text  = icon  or "📋"
    local ac = accentColor or C.ACCENT

    -- Her seferinde sıfırdan başlat
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    toastFrame.Position = UDim2.new(0.5, 0, 0.5, -30)
    toastFrame.BackgroundTransparency = 1
    toastTitle.TextTransparency = 1
    toastLabel.TextTransparency = 1
    toastIcon.TextTransparency  = 1
    toastFrame.Visible = true

    tween(toastFrame,  EASE_OUT, {Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 0})
    tween(toastTitle,  EASE_OUT, {TextTransparency = 0})
    tween(toastLabel,  EASE_OUT, {TextTransparency = 0})
    tween(toastIcon,   EASE_OUT, {TextTransparency = 0})

    progressTween = TweenService:Create(progressBar, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})
    progressTween:Play()

    toastThread = task.delay(3, function()
        if not toastActive then return end
        tween(toastFrame,  EASE_IN, {Position = UDim2.new(0.5, 0, 0.5, 30), BackgroundTransparency = 1})
        tween(toastTitle,  EASE_IN, {TextTransparency = 1})
        tween(toastLabel,  EASE_IN, {TextTransparency = 1})
        tween(toastIcon,   EASE_IN, {TextTransparency = 1})
        task.delay(0.3, function()
            toastFrame.Visible = false
            toastActive = false
            toastThread = nil
            progressTween = nil
        end)
    end)
end

discordLabel.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("discord.com/users/394377899530125322") end)
    showToast("Discord", "Kullanıcı adı panoya kopyalandı", "💬", Color3.fromRGB(88, 101, 242))
end)
discordLabel.MouseEnter:Connect(function() tween(discordLabel,EASE_FAST,{TextTransparency=0}) end)
discordLabel.MouseLeave:Connect(function() tween(discordLabel,EASE_FAST,{TextTransparency=0.1}) end)

gunsLabel.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("guns.lol/realsherlock") end)
    showToast("Guns.lol", "Profil linki panoya kopyalandı", "🎮", Color3.fromRGB(59, 165, 93))
end)
gunsLabel.MouseEnter:Connect(function() tween(gunsLabel,EASE_FAST,{TextTransparency=0}) end)
gunsLabel.MouseLeave:Connect(function() tween(gunsLabel,EASE_FAST,{TextTransparency=0.1}) end)

attachDrag(titleBar)
attachDrag(bottomHandle)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then updateDrag(input) end
end)

-- ── Resize handle ──────────────────────────────────────────────────────────
local resizeHandle = Instance.new("TextButton")
resizeHandle.Size = UDim2.new(0, 28, 0, 28)
resizeHandle.Position = UDim2.new(1, -30, 1, -30)
resizeHandle.BackgroundColor3 = C.SURFACE
resizeHandle.BackgroundTransparency = 0
resizeHandle.Text = ""
resizeHandle.AutoButtonColor = false
resizeHandle.ZIndex = 10
resizeHandle.Parent = mainFrame
addCorner(resizeHandle, 8)
addStroke(resizeHandle, C.BORDER, 1.5, 0.3)

-- 6 nokta deseni
for _, pos in ipairs({{6,14},{11,9},{16,4},{11,14},{16,9},{16,14}}) do
    local dot = Instance.new("Frame")
    dot.Size = UDim2.new(0,3,0,3)
    dot.Position = UDim2.new(0,pos[1],0,pos[2])
    dot.BackgroundColor3 = C.ACCENT
    dot.BackgroundTransparency = 0.2
    dot.BorderSizePixel = 0
    dot.ZIndex = 11
    dot.Parent = resizeHandle
    addCorner(dot, 2)
end

resizeHandle.MouseEnter:Connect(function() tween(resizeHandle,EASE_FAST,{BackgroundColor3=C.SURFACE2}) end)
resizeHandle.MouseLeave:Connect(function() tween(resizeHandle,EASE_FAST,{BackgroundColor3=C.SURFACE}) end)

local tweenInfo    = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local resizing, resizeStart, resizeStartSize = false, nil, nil

resizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        resizing       = true
        resizeStart    = input.Position
        resizeStartSize= mainFrame.Size
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then resizing = false end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta   = input.Position - resizeStart
        local newW    = math.max(400, resizeStartSize.X.Offset + delta.X)
        local newH    = math.max(580, resizeStartSize.Y.Offset + delta.Y)
        mainFrame.Size= UDim2.new(0, newW, 0, newH)
    end
end)

-- ── Sol bölüm ──────────────────────────────────────────────────────────────
local leftSection = Instance.new("Frame")
leftSection.Size = UDim2.new(0.45, -10, 1, -82)
leftSection.Position = UDim2.new(0, 10, 0, 45)
leftSection.BackgroundColor3 = C.SURFACE
leftSection.BorderSizePixel = 0
leftSection.ClipsDescendants = true
leftSection.BackgroundTransparency = 0
leftSection.Parent = mainFrame
addCorner(leftSection, 14)
addStroke(leftSection, C.BORDER, 1.5)

local playerListTitle = Instance.new("TextLabel")
playerListTitle.Size = UDim2.new(1, 0, 0, 40)
playerListTitle.BackgroundTransparency = 1
playerListTitle.Text = "👥 OYUNCULAR"
playerListTitle.TextColor3 = C.TEXT
playerListTitle.TextSize = 16
playerListTitle.TextTruncate = Enum.TextTruncate.AtEnd
playerListTitle.Font = Enum.Font.GothamBold
playerListTitle.Parent = leftSection

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
searchBox.BackgroundColor3 = C.SURFACE2
searchBox.Text = ""
searchBox.PlaceholderText = "🔍 İsim ara..."
searchBox.PlaceholderColor3 = C.TEXT_MUTED
searchBox.TextColor3 = C.TEXT
searchBox.TextSize = 14
searchBox.TextTruncate = Enum.TextTruncate.AtEnd
searchBox.Font = Enum.Font.Gotham
searchBox.Parent = searchContainer
addCorner(searchBox, 8)
local sbStroke = addStroke(searchBox, C.BORDER, 1.5)
searchBox.Focused:Connect(function()  tween(sbStroke,EASE_FAST,{Color=C.ACCENT}) end)
searchBox.FocusLost:Connect(function() tween(sbStroke,EASE_FAST,{Color=C.BORDER}) end)

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0.35, 0, 0, 42)
clearBtn.BackgroundColor3 = C.BLUE
clearBtn.Text = "TEMİZLE"
clearBtn.TextTruncate = Enum.TextTruncate.AtEnd
clearBtn.TextColor3 = Color3.fromRGB(255,255,255)
clearBtn.TextSize = 13
clearBtn.Font = Enum.Font.GothamBold
clearBtn.AutoButtonColor = false
clearBtn.Parent = searchContainer
addCorner(clearBtn, 8)
addGradient(clearBtn, C.ACCENT, C.ACCENT2, 135)
hookHover(clearBtn, C.BLUE, C.BLUE_H)
hookPress(clearBtn)

local playerListFrame = Instance.new("ScrollingFrame")
playerListFrame.Size = UDim2.new(1, -10, 1, -270)
playerListFrame.Position = UDim2.new(0, 5, 0, 95)
playerListFrame.BackgroundTransparency = 1
playerListFrame.ScrollBarThickness = 4
playerListFrame.ScrollBarImageColor3 = C.ACCENT
playerListFrame.BorderSizePixel = 0
playerListFrame.Parent = leftSection

local playerListLayout = Instance.new("UIListLayout")
playerListLayout.Padding = UDim.new(0, 6)
playerListLayout.Parent = playerListFrame

-- ── Seçili oyuncu paneli ────────────────────────────────────────────────────
local selectedPanel = Instance.new("Frame")
selectedPanel.Size = UDim2.new(1, -20, 0, 165)
selectedPanel.Position = UDim2.new(0, 10, 1, -175)
selectedPanel.BackgroundColor3 = C.SURFACE2
selectedPanel.BorderSizePixel = 0
selectedPanel.Parent = leftSection
addCorner(selectedPanel, 12)
addStroke(selectedPanel, C.BORDER, 1.5)

local selectedLabel = Instance.new("TextLabel")
selectedLabel.Size = UDim2.new(1, -10, 0, 32)
selectedLabel.Position = UDim2.new(0, 5, 0, 8)
selectedLabel.BackgroundTransparency = 1
selectedLabel.Text = "🎯 Seçili: Yok"
selectedLabel.TextColor3 = C.ACCENT2
selectedLabel.TextSize = 14
selectedLabel.TextTruncate = Enum.TextTruncate.AtEnd
selectedLabel.Font = Enum.Font.GothamBold
selectedLabel.TextXAlignment = Enum.TextXAlignment.Left
selectedLabel.Parent = selectedPanel

-- Küçük yardımcı: toggle butonu oluştur
local function makeToggleBtn(parent, size, pos, text)
    local btn = Instance.new("TextButton")
    btn.Size = size
    btn.Position = pos
    btn.BackgroundColor3 = C.GREEN
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextSize = 14
    btn.TextTruncate = Enum.TextTruncate.AtEnd
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = parent
    addCorner(btn, 8)
    addStroke(btn, C.BORDER, 1, 0.3)
    hookPress(btn)
    return btn
end

local viewBtn = makeToggleBtn(selectedPanel,
    UDim2.new(0.9,0,0,36), UDim2.new(0.05,0,0,45), "👁️ VIEW KAPALI")
local autoTPBtn = makeToggleBtn(selectedPanel,
    UDim2.new(0.9,0,0,36), UDim2.new(0.05,0,0,86), "⚡ AUTO TP KAPALI")

local manualTPBtn = Instance.new("TextButton")
manualTPBtn.Size = UDim2.new(0.9,0,0,36)
manualTPBtn.Position = UDim2.new(0.05,0,0,127)
manualTPBtn.BackgroundColor3 = C.BLUE
manualTPBtn.Text = "🚀 ŞİMDİ TP AT"
manualTPBtn.TextColor3 = Color3.fromRGB(255,255,255)
manualTPBtn.TextSize = 14
manualTPBtn.TextTruncate = Enum.TextTruncate.AtEnd
manualTPBtn.Font = Enum.Font.GothamBold
manualTPBtn.AutoButtonColor = false
manualTPBtn.Parent = selectedPanel
addCorner(manualTPBtn, 8)
addGradient(manualTPBtn, C.ACCENT, C.ACCENT2, 135)
addStroke(manualTPBtn, C.ACCENT, 1, 0.4)
hookHover(manualTPBtn, C.BLUE, C.BLUE_H)
hookPress(manualTPBtn)

hookHover(viewBtn,   C.GREEN, C.GREEN_H)
hookHover(autoTPBtn, C.GREEN, C.GREEN_H)

-- ── Sağ bölüm ──────────────────────────────────────────────────────────────
local rightSection = Instance.new("Frame")
rightSection.Size = UDim2.new(0.55, -10, 1, -82)
rightSection.Position = UDim2.new(0.45, 0, 0, 45)
rightSection.BackgroundColor3 = C.SURFACE
rightSection.BorderSizePixel = 0
rightSection.ClipsDescendants = true
rightSection.Parent = mainFrame
addCorner(rightSection, 14)
addStroke(rightSection, C.BORDER, 1.5)

local cheatTitle = Instance.new("TextLabel")
cheatTitle.Size = UDim2.new(1, 0, 0, 48)
cheatTitle.BackgroundTransparency = 1
cheatTitle.Text = "⚙️ HİLE MENÜSÜ"
cheatTitle.TextColor3 = C.TEXT
cheatTitle.TextSize = 18
cheatTitle.TextTruncate = Enum.TextTruncate.AtEnd
cheatTitle.Font = Enum.Font.GothamBold
cheatTitle.Parent = rightSection

-- ── Hile butonları ─────────────────────────────────────────────────────────
local cheatButtons = {}
local buttonData = {
    {Text = "✈️ FLY KAPALI",    Color = C.GREEN},
    {Text = "👻 NOCLIP KAPALI", Color = C.GREEN},
    {Text = "🔍 ESP KAPALI",    Color = C.GREEN},
    {Text = "🔄 REJOIN",        Color = C.RED},
}

for i, data in ipairs(buttonData) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 58)
    btn.Position = UDim2.new(0.05, 0, 0, 58 + (i - 1) * 68)
    btn.BackgroundColor3 = data.Color
    btn.Text = data.Text
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextSize = 16
    btn.TextTruncate = Enum.TextTruncate.AtEnd
    btn.Font = Enum.Font.GothamBold
    btn.AutoButtonColor = false
    btn.Parent = rightSection
    addCorner(btn, 12)

    addStroke(btn, C.BORDER, 1.5, 0.2)
    hookToggleHover(btn)
    hookPress(btn)

    cheatButtons[data.Text] = btn
end

-- ── Ayarlar ─────────────────────────────────────────────────────────────────
local settingsContainer = Instance.new("Frame")
settingsContainer.Size = UDim2.new(0.9, 0, 0, 210)
settingsContainer.Position = UDim2.new(0.05, 0, 0, 338)
settingsContainer.BackgroundTransparency = 1
settingsContainer.Parent = rightSection

local settingsData = {
    {Label = "⚡ Uçuş Hızı:",        Default = "120"},
    {Label = "🏃 Koşu Hızı:",        Default = "16"},
    {Label = "📊 DataLimit (KBPS):", Default = "1"},
}

local controls = {}

for i, s in ipairs(settingsData) do
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 52)
    frame.Position = UDim2.new(0, 0, 0, (i-1)*58)
    frame.BackgroundTransparency = 1
    frame.Parent = settingsContainer

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.48, 0, 0, 42)
    label.BackgroundTransparency = 1
    label.Text = s.Label
    label.TextColor3 = C.TEXT
    label.TextSize = 14
    label.TextTruncate = Enum.TextTruncate.AtEnd
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0.5, -10, 0, 42)
    box.Position = UDim2.new(0.5, 5, 0, 0)
    box.BackgroundColor3 = C.SURFACE2
    box.Text = s.Default
    box.TextColor3 = C.ACCENT2
    box.TextSize = 16
    box.TextTruncate = Enum.TextTruncate.AtEnd
    box.Font = Enum.Font.GothamBold
    box.Parent = frame
    addCorner(box, 8)
    local bxStroke = addStroke(box, C.BORDER, 1.5)
    box.Focused:Connect(function()  tween(bxStroke,EASE_FAST,{Color=C.ACCENT}) end)
    box.FocusLost:Connect(function() tween(bxStroke,EASE_FAST,{Color=C.BORDER}) end)

    controls[s.Label] = box
end

-- ══════════════════════════════════════════════════════════════════════════════
--  FONKSİYONLAR (orijinalin tamamıyla aynı, sadece UI renk güncellemeleri)
-- ══════════════════════════════════════════════════════════════════════════════
local selectedPlayer = nil
local selectedButton = nil
local viewEnabled  = false
local autoTPEnabled= false
local viewConnection = nil
local autoTPConnection = nil
local espEnabled   = false
local espObjects   = {}
local flying       = false
local flySpeed     = 120
local walkSpeed    = 16
local bv, bg, flyConnection
local noclipEnabled   = false
local noclipConnection= nil

local function updateSelectedUI()
    selectedLabel.Text = "🎯 Seçili: "..(selectedPlayer and selectedPlayer.Name or "Yok")
end

local function applyView()
    if viewConnection then viewConnection:Disconnect(); viewConnection = nil end
    local cam   = workspace.CurrentCamera
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
    local col = viewEnabled and C.RED or C.GREEN
    tween(viewBtn, EASE_FAST, {BackgroundColor3 = col})
    applyView()
end

local function toggleAutoTP()
    autoTPEnabled = not autoTPEnabled
    autoTPBtn.Text = autoTPEnabled and "⚡ AUTO TP AÇIK" or "⚡ AUTO TP KAPALI"
    local col = autoTPEnabled and C.RED or C.GREEN
    tween(autoTPBtn, EASE_FAST, {BackgroundColor3 = col})
    if autoTPEnabled then
        autoTPConnection = RunService.Heartbeat:Connect(function()
            if not autoTPEnabled or not selectedPlayer or not selectedPlayer.Character or not localPlayer.Character then return end
            local tr = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
            local mr = localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if tr and mr then mr.CFrame = tr.CFrame * CFrame.new(0,5,0) end
        end)
    else
        if autoTPConnection then autoTPConnection:Disconnect(); autoTPConnection = nil end
    end
end

local function manualTP()
    if not selectedPlayer or not selectedPlayer.Character then return end
    local myChar = localPlayer.Character
    local tr     = selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
    local mr     = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if tr and mr then mr.CFrame = tr.CFrame * CFrame.new(0,5,0) end
end

-- ESP
local function createESP(plr)
    if espObjects[plr] or plr == localPlayer then return end
    local function applyToCharacter(character)
        if not character then return end
        local root = character:WaitForChild("HumanoidRootPart", 5)
        if not root then return end
        if espObjects[plr] then
            if espObjects[plr].DistConn  then espObjects[plr].DistConn:Disconnect() end
            if espObjects[plr].TeamConn  then espObjects[plr].TeamConn:Disconnect() end
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
                return Color3.fromRGB(0,120,255), Color3.fromRGB(150,200,255)
            else
                return Color3.fromRGB(220,50,50), Color3.fromRGB(255,255,255)
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
        billboard.Size = UDim2.new(0,120,0,36)
        billboard.StudsOffset = Vector3.new(0,3.5,0)
        billboard.AlwaysOnTop = true
        billboard.LightInfluence = 0
        billboard.Parent = character
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1,0,0.55,0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = plr.Name
        nameLabel.TextColor3 = Color3.fromRGB(255,255,255)
        nameLabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
        nameLabel.TextStrokeTransparency = 0.3
        nameLabel.TextSize = 12
        nameLabel.TextTruncate = Enum.TextTruncate.AtEnd
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextXAlignment = Enum.TextXAlignment.Center
        nameLabel.Visible = not isSameTeam()
        nameLabel.Parent = billboard
        local distLabel = Instance.new("TextLabel")
        distLabel.Size = UDim2.new(1,0,0.45,0)
        distLabel.Position = UDim2.new(0,0,0.55,0)
        distLabel.BackgroundTransparency = 1
        distLabel.Text = "0m"
        distLabel.TextColor3 = Color3.fromRGB(180,220,255)
        distLabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
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
                distLabel.Text = math.round((myRoot.Position - root.Position).Magnitude * 0.359).."m"
            end
        end)
        local teamConn = plr:GetPropertyChangedSignal("Team"):Connect(function()
            local fill, outline = getTeamColors()
            if highlight.Parent then highlight.FillColor = fill; highlight.OutlineColor = outline end
            local enemy = not isSameTeam()
            nameLabel.Visible = enemy; distLabel.Visible = enemy
        end)
        espObjects[plr] = {Highlight=highlight, Billboard=billboard, DistConn=distConn, TeamConn=teamConn}
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
        if espObjects[plr].DistConn  then espObjects[plr].DistConn:Disconnect() end
        if espObjects[plr].HealthConn then espObjects[plr].HealthConn:Disconnect() end
        if espObjects[plr].TeamConn  then espObjects[plr].TeamConn:Disconnect() end
        espObjects[plr] = nil
    end
end

local function toggleESP()
    espEnabled = not espEnabled
    local espBtn = cheatButtons["🔍 ESP KAPALI"]
    espBtn.Text = espEnabled and "🔍 ESP AÇIK" or "🔍 ESP KAPALI"
    local col = espEnabled and C.RED or C.GREEN
    tween(espBtn, EASE_FAST, {BackgroundColor3 = col})
    if espEnabled then
        for _, plr in ipairs(Players:GetPlayers()) do createESP(plr) end
    else
        for plr, _ in pairs(espObjects) do removeESP(plr) end
        espObjects = {}
    end
end

local function rejoinGame()
    local placeId = game.PlaceId
    local jobId   = game.JobId
    if jobId and jobId ~= "" then
        TeleportService:TeleportToPlaceInstance(placeId, jobId, localPlayer)
    else
        TeleportService:Teleport(placeId, localPlayer)
    end
end

local flyBtn    = cheatButtons["✈️ FLY KAPALI"]
local noclipBtn = cheatButtons["👻 NOCLIP KAPALI"]
local espBtn    = cheatButtons["🔍 ESP KAPALI"]
local rejoinBtn = cheatButtons["🔄 REJOIN"]

local function toggleFly()
    local character = localPlayer.Character
    local root      = character and character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if flying then
        flying = false
        flyBtn.Text = "✈️ FLY KAPALI"
        tween(flyBtn, EASE_FAST, {BackgroundColor3 = C.GREEN})
        if bv then bv:Destroy(); bv = nil end
        if bg then bg:Destroy(); bg = nil end
        if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
        -- Humanoid'i tekrar aktif et
        local hum = character and character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    else
        flying = true
        flyBtn.Text = "✈️ FLY AÇIK"
        tween(flyBtn, EASE_FAST, {BackgroundColor3 = C.RED})

        -- Humanoid'i dondur (yerçekimi etkisini kes)
        local hum = character and character:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = true end

        -- LinearVelocity (modern API)
        local attachment = Instance.new("Attachment")
        attachment.Name = "MidyeFlyAttach"
        attachment.Parent = root

        bv = Instance.new("LinearVelocity")
        bv.Name = "MidyeFlyLV"
        bv.Attachment0 = attachment
        bv.MaxForce = math.huge
        bv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
        bv.VectorVelocity = Vector3.new(0, 0, 0)
        bv.Parent = root

        -- AlignOrientation (modern API)
        local attachCam = Instance.new("Attachment")
        attachCam.Name = "MidyeFlyAttachCam"
        attachCam.Parent = workspace.CurrentCamera

        bg = Instance.new("AlignOrientation")
        bg.Name = "MidyeFlyAO"
        bg.Attachment0 = attachment
        bg.Attachment1 = attachCam
        bg.MaxTorque = math.huge
        bg.MaxAngularVelocity = math.huge
        bg.Responsiveness = 200
        bg.Parent = root

        flyConnection = RunService.Heartbeat:Connect(function()
            if not flying then return end
            -- Karakter değiştiyse temizle
            if not root or not root.Parent then
                flying = false
                flyBtn.Text = "✈️ FLY KAPALI"
                tween(flyBtn, EASE_FAST, {BackgroundColor3 = C.GREEN})
                if bv then bv:Destroy(); bv = nil end
                if bg then bg:Destroy(); bg = nil end
                if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
                return
            end
            local cam = workspace.CurrentCamera
            local dir = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space)       then dir += Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0, 1, 0) end
            if dir.Magnitude > 0 then dir = dir.Unit end
            bv.VectorVelocity = dir * flySpeed
            -- Kamera yönüne bak
            attachCam.CFrame = cam.CFrame
        end)
    end
end

local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = noclipEnabled and "👻 NOCLIP AÇIK" or "👻 NOCLIP KAPALI"
    local col = noclipEnabled and C.RED or C.GREEN
    tween(noclipBtn, EASE_FAST, {BackgroundColor3 = col})
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

-- ── Oyuncu listesi ─────────────────────────────────────────────────────────
local function refreshPlayers(filter)
    filter = (filter or ""):lower()
    for _, child in ipairs(playerListFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for _, plr in ipairs(Players:GetPlayers()) do
        if filter == "" or plr.Name:lower():find(filter) then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -10, 0, 38)
            btn.BackgroundColor3 = (selectedPlayer == plr) and C.BLUE or C.SURFACE2
            btn.Text = plr.Name..(plr == localPlayer and " (SEN)" or "")
            btn.TextColor3 = C.TEXT
            btn.TextSize = 14
            btn.TextTruncate = Enum.TextTruncate.AtEnd
            btn.Font = Enum.Font.GothamBold
            btn.AutoButtonColor = false
            btn.Parent = playerListFrame
            addCorner(btn, 8)
            local bStroke = addStroke(btn,
                (selectedPlayer==plr) and C.ACCENT or C.BORDER, 1.5, 0.3)

            btn.MouseEnter:Connect(function()
                if selectedPlayer ~= plr then
                    tween(btn, EASE_FAST, {BackgroundColor3 = C.SURFACE2:Lerp(C.ACCENT, 0.12)})
                end
            end)
            btn.MouseLeave:Connect(function()
                if selectedPlayer ~= plr then
                    tween(btn, EASE_FAST, {BackgroundColor3 = C.SURFACE2})
                end
            end)
            btn.MouseButton1Click:Connect(function()
                if selectedButton then
                    tween(selectedButton, EASE_FAST, {BackgroundColor3 = C.SURFACE2})
                    local old = selectedButton:FindFirstChildOfClass("UIStroke")
                    if old then tween(old, EASE_FAST, {Color = C.BORDER}) end
                end
                selectedPlayer = plr
                selectedButton = btn
                tween(btn, EASE_FAST, {BackgroundColor3 = C.BLUE})
                tween(bStroke, EASE_FAST, {Color = C.ACCENT})
                updateSelectedUI()
                applyView()
            end)
        end
    end
    playerListFrame.CanvasSize = UDim2.new(0,0,0, playerListLayout.AbsoluteContentSize.Y + 10)
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function() refreshPlayers(searchBox.Text) end)
clearBtn.MouseButton1Click:Connect(function() searchBox.Text = ""; refreshPlayers("") end)

flyBtn.MouseButton1Click:Connect(toggleFly)
noclipBtn.MouseButton1Click:Connect(toggleNoclip)
espBtn.MouseButton1Click:Connect(toggleESP)
rejoinBtn.MouseButton1Click:Connect(rejoinGame)
viewBtn.MouseButton1Click:Connect(toggleView)
autoTPBtn.MouseButton1Click:Connect(toggleAutoTP)
manualTPBtn.MouseButton1Click:Connect(manualTP)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then toggleESP() end
end)

local flySpeedBox  = controls["⚡ Uçuş Hızı:"]
local walkSpeedBox = controls["🏃 Koşu Hızı:"]
local dataLimitBox = controls["📊 DataLimit (KBPS):"]

flySpeedBox.FocusLost:Connect(function()
    local v = tonumber(flySpeedBox.Text)
    if v then flySpeed = v else flySpeedBox.Text = tostring(flySpeed) end
end)
walkSpeedBox.FocusLost:Connect(function()
    local v = tonumber(walkSpeedBox.Text)
    if v then
        walkSpeed = v
        local hum = localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = walkSpeed end
    else
        walkSpeedBox.Text = tostring(walkSpeed)
    end
end)
dataLimitBox.FocusLost:Connect(function()
    local v = tonumber(dataLimitBox.Text)
    if v then
        pcall(function() game:GetService("NetworkClient"):SetOutgoingKBPSLimit(v) end)
    else
        dataLimitBox.Text = "1"
    end
end)

localPlayer.CharacterAdded:Connect(function(char)
    -- Fly aktifse temizle (karakter yenilendi)
    if flying then
        flying = false
        flyBtn.Text = "✈️ FLY KAPALI"
        tween(flyBtn, EASE_FAST, {BackgroundColor3 = C.GREEN})
        if bv then bv:Destroy(); bv = nil end
        if bg then bg:Destroy(); bg = nil end
        if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
    end
    task.wait(0.5)
    local hum = char:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = walkSpeed end
end)

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

task.spawn(function() task.wait(0.1); refreshPlayers("") end)

-- ── Minimize / Restore ─────────────────────────────────────────────────────
local isMinimized  = false
local normalSize   = mainFrame.Size
local normalPosition = mainFrame.Position

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        normalSize     = mainFrame.Size
        normalPosition = mainFrame.Position
        leftSection.Visible  = false
        rightSection.Visible = false
        resizeHandle.Visible = false
        bottomHandle.Visible = false
        bottomHandle.BackgroundTransparency = 1
        topDiv.BackgroundTransparency = 1
        titleBarFill.Visible = false
        titleDivider.Visible = false
        -- titleBar'ı mainFrame'i tamamen kapla — alt kenar köşeleri düzgün görünsün
        titleBar.Size = UDim2.new(1, 0, 1, 0)
        titleLabel.Visible = false
        titleLabelMin.Visible = true
        mainFrame.ClipsDescendants = true
        tween(mainFrame, tweenInfo, {Size = UDim2.new(0,220,0,40), Position = UDim2.new(normalPosition.X.Scale, normalPosition.X.Offset, normalPosition.Y.Scale, normalPosition.Y.Offset)})
    else
        -- Önce titleBar'ı eski haline döndür
        titleBar.Size = UDim2.new(1, 0, 0, 40)
        tween(mainFrame, tweenInfo, {Size = normalSize, Position = normalPosition})
        task.delay(0.3, function()
            leftSection.Visible  = true
            rightSection.Visible = true
            resizeHandle.Visible = true
            bottomHandle.Visible = true
            bottomHandle.BackgroundTransparency = 0
            topDiv.BackgroundTransparency = 0.7
            titleBarFill.Visible = true
            titleDivider.Visible = true
            titleLabel.Visible = true
            titleLabelMin.Visible = false
        end)
    end
end)

end -- loadMainScript sonu
