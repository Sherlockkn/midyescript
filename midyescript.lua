local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local localPlayer = Players.LocalPlayer
local VALID_KEYS = {
    ["mK7vXpQ2nRjL9wYtBsF4eHcA6dZuG3iN"] = true,
    ["Tz8oWqE5rVbM1kJyPxC0lDfSgUhI4nOa"] = true,
    ["Qr3NsLpK6mXvY9wBtF2eHcA7dZuG4iJo"] = true,
    ["Wy5TzRqE8oVbM2kJxPC1lDfSgUhI6nOa"] = true,
    ["Lp4NsKqR7mXvY0wBtF3eHcA8dZuG5iJo"] = true,
    ["Eb6TzWqE9oVbM3kJxPC2lDfSgUhI7nOa"] = true,
    ["Xv2NsLpK8mRjY1wBtF4eHcA9dZuG6iJo"] = true,
    ["Hn5TzWqE0oVbM4kJxPC3lDfSgUhI8nOa"] = true,
    ["Fq7NsLpK9mXvY2wBtR5eHcA0dZuG1iJo"] = true,
    ["Ck3TzWqE1oVbM5kJxPC4lDfSgUhI9nOa"] = true,
    ["Jm8NsLpK0mXvY3wBtF6eHcA1dZuG2iRo"] = true,
    ["Aw4TzWqE2oVbM6kJxPC5lDfSgUhI0nOa"] = true,
    ["Ys9NsLpK1mXvY4wBtF7eHcA2dZuG3iJo"] = true,
    ["Dv5TzWqE3oVbM7kJxPC6lDfSgUhI1nOa"] = true,
    ["Gu0NsLpK2mXvY5wBtF8eHcA3dZuG4iJo"] = true,
    ["Bi6TzWqE4oVbM8kJxPC7lDfSgUhI2nOa"] = true,
    ["Rn1NsLpK3mXvY6wBtF9eHcA4dZuG5iJo"] = true,
    ["Ot7TzWqE5oVbM9kJxPC8lDfSgUhI3nOa"] = true,
    ["Pk2NsLpK4mXvY7wBtF0eHcA5dZuG6iJo"] = true,
    ["Uc8TzWqE6oVbM0kJxPC9lDfSgUhI4nOa"] = true,
    ["Sf3NsLpK5mXvY8wBtF1eHcA6dZuG7iJo"] = true,
    ["Vh9TzWqE7oVbM1kJxPC0lDfSgUhI5nOa"] = true,
    ["Zq4NsLpK6mXvY9wBtF2eHcA7dZuG8iJo"] = true,
    ["Wl0TzWqE8oVbM2kJxPC1lDfSgUhI6nOa"] = true,
    ["Xe5NsLpK7mXvY0wBtF3eHcA8dZuG9iJo"] = true,
    ["Tm1TzWqE9oVbM3kJxPC2lDfSgUhI7nOa"] = true,
    ["Iq6NsLpK8mXvY1wBtF4eHcA9dZuG0iJo"] = true,
    ["Ao2TzWqE0oVbM4kJxPC3lDfSgUhI8nOa"] = true,
    ["Kd7NsLpK9mXvY2wBtF5eHcA0dZuG1iJo"] = true,
    ["Nj3TzWqE1oVbM5kJxPC4lDfSgUhI9nOa"] = true,
    ["Mg8NsLpK0mXvY3wBtF6eHcA1dZuG2iJo"] = true,
    ["Lc4TzWqE2oVbM6kJxPC5lDfSgUhI0nOa"] = true,
    ["Hy9NsLpK1mXvY4wBtF7eHcA2dZuG3iJo"] = true,
    ["Fw5TzWqE3oVbM7kJxPC6lDfSgUhI1nOa"] = true,
    ["Ev0NsLpK2mXvY5wBtF8eHcA3dZuG4iJo"] = true,
    ["Du6TzWqE4oVbM8kJxPC7lDfSgUhI2nOa"] = true,
    ["Ct1NsLpK3mXvY6wBtF9eHcA4dZuG5iJo"] = true,
    ["Bs7TzWqE5oVbM9kJxPC8lDfSgUhI3nOa"] = true,
    ["Ar2NsLpK4mXvY7wBtF0eHcA5dZuG6iJo"] = true,
    ["Zp8TzWqE6oVbM0kJxPC9lDfSgUhI4nOa"] = true,
    ["Yo3NsLpK5mXvY8wBtF1eHcA6dZuG7iJo"] = true,
    ["Xn9TzWqE7oVbM1kJxPC0lDfSgUhI5nOa"] = true,
    ["Wm4NsLpK6mXvY9wBtF2eHcA7dZuG8iJo"] = true,
    ["Vl0TzWqE8oVbM2kJxPC1lDfSgUhI6nOa"] = true,
    ["Uk5NsLpK7mXvY0wBtF3eHcA8dZuG9iJo"] = true,
    ["Tj1TzWqE9oVbM3kJxPC2lDfSgUhI7nOa"] = true,
    ["Si6NsLpK8mXvY1wBtF4eHcA9dZuG0iJo"] = true,
    ["Rh2TzWqE0oVbM4kJxPC3lDfSgUhI8nOa"] = true,
    ["Qg7NsLpK9mXvY2wBtF5eHcA0dZuG1iJo"] = true,
    ["Pf3TzWqE1oVbM5kJxPC4lDfSgUhI9nOa"] = true,
    ["KogamiEssegi"] = true,
    ["Xk9mPqL2vRnT5wYjBsF7eHcA3dZuG8iN"] = true,
    ["Tz4oWqE1rVbM6kJyPxC8lDfSgUhI2nOa"] = true,
    ["Qr7NsLpK3mXvY0wBtF5eHcA9dZuG1iJo"] = true,
    ["Wy2TzRqE6oVbM8kJxPC4lDfSgUhI3nOa"] = true,
    ["Lp9NsKqR1mXvY7wBtF0eHcA5dZuG2iJo"] = true,
    ["Eb3TzWqE4oVbM9kJxPC6lDfSgUhI8nOa"] = true,
    ["Xv6NsLpK2mRjY4wBtF1eHcA7dZuG3iJo"] = true,
    ["Hn0TzWqE7oVbM3kJxPC9lDfSgUhI5nOa"] = true,
    ["Fq4NsLpK8mXvY6wBtR2eHcA3dZuG7iJo"] = true,
    ["Ck1TzWqE9oVbM0kJxPC5lDfSgUhI4nOa"] = true,
    ["Jm5NsLpK7mXvY8wBtF3eHcA2dZuG9iRo"] = true,
    ["Aw9TzWqE3oVbM1kJxPC7lDfSgUhI6nOa"] = true,
    ["Ys2NsLpK6mXvY9wBtF4eHcA8dZuG0iJo"] = true,
    ["Dv8TzWqE0oVbM4kJxPC2lDfSgUhI7nOa"] = true,
    ["Gu3NsLpK5mXvY1wBtF9eHcA6dZuG4iJo"] = true,
    ["Bi7TzWqE2oVbM5kJxPC0lDfSgUhI9nOa"] = true,
    ["Rn4NsLpK9mXvY3wBtF6eHcA1dZuG8iJo"] = true,
    ["Ot0TzWqE8oVbM6kJxPC3lDfSgUhI2nOa"] = true,
    ["Pk5NsLpK1mXvY4wBtF7eHcA9dZuG3iJo"] = true,
    ["Uc9TzWqE5oVbM7kJxPC8lDfSgUhI1nOa"] = true,
    ["Sf2NsLpK4mXvY0wBtF8eHcA3dZuG6iJo"] = true,
    ["Vh6TzWqE1oVbM8kJxPC7lDfSgUhI4nOa"] = true,
    ["Zq3NsLpK0mXvY5wBtF9eHcA4dZuG7iJo"] = true,
    ["Wl8TzWqE4oVbM9kJxPC2lDfSgUhI3nOa"] = true,
    ["Xe1NsLpK3mXvY7wBtF6eHcA0dZuG5iJo"] = true,
    ["Tm9TzWqE6oVbM2kJxPC4lDfSgUhI8nOa"] = true,
    ["Iq5NsLpK7mXvY3wBtF1eHcA6dZuG9iJo"] = true,
    ["Ao3TzWqE8oVbM5kJxPC0lDfSgUhI7nOa"] = true,
    ["Kd6NsLpK2mXvY8wBtF4eHcA7dZuG0iJo"] = true,
    ["Nj1TzWqE9oVbM3kJxPC5lDfSgUhI2nOa"] = true,
    ["Mg7NsLpK4mXvY6wBtF0eHcA8dZuG3iJo"] = true,
    ["Lc2TzWqE0oVbM7kJxPC9lDfSgUhI5nOa"] = true,
    ["Hy8NsLpK5mXvY2wBtF3eHcA1dZuG6iJo"] = true,
    ["Fw4TzWqE3oVbM8kJxPC7lDfSgUhI0nOa"] = true,
    ["Ev9NsLpK6mXvY4wBtF5eHcA2dZuG1iJo"] = true,
    ["Du3TzWqE7oVbM0kJxPC1lDfSgUhI8nOa"] = true,
    ["Ct8NsLpK1mXvY9wBtF2eHcA6dZuG4iJo"] = true,
    ["Bs5TzWqE4oVbM2kJxPC8lDfSgUhI9nOa"] = true,
    ["Ar0NsLpK8mXvY5wBtF7eHcA3dZuG2iJo"] = true,
    ["Zp6TzWqE2oVbM9kJxPC4lDfSgUhI1nOa"] = true,
    ["Yo1NsLpK3mXvY0wBtF8eHcA7dZuG5iJo"] = true,
    ["Xn7TzWqE5oVbM4kJxPC2lDfSgUhI6nOa"] = true,
    ["Wm3NsLpK9mXvY1wBtF5eHcA0dZuG8iJo"] = true,
    ["Vl8TzWqE0oVbM6kJxPC3lDfSgUhI4nOa"] = true,
    ["Uk2NsLpK4mXvY8wBtF9eHcA5dZuG7iJo"] = true,
    ["Tj6TzWqE3oVbM1kJxPC0lDfSgUhI9nOa"] = true,
    ["Si9NsLpK7mXvY4wBtF2eHcA8dZuG1iJo"] = true,
    ["Rh4TzWqE6oVbM8kJxPC5lDfSgUhI3nOa"] = true,
    ["Qg0NsLpK2mXvY7wBtF3eHcA9dZuG6iJo"] = true,
    ["Pf5TzWqE8oVbM3kJxPC1lDfSgUhI7nOa"] = true,
}
local function tween(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end
local EASE_OUT       = TweenInfo.new(0.45, Enum.EasingStyle.Quint,  Enum.EasingDirection.Out)
local EASE_IN        = TweenInfo.new(0.30, Enum.EasingStyle.Quint,  Enum.EasingDirection.In)
local EASE_FAST      = TweenInfo.new(0.20, Enum.EasingStyle.Quart,  Enum.EasingDirection.Out)
local EASE_SPRING    = TweenInfo.new(0.55, Enum.EasingStyle.Back,   Enum.EasingDirection.Out)
local EASE_ELASTIC   = TweenInfo.new(0.65, Enum.EasingStyle.Elastic,Enum.EasingDirection.Out)
local EASE_SMOOTH    = TweenInfo.new(0.38, Enum.EasingStyle.Sine,   Enum.EasingDirection.InOut)
local C = {
    BG          = Color3.fromRGB( 10,  10,  14),
    SURFACE     = Color3.fromRGB( 18,  18,  24),
    SURFACE2    = Color3.fromRGB( 26,  26,  34),
    BORDER      = Color3.fromRGB( 42,  42,  56),
    BORDER_GLOW = Color3.fromRGB( 88, 101, 242),
    ACCENT      = Color3.fromRGB( 88, 101, 242),
    ACCENT2     = Color3.fromRGB(114, 137, 218),
    GREEN       = Color3.fromRGB( 59, 165,  93),
    GREEN_H     = Color3.fromRGB( 72, 199, 112),
    RED         = Color3.fromRGB(237,  66,  69),
    RED_H       = Color3.fromRGB(255,  85,  88),
    BLUE        = Color3.fromRGB( 88, 101, 242),
    BLUE_H      = Color3.fromRGB(110, 124, 255),
    TEXT        = Color3.fromRGB(220, 221, 228),
    TEXT_MUTED  = Color3.fromRGB(114, 118, 125),
    TEXT_DIM    = Color3.fromRGB( 72,  75,  84),
}
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
local function pulseStroke(stroke, col1, col2, period)
    period = period or 2.8
    task.spawn(function()
        local t = 0
        while stroke and stroke.Parent do
            t = t + task.wait(0.04)
            local alpha = (math.sin(t * (math.pi * 2 / period)) + 1) / 2
            local s = alpha * alpha * (3 - 2 * alpha)
            stroke.Color     = col1:Lerp(col2, s)
            stroke.Thickness = 1.5 + s * 1.5
        end
    end)
end
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
local btnCurrentColor = {}
local btnBaseSize     = {}
local btnBasePos      = {}
local btnGlowThread   = {}
local btnStrokeRef    = {}
local function startGlowPulse(btn, col)
    if btnGlowThread[btn] then
        task.cancel(btnGlowThread[btn])
        btnGlowThread[btn] = nil
    end
    local stroke = btnStrokeRef[btn]
    if not stroke then return end
    local bright = col:Lerp(Color3.fromRGB(255,255,255), 0.45)
    btnGlowThread[btn] = task.spawn(function()
        local t = 0
        while btn and btn.Parent and btnGlowThread[btn] do
            t = t + task.wait(0.04)
            local raw   = (math.sin(t * math.pi * 0.75) + 1) / 2
            local alpha = raw * raw * (3 - 2 * raw)
            stroke.Color        = col:Lerp(bright, alpha * 0.8)
            stroke.Thickness    = 1.5 + alpha * 1.8
            stroke.Transparency = 0.05 - alpha * 0.05
        end
    end)
end
local function stopGlowPulse(btn)
    if btnGlowThread[btn] then
        task.cancel(btnGlowThread[btn])
        btnGlowThread[btn] = nil
    end
    local stroke = btnStrokeRef[btn]
    if stroke then
        tween(stroke, EASE_FAST, {Color = C.BORDER, Thickness = 1, Transparency = 0.3})
    end
end
local function hookToggleHover(btn, dur)
    dur = dur or 0.22
    btnCurrentColor[btn] = btn.BackgroundColor3
    if not btnBaseSize[btn] then
        btnBaseSize[btn] = btn.Size
        btnBasePos[btn]  = btn.Position
    end
    btn.MouseEnter:Connect(function()
        local base   = btnCurrentColor[btn] or btn.BackgroundColor3
        local stroke = btnStrokeRef[btn]
        local bs     = btnBaseSize[btn]
        local bp     = btnBasePos[btn]
        tween(btn, TweenInfo.new(dur, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = base:Lerp(Color3.fromRGB(255,255,255), 0.10),
            Size     = bs + UDim2.new(0, 4, 0, 2),
            Position = bp - UDim2.new(0, 2, 0, 1),
        })
        if stroke and not btnGlowThread[btn] then
            tween(stroke, TweenInfo.new(dur, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Color        = base:Lerp(Color3.fromRGB(255,255,255), 0.55),
                Thickness    = 2.2,
                Transparency = 0,
            })
        end
    end)
    btn.MouseLeave:Connect(function()
        local base   = btnCurrentColor[btn] or btn.BackgroundColor3
        local stroke = btnStrokeRef[btn]
        local bs     = btnBaseSize[btn]
        local bp     = btnBasePos[btn]
        tween(btn, TweenInfo.new(dur, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = base,
            Size     = bs,
            Position = bp,
        })
        if stroke and not btnGlowThread[btn] then
            tween(stroke, TweenInfo.new(dur, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Color        = C.BORDER,
                Thickness    = 1,
                Transparency = 0.3,
            })
        end
    end)
end
local function setToggleColor(btn, col)
    btnCurrentColor[btn] = col
    local stroke  = btnStrokeRef[btn]
    local baseSize = btnBaseSize[btn] or btn.Size
    local basePos  = btnBasePos[btn]  or btn.Position
    local flashCol = col:Lerp(Color3.fromRGB(255,255,255), 0.5)
    tween(btn, TweenInfo.new(0.10, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        BackgroundColor3 = flashCol,
    })
    task.delay(0.10, function()
        if btn and btn.Parent then
            tween(btn, TweenInfo.new(0.32, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                BackgroundColor3 = col,
            })
        end
    end)
    if stroke then
        tween(stroke, TweenInfo.new(0.10, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Color        = Color3.fromRGB(255,255,255),
            Thickness    = 3.5,
            Transparency = 0,
        })
        task.delay(0.10, function()
            if btn and btn.Parent and stroke and stroke.Parent then
                tween(stroke, TweenInfo.new(0.38, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Color        = col:Lerp(Color3.fromRGB(255,255,255), 0.35),
                    Thickness    = 2.5,
                    Transparency = 0,
                })
            end
        end)
    end
    tween(btn, TweenInfo.new(0.13, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size     = baseSize + UDim2.new(0, 10, 0, 6),
        Position = basePos  - UDim2.new(0, 5, 0, 3),
    })
    task.delay(0.13, function()
        if btn and btn.Parent then
            tween(btn, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size     = baseSize,
                Position = basePos,
            })
        end
    end)
    if col == C.RED then
        task.delay(0.18, function()
            if btn and btn.Parent then startGlowPulse(btn, col) end
        end)
    else
        stopGlowPulse(btn)
        task.delay(0.45, function()
            if btn and btn.Parent and stroke and stroke.Parent then
                tween(stroke, EASE_FAST, {Color = C.BORDER, Thickness = 1, Transparency = 0.3})
            end
        end)
    end
end
local function hookPress(btn)
    btn.MouseButton1Down:Connect(function()
        local baseSize = btnBaseSize[btn] or btn.Size
        local basePos  = btnBasePos[btn]  or btn.Position
        tween(btn, TweenInfo.new(0.08, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size     = baseSize - UDim2.new(0, 6, 0, 4),
            Position = basePos  + UDim2.new(0, 3, 0, 2),
        })
    end)
    btn.MouseButton1Up:Connect(function()
        local baseSize = btnBaseSize[btn] or btn.Size
        local basePos  = btnBasePos[btn]  or btn.Position
        tween(btn, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size     = baseSize,
            Position = basePos,
        })
    end)
end
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "MidyeKeySystem"
keyGui.ResetOnSpawn = false
keyGui.Parent = game:GetService("CoreGui")
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 420, 0, 220)
keyFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
keyFrame.BackgroundColor3 = C.SURFACE
keyFrame.BackgroundTransparency = 0
keyFrame.BorderSizePixel = 0
keyFrame.ZIndex = 2
keyFrame.Parent = keyGui
addCorner(keyFrame, 18)
local kfStroke = addStroke(keyFrame, C.BORDER, 3)
local WAVE_COLORS = {
    Color3.fromRGB( 99, 102, 241),  -- indigo
    Color3.fromRGB(124,  77, 255),  -- violet
    Color3.fromRGB(168,  85, 247),  -- purple
    Color3.fromRGB(220,  80, 220),  -- pink-violet
    Color3.fromRGB(255, 100, 150),  -- pink
    Color3.fromRGB(255, 150, 100),  -- orange
    Color3.fromRGB( 80, 220, 200),  -- teal
    Color3.fromRGB( 56, 145, 255),  -- sky blue
    Color3.fromRGB( 80, 180, 255),  -- blue
    Color3.fromRGB( 99, 102, 241),  -- indigo (loop)
}
local WAVE_SPEED = 0.4  -- tüm paneller aynı hızda döner
local function waveStroke(stroke, phaseOffset, baseThick, thickAmp)
    task.spawn(function()
        local t = 0
        while stroke and stroke.Parent do
            t = t + task.wait(0.025)
            local pos   = ((t * WAVE_SPEED) + phaseOffset) % (#WAVE_COLORS - 1)
            local idx   = math.floor(pos) + 1
            local nxt   = math.min(idx + 1, #WAVE_COLORS)
            local raw   = pos - math.floor(pos)
            local alpha = raw * raw * (3 - 2 * raw)
            if stroke.Parent then
                stroke.Color     = WAVE_COLORS[idx]:Lerp(WAVE_COLORS[nxt], alpha)
                stroke.Thickness = baseThick + math.sin(t * 1.8 + phaseOffset) * thickAmp
            end
        end
    end)
end
waveStroke(kfStroke, 0, 2.5, 0.5)
local keyAccentBar = Instance.new("Frame")
keyAccentBar.Size = UDim2.new(1, -40, 0, 2)
keyAccentBar.Position = UDim2.new(0, 20, 0, 0)
keyAccentBar.BackgroundColor3 = C.ACCENT
keyAccentBar.BorderSizePixel = 0
keyAccentBar.ZIndex = 3
keyAccentBar.Parent = keyFrame
addCorner(keyAccentBar, 2)
addGradient(keyAccentBar, C.ACCENT, C.ACCENT2, 90)
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
task.spawn(function()
    local t = 0
    while keyTitle and keyTitle.Parent do
        t = t + task.wait(0.04)
        for i, lbl in ipairs(keyTitleCharLabels) do
            if not lbl.Parent then break end
            local offset = (i / #keyTitleCharLabels) + t * 0.55
            local raw    = (math.sin(offset * math.pi * 2) + 1) / 2
            local alpha  = raw * raw * (3 - 2 * raw)
            lbl.TextColor3 = Color3.fromRGB(99, 102, 241):Lerp(
                             Color3.fromRGB(56, 145, 255), alpha)
        end
    end
end)
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
    tween(kbStroke, EASE_FAST, {Color = C.ACCENT, Thickness = 2.2})
    tween(keyBox, EASE_FAST, {BackgroundColor3 = C.SURFACE2:Lerp(C.ACCENT, 0.07)})
end)
keyBox.FocusLost:Connect(function()
    tween(kbStroke, EASE_FAST, {Color = C.BORDER, Thickness = 1.5})
    tween(keyBox, EASE_FAST, {BackgroundColor3 = C.SURFACE2})
end)
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
keyFrame.Position = UDim2.new(0.5, -210, 0.6, -110)
keyFrame.BackgroundTransparency = 1
keyFrame.Size = UDim2.new(0, 380, 0, 200)
keyDesc.TextTransparency = 1
keyDesc.Position = UDim2.new(0, 10, 0, 72)
for _, lbl in ipairs(keyTitleCharLabels) do
    lbl.TextTransparency = 1
end
task.spawn(function()
    task.wait(0.06)
    tween(keyFrame, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position            = UDim2.new(0.5, -210, 0.5, -110),
        BackgroundTransparency = 0,
        Size                = UDim2.new(0, 420, 0, 220),
    })
    task.wait(0.18)
    for i, lbl in ipairs(keyTitleCharLabels) do
        task.delay((i - 1) * 0.045, function()
            if not lbl.Parent then return end
            lbl.Position = UDim2.new(0, 0, 0.3, 0)
            tween(lbl, TweenInfo.new(0.42, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                TextTransparency = 0,
                Position         = UDim2.new(0, 0, 0, 0),
            })
        end)
    end
    task.wait(0.35)
    tween(keyDesc, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        TextTransparency = 0,
        Position         = UDim2.new(0, 10, 0, 55),
    })
    task.wait(0.1)
    local origBoxPos = keyBox.Position
    local origBtnPos = keyEnterBtn.Position
    keyBox.Position = origBoxPos + UDim2.new(0, 0, 0, 18)
    keyBox.BackgroundTransparency = 1
    keyEnterBtn.Position = origBtnPos + UDim2.new(0, 0, 0, 18)
    keyEnterBtn.BackgroundTransparency = 1
    tween(keyBox, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = origBoxPos, BackgroundTransparency = 0,
    })
    task.wait(0.06)
    tween(keyEnterBtn, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = origBtnPos, BackgroundTransparency = 0,
    })
end)
local BLACKLIST_URL = "https://raw.githubusercontent.com/Sherlockkn/midyescript/main/blacklist.txt"
local blacklistedKeys = {}
local blacklistLoaded = false
task.spawn(function()
    local ok, result = pcall(function()
        return game:HttpGet(BLACKLIST_URL, true)
    end)
    if not ok or not result then
        ok, result = pcall(function()
            return game:GetService("HttpService"):GetAsync(BLACKLIST_URL, true)
        end)
    end
    if ok and result then
        for line in result:gmatch("[^\r\n]+") do
            local trimmed = line:match("^%s*(.-)%s*$")
            if trimmed ~= "" and trimmed:sub(1, 1) ~= "#" then
                blacklistedKeys[trimmed] = true
            end
        end
    end
    blacklistLoaded = true
end)
local failCount  = 0
local inCooldown = false
local function tryKey()
    if inCooldown then return end
    local entered = keyBox.Text
    if not blacklistLoaded then
        inCooldown = true
        keyError.Text = "⏳ Kontrol ediliyor..."
        keyError.Visible = true
        keyEnterBtn.Visible = false
        local waited = 0
        while not blacklistLoaded and waited < 5 do
            task.wait(0.2)
            waited = waited + 0.2
        end
        keyError.Visible = false
        keyEnterBtn.Visible = true
        inCooldown = false
    end
    if blacklistedKeys[entered] then
        keyError.Text = "🚫 Bu key devre dışı bırakıldı!"
        keyError.Visible = true
        keyEnterBtn.Visible = false
        keyBox.TextEditable = false
        tween(kbStroke, EASE_FAST, {Color = C.RED})
        tween(keyFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(40, 10, 10),
        })
        task.delay(2.5, function()
            tween(keyFrame, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                BackgroundTransparency = 1,
                Position = UDim2.new(0.5, -210, 0.65, -110),
                Size     = UDim2.new(0, 400, 0, 200),
            })
            task.wait(0.5)
            keyGui:Destroy()
        end)
        return
    end
    if VALID_KEYS[entered] then
        tween(kbStroke, EASE_FAST, {Color = C.GREEN, Thickness = 2.5})
        tween(keyFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 432, 0, 228),
        })
        task.wait(0.15)
        for i, lbl in ipairs(keyTitleCharLabels) do
            task.delay((i - 1) * 0.03, function()
                if lbl and lbl.Parent then
                    tween(lbl, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
                        TextTransparency = 1,
                        Position         = UDim2.new(0, 0, -0.4, 0),
                    })
                end
            end)
        end
        task.wait(0.12)
        tween(keyFrame, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, -210, 0.35, -110),
            Size     = UDim2.new(0, 400, 0, 200),
        })
        task.wait(0.48)
        keyGui:Destroy()
        loadMainScript()
    else
        failCount = failCount + 1
        keyBox.Text = ""
        tween(kbStroke, EASE_FAST, {Color = C.RED})
        local origPos = keyBox.Position
        task.spawn(function()
            local shakes = {
                {dx=10, dy=-3}, {dx=-10, dy=2}, {dx=8, dy=-2},
                {dx=-7, dy=3},  {dx=5,  dy=-1}, {dx=-4, dy=1}, {dx=0, dy=0}
            }
            for _, s in ipairs(shakes) do
                tween(keyBox, TweenInfo.new(0.045, Enum.EasingStyle.Linear),
                    {Position = origPos + UDim2.new(0, s.dx, 0, s.dy)})
                task.wait(0.045)
            end
        end)
        if failCount >= 3 then
            failCount = 0
            inCooldown = true
            keyEnterBtn.Visible = false
            keyBox.TextEditable = false
            keyError.Visible = true
            local remaining = 15
            keyError.Text = "⏳ " .. remaining .. "s bekle"
            task.spawn(function()
                while remaining > 0 do
                    task.wait(1)
                    remaining = remaining - 1
                    keyError.Text = remaining > 0 and ("⏳ " .. remaining .. "s bekle") or ""
                end
                inCooldown = false
                keyEnterBtn.Visible = true
                keyBox.TextEditable = true
                keyError.Visible = false
                tween(kbStroke, EASE_FAST, {Color = C.BORDER})
            end)
        else
            keyError.Text = "❌ Geçersiz key!"
            keyError.Visible = true
            keyEnterBtn.Visible = false
            task.delay(2, function()
                if inCooldown then return end
                keyError.Visible = false
                keyEnterBtn.Visible = true
                tween(kbStroke, EASE_FAST, {Color = C.BORDER})
            end)
        end
    end
end
keyEnterBtn.MouseButton1Click:Connect(tryKey)
keyBox.FocusLost:Connect(function(enter) if enter then tryKey() end end)
function loadMainScript()
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MidyeNeighboursPanel"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")
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
local mainGlassOverlay = Instance.new("Frame")
mainGlassOverlay.Size = UDim2.new(1, 0, 1, 0)
mainGlassOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainGlassOverlay.BackgroundTransparency = 0.98
mainGlassOverlay.BorderSizePixel = 0
mainGlassOverlay.ZIndex = 0
mainGlassOverlay.Parent = mainFrame
addCorner(mainGlassOverlay, 18)
local mfStroke = addStroke(mainFrame, C.BORDER, 2)
waveStroke(mfStroke, 2.5, 2, 0.6)
local mainParticles = Instance.new("Frame")
mainParticles.Size = UDim2.new(1, 0, 1, 0)
mainParticles.BackgroundTransparency = 1
mainParticles.ZIndex = 0
mainParticles.ClipsDescendants = true
mainParticles.Parent = mainFrame
for i = 1, 12 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 6), 0, math.random(2, 6))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = C.ACCENT
    particle.BackgroundTransparency = 0.75
    particle.BorderSizePixel = 0
    particle.ZIndex = 0
    particle.Parent = mainParticles
    addCorner(particle, math.random(1, 3))
    task.spawn(function()
        local startPos = particle.Position
        local t = math.random() * 10
        while particle and particle.Parent do
            t = t + task.wait(0.05)
            local offsetX = math.sin(t * 0.4 + i) * 0.025
            local offsetY = math.sin(t * 0.25 + i * 0.5) * 0.04
            particle.Position = UDim2.new(
                startPos.X.Scale + offsetX, 0,
                startPos.Y.Scale + offsetY, 0
            )
            local raw = (math.sin(t * 1.2 + i) + 1) / 2
            local alpha = raw * raw * (3 - 2 * raw)
            particle.BackgroundTransparency = 0.7 + alpha * 0.25
        end
    end)
end
mainFrame.BackgroundTransparency = 1
mainFrame.Size = UDim2.new(0, 540, 0, 600)
mainFrame.Position = UDim2.new(0.5,-270,0.5,-300)
task.spawn(function()
    task.wait(0.04)
    tween(mainFrame, TweenInfo.new(0.58, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0,
        Size     = UDim2.new(0, 580, 0, 640),
        Position = UDim2.new(0.5,-290,0.5,-320),
    })
    tween(mfStroke, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Transparency = 0,
    })
end)
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
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = C.SURFACE
titleBar.BorderSizePixel = 0
titleBar.ZIndex = 2
titleBar.Parent = mainFrame
addCorner(titleBar, 18)
addGradient(titleBar,
    Color3.fromRGB(22, 22, 30),
    Color3.fromRGB(18, 18, 24), 90)
local titleBarFill = Instance.new("Frame")
titleBarFill.Size = UDim2.new(1,0,0,15)
titleBarFill.Position = UDim2.new(0,0,1,-15)
titleBarFill.BackgroundColor3 = C.SURFACE
titleBarFill.BorderSizePixel = 0
titleBarFill.ZIndex = 2
titleBarFill.Parent = titleBar
addGradient(titleBarFill,
    Color3.fromRGB(20, 20, 28),
    Color3.fromRGB(18, 18, 24), 90)
local titleDivider = Instance.new("Frame")
titleDivider.Size = UDim2.new(1,-40,0,2)
titleDivider.Position = UDim2.new(0,20,1,-2)
titleDivider.BackgroundColor3 = C.ACCENT
titleDivider.BackgroundTransparency = 0.4
titleDivider.BorderSizePixel = 0
titleDivider.ZIndex = 3
titleDivider.Parent = titleBar
addCorner(titleDivider, 1)
addGradient(titleDivider,
    Color3.fromRGB(88, 101, 242),
    Color3.fromRGB(114, 137, 218), 90)
task.spawn(function()
    local t = 0
    while titleDivider and titleDivider.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        titleDivider.BackgroundTransparency = 0.3 + alpha * 0.3
    end
end)
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
task.spawn(function()
    local t = 0
    while titleLabel and titleLabel.Parent do
        t = t + task.wait(0.04)
        for i, lbl in ipairs(titleCharLabels) do
            if not lbl.Parent then break end
            local offset = (i / #titleCharLabels) + t * 0.55
            local raw    = (math.sin(offset * math.pi * 2) + 1) / 2
            local alpha  = raw * raw * (3 - 2 * raw)  -- smoothstep
            lbl.TextColor3 = Color3.fromRGB( 99, 102, 241):Lerp(
                             Color3.fromRGB( 56, 145, 255), alpha)
        end
    end
end)
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
task.spawn(function()
    local t = 0
    while titleLabelMin and titleLabelMin.Parent do
        t = t + task.wait(0.04)
        for i, lbl in ipairs(minCharLabels) do
            if not lbl.Parent then break end
            local offset = (i / #minCharLabels) + t * 0.55
            local raw    = (math.sin(offset * math.pi * 2) + 1) / 2
            local alpha  = raw * raw * (3 - 2 * raw)
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
    tween(mainFrame, TweenInfo.new(0.10, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, origSize.X.Offset + 12, 0, origSize.Y.Offset + 8),
        Position = UDim2.new(origPos.X.Scale, origPos.X.Offset - 6, origPos.Y.Scale, origPos.Y.Offset - 4),
    })
    tween(mfStroke, TweenInfo.new(0.10, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
        Transparency = 0, Thickness = 3,
    })
    task.wait(0.10)
    tween(mainFrame, TweenInfo.new(0.38, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(
            origPos.X.Scale, origPos.X.Offset + origSize.X.Offset / 2,
            origPos.Y.Scale, origPos.Y.Offset + origSize.Y.Offset / 2
        ),
        BackgroundTransparency = 1,
    })
    tween(mfStroke, TweenInfo.new(0.28, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        Transparency = 1,
    })
    task.wait(0.40)
    screenGui:Destroy()
end)
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
local bottomHandle = Instance.new("Frame")
bottomHandle.Size = UDim2.new(1, -32, 0, 32)
bottomHandle.Position = UDim2.new(0, 0, 1, -32)
bottomHandle.BackgroundColor3 = C.SURFACE
bottomHandle.BackgroundTransparency = 0
bottomHandle.BorderSizePixel = 0
bottomHandle.ZIndex = 8
bottomHandle.Parent = mainFrame
addCorner(bottomHandle, 18)
addGradient(bottomHandle,
    Color3.fromRGB(22, 22, 30),
    Color3.fromRGB(18, 18, 24), 90)
local bottomFill = Instance.new("Frame")
bottomFill.Size = UDim2.new(1,0,0.5,0)
bottomFill.BackgroundColor3 = C.SURFACE
bottomFill.BorderSizePixel = 0
bottomFill.ZIndex = 8
bottomFill.Parent = bottomHandle
addGradient(bottomFill,
    Color3.fromRGB(20, 20, 28),
    Color3.fromRGB(18, 18, 24), 90)
local topDiv = Instance.new("Frame")
topDiv.Size = UDim2.new(1,0,0,2)
topDiv.BackgroundColor3 = C.ACCENT
topDiv.BackgroundTransparency = 0.4
topDiv.BorderSizePixel = 0
topDiv.ZIndex = 9
topDiv.Parent = bottomHandle
addCorner(topDiv, 1)
addGradient(topDiv,
    Color3.fromRGB(88, 101, 242),
    Color3.fromRGB(114, 137, 218), 90)
task.spawn(function()
    local t = 0
    while topDiv and topDiv.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        topDiv.BackgroundTransparency = 0.3 + alpha * 0.3
    end
end)
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
task.spawn(function()
    local t = 0
    while discordLabel and discordLabel.Parent do
        t = t + task.wait(0.05)
        local raw = (math.sin(t * 1.2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        discordLabel.TextColor3 = C.ACCENT2:Lerp(
            Color3.fromRGB(140, 160, 255), alpha * 0.4)
    end
end)
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
task.spawn(function()
    local t = 0
    while gunsLabel and gunsLabel.Parent do
        t = t + task.wait(0.05)
        local raw = (math.sin(t * 1.2 + 1) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        gunsLabel.TextColor3 = C.GREEN:Lerp(
            Color3.fromRGB(80, 220, 120), alpha * 0.4)
    end
end)
local websiteLabel = Instance.new("TextButton")
websiteLabel.Size = UDim2.new(0, 0, 1, 0)
websiteLabel.AutomaticSize = Enum.AutomaticSize.X
websiteLabel.BackgroundTransparency = 1
websiteLabel.Text = "🌐 midyescript"
websiteLabel.TextColor3 = Color3.fromRGB(80, 180, 255)
websiteLabel.TextTransparency = 0.1
websiteLabel.TextSize = 13
websiteLabel.TextTruncate = Enum.TextTruncate.AtEnd
websiteLabel.Font = Enum.Font.Gotham
websiteLabel.AutoButtonColor = false
websiteLabel.ZIndex = 16
task.spawn(function()
    local t = 0
    while websiteLabel and websiteLabel.Parent do
        t = t + task.wait(0.05)
        local raw = (math.sin(t * 1.2 + 2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        websiteLabel.TextColor3 = Color3.fromRGB(80, 180, 255):Lerp(
            Color3.fromRGB(140, 210, 255), alpha * 0.4)
    end
end)
local toastGui = Instance.new("ScreenGui")
toastGui.Name = "MidyeToast"
toastGui.ResetOnSpawn = false
toastGui.Parent = game:GetService("CoreGui")
local toastFrame = Instance.new("Frame")
toastFrame.Size = UDim2.new(0, 380, 0, 120)
toastFrame.AnchorPoint = Vector2.new(0.5, 0.5)
toastFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
toastFrame.BackgroundColor3 = C.SURFACE
toastFrame.BackgroundTransparency = 1
toastFrame.BorderSizePixel = 0
toastFrame.ZIndex = 999
toastFrame.Visible = false
toastFrame.ClipsDescendants = true
toastFrame.Parent = toastGui
addCorner(toastFrame, 18)
local toastGlass = Instance.new("Frame")
toastGlass.Size = UDim2.new(1, 0, 1, 0)
toastGlass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toastGlass.BackgroundTransparency = 0.97
toastGlass.BorderSizePixel = 0
toastGlass.ZIndex = 999
toastGlass.Parent = toastFrame
addCorner(toastGlass, 18)
local toastStroke = addStroke(toastFrame, C.BORDER, 2, 0)
waveStroke(toastStroke, 5.0, 2, 0.8)
local toastParticles = Instance.new("Frame")
toastParticles.Size = UDim2.new(1, 0, 1, 0)
toastParticles.BackgroundTransparency = 1
toastParticles.ZIndex = 998
toastParticles.ClipsDescendants = true
toastParticles.Parent = toastFrame
for i = 1, 8 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = C.ACCENT
    particle.BackgroundTransparency = 0.75
    particle.BorderSizePixel = 0
    particle.ZIndex = 998
    particle.Parent = toastParticles
    addCorner(particle, math.random(2, 3))
    task.spawn(function()
        local startPos = particle.Position
        local t = math.random() * 10
        while particle and particle.Parent do
            t = t + task.wait(0.05)
            local offsetX = math.sin(t * 0.5 + i) * 0.04
            local offsetY = math.sin(t * 0.3 + i * 0.5) * 0.06
            particle.Position = UDim2.new(
                startPos.X.Scale + offsetX, 0,
                startPos.Y.Scale + offsetY, 0
            )
            local raw = (math.sin(t * 1.5 + i) + 1) / 2
            local alpha = raw * raw * (3 - 2 * raw)
            particle.BackgroundTransparency = 0.7 + alpha * 0.25
        end
    end)
end
local toastIcon = Instance.new("TextLabel")
toastIcon.Size = UDim2.new(0, 50, 0, 50)
toastIcon.Position = UDim2.new(0, 20, 0.5, -25)
toastIcon.BackgroundColor3 = C.SURFACE2
toastIcon.BackgroundTransparency = 0
toastIcon.Text = "📋"
toastIcon.TextSize = 28
toastIcon.Font = Enum.Font.Legacy
toastIcon.TextTransparency = 1
toastIcon.ZIndex = 1001
toastIcon.Parent = toastFrame
addCorner(toastIcon, 14)
local iconStroke = addStroke(toastIcon, C.BORDER, 1.5, 0.3)
addGradient(toastIcon,
    Color3.fromRGB(26, 26, 34),
    Color3.fromRGB(20, 20, 28), 135)
task.spawn(function()
    local t = 0
    while iconStroke and iconStroke.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        iconStroke.Color = C.BORDER:Lerp(C.ACCENT, alpha * 0.5)
        iconStroke.Thickness = 1.5 + alpha * 1
    end
end)
local toastTitle = Instance.new("TextLabel")
toastTitle.Size = UDim2.new(1, -90, 0, 32)
toastTitle.Position = UDim2.new(0, 80, 0, 20)
toastTitle.BackgroundTransparency = 1
toastTitle.Text = ""
toastTitle.TextColor3 = C.TEXT
toastTitle.TextTransparency = 1
toastTitle.TextSize = 22
toastTitle.TextTruncate = Enum.TextTruncate.AtEnd
toastTitle.Font = Enum.Font.GothamBold
toastTitle.TextXAlignment = Enum.TextXAlignment.Left
toastTitle.ZIndex = 1001
toastTitle.Parent = toastFrame
task.spawn(function()
    local t = 0
    while toastTitle and toastTitle.Parent do
        t = t + task.wait(0.05)
        local raw = (math.sin(t * 1.5) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        toastTitle.TextColor3 = C.TEXT:Lerp(
            Color3.fromRGB(255, 255, 255), alpha * 0.2)
    end
end)
local toastLabel = Instance.new("TextLabel")
toastLabel.Size = UDim2.new(1, -90, 0, 22)
toastLabel.Position = UDim2.new(0, 80, 0, 54)
toastLabel.BackgroundTransparency = 1
toastLabel.Text = ""
toastLabel.TextColor3 = C.TEXT_MUTED
toastLabel.TextTransparency = 1
toastLabel.TextSize = 15
toastLabel.TextTruncate = Enum.TextTruncate.AtEnd
toastLabel.Font = Enum.Font.Gotham
toastLabel.TextXAlignment = Enum.TextXAlignment.Left
toastLabel.ZIndex = 1001
toastLabel.Parent = toastFrame
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(1, -40, 0, 4)
progressBg.Position = UDim2.new(0, 20, 1, -14)
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
local progressStroke = addStroke(progressBar, C.ACCENT, 1, 0.5)
task.spawn(function()
    local t = 0
    while progressStroke and progressStroke.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 2.5) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        progressStroke.Color = C.ACCENT:Lerp(Color3.fromRGB(255, 255, 255), alpha * 0.6)
    end
end)
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
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    toastFrame.Size = UDim2.new(0, 340, 0, 100)
    toastFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    toastFrame.BackgroundTransparency = 1
    toastFrame.Rotation = 0
    toastTitle.TextTransparency = 1
    toastLabel.TextTransparency = 1
    toastIcon.TextTransparency  = 1
    toastFrame.Visible = true
    tween(toastFrame, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 380, 0, 120),
        BackgroundTransparency = 0,
    })
    task.delay(0.15, function()
        if toastActive then
            toastIcon.Size = UDim2.new(0, 45, 0, 45)
            toastIcon.Position = UDim2.new(0, 20, 0.5, -22.5)
            tween(toastIcon, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 50, 0, 50),
                Position = UDim2.new(0, 20, 0.5, -25),
                TextTransparency = 0
            })
        end
    end)
    task.delay(0.25, function()
        if toastActive then
            tween(toastTitle, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0})
        end
    end)
    task.delay(0.32, function()
        if toastActive then
            tween(toastLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0})
        end
    end)
    progressTween = TweenService:Create(progressBar, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 1, 0)})
    progressTween:Play()
    toastThread = task.delay(3, function()
        if not toastActive then return end
        tween(toastFrame, TweenInfo.new(0.38, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            Rotation = 5
        })
        tween(toastTitle, EASE_IN, {TextTransparency = 1})
        tween(toastLabel, EASE_IN, {TextTransparency = 1})
        tween(toastIcon,  EASE_IN, {TextTransparency = 1})
        task.delay(0.40, function()
            toastFrame.Visible = false
            toastActive  = false
            toastThread  = nil
            progressTween= nil
            toastFrame.Rotation = 0
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
websiteLabel.MouseButton1Click:Connect(function()
    pcall(function() setclipboard("https://midyescript.netlify.app/") end)
    showToast("Website", "Link panoya kopyalandı", "🌐", Color3.fromRGB(80, 180, 255))
end)
websiteLabel.MouseEnter:Connect(function() tween(websiteLabel,EASE_FAST,{TextTransparency=0}) end)
websiteLabel.MouseLeave:Connect(function() tween(websiteLabel,EASE_FAST,{TextTransparency=0.1}) end)
local duyurularBtn = Instance.new("TextButton")
duyurularBtn.Size = UDim2.new(0, 0, 1, 0)
duyurularBtn.AutomaticSize = Enum.AutomaticSize.X
duyurularBtn.BackgroundTransparency = 1
duyurularBtn.Text = "⚡ hakkında"
duyurularBtn.TextColor3 = Color3.fromRGB(255, 200, 60)
duyurularBtn.TextTransparency = 0.1
duyurularBtn.TextSize = 13
duyurularBtn.TextTruncate = Enum.TextTruncate.AtEnd
duyurularBtn.Font = Enum.Font.GothamBold
duyurularBtn.AutoButtonColor = false
duyurularBtn.ZIndex = 16
duyurularBtn.Parent = infoBar
websiteLabel.Parent = infoBar
gunsLabel.Parent    = infoBar
discordLabel.Parent = infoBar
task.spawn(function()
    local t = 0
    while duyurularBtn and duyurularBtn.Parent do
        t = t + task.wait(0.05)
        local raw = (math.sin(t * 1.2 + 2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        duyurularBtn.TextColor3 = Color3.fromRGB(255, 200, 60):Lerp(
            Color3.fromRGB(255, 230, 120), alpha * 0.4)
    end
end)
duyurularBtn.MouseEnter:Connect(function() tween(duyurularBtn, EASE_FAST, {TextTransparency = 0}) end)
duyurularBtn.MouseLeave:Connect(function() tween(duyurularBtn, EASE_FAST, {TextTransparency = 0.1}) end)
local duyuruGui = Instance.new("ScreenGui")
duyuruGui.Name = "MidyeDuyurular"
duyuruGui.ResetOnSpawn = false
duyuruGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
duyuruGui.Parent = game:GetService("CoreGui")
local duyuruBlur = Instance.new("Frame")
duyuruBlur.Size = UDim2.new(1, 0, 1, 0)
duyuruBlur.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
duyuruBlur.BackgroundTransparency = 1
duyuruBlur.BorderSizePixel = 0
duyuruBlur.ZIndex = 199
duyuruBlur.Visible = false
duyuruBlur.Parent = duyuruGui
addGradient(duyuruBlur,
    Color3.fromRGB(15, 15, 25),
    Color3.fromRGB(25, 20, 35), 135)
local particleContainer = Instance.new("Frame")
particleContainer.Size = UDim2.new(1, 0, 1, 0)
particleContainer.BackgroundTransparency = 1
particleContainer.ZIndex = 198
particleContainer.Visible = false
particleContainer.ClipsDescendants = true
particleContainer.Parent = duyuruFrame
for i = 1, 15 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(3, 8), 0, math.random(3, 8))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
    particle.BackgroundTransparency = 0.7
    particle.BorderSizePixel = 0
    particle.ZIndex = 198
    particle.Parent = particleContainer
    addCorner(particle, math.random(2, 4))
    task.spawn(function()
        local startPos = particle.Position
        local t = math.random() * 10
        while particle and particle.Parent do
            t = t + task.wait(0.05)
            local offsetX = math.sin(t * 0.5 + i) * 0.03
            local offsetY = math.sin(t * 0.3 + i * 0.5) * 0.05
            particle.Position = UDim2.new(
                startPos.X.Scale + offsetX, 0,
                startPos.Y.Scale + offsetY, 0
            )
            local raw = (math.sin(t * 1.5 + i) + 1) / 2
            local alpha = raw * raw * (3 - 2 * raw)
            particle.BackgroundTransparency = 0.6 + alpha * 0.3
        end
    end)
end
local duyuruFrame = Instance.new("Frame")
duyuruFrame.Size = UDim2.new(0, 520, 0, 600)
duyuruFrame.AnchorPoint = Vector2.new(0.5, 0.5)
duyuruFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
duyuruFrame.BackgroundColor3 = C.SURFACE
duyuruFrame.BackgroundTransparency = 1
duyuruFrame.BorderSizePixel = 0
duyuruFrame.ZIndex = 200
duyuruFrame.Visible = false
duyuruFrame.ClipsDescendants = true
duyuruFrame.Parent = duyuruGui
addCorner(duyuruFrame, 20)
local glassOverlay = Instance.new("Frame")
glassOverlay.Size = UDim2.new(1, 0, 1, 0)
glassOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
glassOverlay.BackgroundTransparency = 0.97
glassOverlay.BorderSizePixel = 0
glassOverlay.ZIndex = 200
glassOverlay.Parent = duyuruFrame
addCorner(glassOverlay, 20)
local dfStroke = addStroke(duyuruFrame, C.BORDER, 2)
waveStroke(dfStroke, 7.5, 2.5, 0.8)
local duyuruTitleBar = Instance.new("Frame")
duyuruTitleBar.Size = UDim2.new(1, 0, 0, 70)
duyuruTitleBar.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
duyuruTitleBar.BorderSizePixel = 0
duyuruTitleBar.ZIndex = 201
duyuruTitleBar.ClipsDescendants = true
duyuruTitleBar.Parent = duyuruFrame
addCorner(duyuruTitleBar, 20)
local titleGradient = addGradient(duyuruTitleBar, 
    Color3.fromRGB(35, 35, 45), 
    Color3.fromRGB(28, 28, 38), 90)
local duyuruTitleFill = Instance.new("Frame")
duyuruTitleFill.Size = UDim2.new(1, 0, 0, 20)
duyuruTitleFill.Position = UDim2.new(0, 0, 1, -20)
duyuruTitleFill.BackgroundColor3 = Color3.fromRGB(26, 26, 34)
duyuruTitleFill.BorderSizePixel = 0
duyuruTitleFill.ZIndex = 201
duyuruTitleFill.Parent = duyuruTitleBar
addGradient(duyuruTitleFill,
    Color3.fromRGB(30, 30, 40),
    Color3.fromRGB(26, 26, 34), 90)
local duyuruDivider = Instance.new("Frame")
duyuruDivider.Size = UDim2.new(1, -40, 0, 2)
duyuruDivider.Position = UDim2.new(0, 20, 1, -2)
duyuruDivider.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
duyuruDivider.BackgroundTransparency = 0.3
duyuruDivider.BorderSizePixel = 0
duyuruDivider.ZIndex = 202
duyuruDivider.Parent = duyuruTitleBar
addCorner(duyuruDivider, 1)
addGradient(duyuruDivider, 
    Color3.fromRGB(255, 150, 60),
    Color3.fromRGB(255, 220, 100), 90)
task.spawn(function()
    local t = 0
    while duyuruDivider and duyuruDivider.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 2.2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        duyuruDivider.BackgroundTransparency = 0.2 + alpha * 0.3
    end
end)
local duyuruTitleLbl = Instance.new("TextLabel")
duyuruTitleLbl.Size = UDim2.new(1, -80, 0, 28)
duyuruTitleLbl.Position = UDim2.new(0, 24, 0, 12)
duyuruTitleLbl.BackgroundTransparency = 1
duyuruTitleLbl.Text = "⚡ MIDYE SCRIPT"
duyuruTitleLbl.TextColor3 = Color3.fromRGB(255, 220, 100)
duyuruTitleLbl.TextSize = 20
duyuruTitleLbl.Font = Enum.Font.GothamBold
duyuruTitleLbl.TextXAlignment = Enum.TextXAlignment.Left
duyuruTitleLbl.TextYAlignment = Enum.TextYAlignment.Center
duyuruTitleLbl.ZIndex = 202
duyuruTitleLbl.Parent = duyuruTitleBar
task.spawn(function()
    local t = 0
    while duyuruTitleLbl and duyuruTitleLbl.Parent do
        t = t + task.wait(0.05)
        local raw = (math.sin(t * 1.5) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        duyuruTitleLbl.TextColor3 = Color3.fromRGB(255, 220, 100):Lerp(
            Color3.fromRGB(255, 180, 80), alpha * 0.3)
    end
end)
local duyuruSubtitle = Instance.new("TextLabel")
duyuruSubtitle.Size = UDim2.new(1, -80, 0, 20)
duyuruSubtitle.Position = UDim2.new(0, 24, 0, 42)
duyuruSubtitle.BackgroundTransparency = 1
duyuruSubtitle.Text = "Neighbours öncelikle geliştirilmiş multi script"
duyuruSubtitle.TextColor3 = Color3.fromRGB(180, 180, 200)
duyuruSubtitle.TextSize = 13
duyuruSubtitle.Font = Enum.Font.Gotham
duyuruSubtitle.TextXAlignment = Enum.TextXAlignment.Left
duyuruSubtitle.TextYAlignment = Enum.TextYAlignment.Center
duyuruSubtitle.TextTransparency = 0
duyuruSubtitle.ZIndex = 202
duyuruSubtitle.Parent = duyuruTitleBar
local duyuruCloseBtn = Instance.new("TextButton")
duyuruCloseBtn.Size = UDim2.new(0, 24, 0, 24)
duyuruCloseBtn.Position = UDim2.new(1, -38, 0, 18)
duyuruCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 95, 87)
duyuruCloseBtn.Text = ""
duyuruCloseBtn.AutoButtonColor = false
duyuruCloseBtn.ZIndex = 203
duyuruCloseBtn.Parent = duyuruTitleBar
addCorner(duyuruCloseBtn, 12)
local closeStroke = addStroke(duyuruCloseBtn, Color3.fromRGB(180, 40, 40), 1.5, 0.2)
duyuruCloseBtn.MouseEnter:Connect(function()
    tween(duyuruCloseBtn, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(1, -40, 0, 16),
        BackgroundColor3 = Color3.fromRGB(255, 115, 107),
        Rotation = 90
    })
    tween(closeStroke, EASE_FAST, {Thickness = 2, Transparency = 0})
end)
duyuruCloseBtn.MouseLeave:Connect(function()
    tween(duyuruCloseBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 24, 0, 24),
        Position = UDim2.new(1, -38, 0, 18),
        BackgroundColor3 = Color3.fromRGB(255, 95, 87),
        Rotation = 0
    })
    tween(closeStroke, EASE_FAST, {Thickness = 1.5, Transparency = 0.2})
end)
local duyuruCloseIcon = Instance.new("TextLabel")
duyuruCloseIcon.Size = UDim2.new(1, 0, 1, 0)
duyuruCloseIcon.BackgroundTransparency = 1
duyuruCloseIcon.Text = "×"
duyuruCloseIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
duyuruCloseIcon.TextSize = 16
duyuruCloseIcon.Font = Enum.Font.GothamBold
duyuruCloseIcon.TextTransparency = 0.2
duyuruCloseIcon.ZIndex = 204
duyuruCloseIcon.Parent = duyuruCloseBtn
local duyuruScroll = Instance.new("ScrollingFrame")
duyuruScroll.Size = UDim2.new(1, -40, 1, -90)
duyuruScroll.Position = UDim2.new(0, 15, 0, 78)
duyuruScroll.BackgroundTransparency = 1
duyuruScroll.ScrollBarThickness = 8
duyuruScroll.ScrollBarImageColor3 = Color3.fromRGB(255, 200, 60)
duyuruScroll.ScrollBarImageTransparency = 0.3
duyuruScroll.BorderSizePixel = 0
duyuruScroll.ZIndex = 201
duyuruScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
duyuruScroll.ClipsDescendants = true
duyuruScroll.Parent = duyuruFrame
task.spawn(function()
    local t = 0
    while duyuruScroll and duyuruScroll.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        duyuruScroll.ScrollBarImageTransparency = 0.2 + alpha * 0.3
    end
end)
local duyuruLayout = Instance.new("UIListLayout")
duyuruLayout.Padding = UDim.new(0, 16)
duyuruLayout.SortOrder = Enum.SortOrder.LayoutOrder
duyuruLayout.Parent = duyuruScroll
local duyuruPadding = Instance.new("UIPadding")
duyuruPadding.PaddingTop = UDim.new(0, 10)
duyuruPadding.PaddingBottom = UDim.new(0, 10)
duyuruPadding.PaddingLeft = UDim.new(0, 6)
duyuruPadding.PaddingRight = UDim.new(0, 6)
duyuruPadding.Parent = duyuruScroll
do
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, 0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.BackgroundColor3 = C.SURFACE2
    card.BackgroundTransparency = 0
    card.BorderSizePixel = 0
    card.LayoutOrder = 1
    card.ZIndex = 202
    card.Parent = duyuruScroll
    addCorner(card, 14)
    addGradient(card, Color3.fromRGB(26, 26, 34), Color3.fromRGB(20, 20, 28), 135)
    local cardStroke = addStroke(card, C.BORDER, 1.5, 0.5)
    card.MouseEnter:Connect(function()
        tween(cardStroke, EASE_FAST, {Color = Color3.fromRGB(255, 200, 60), Thickness = 2, Transparency = 0.1})
    end)
    card.MouseLeave:Connect(function()
        tween(cardStroke, EASE_FAST, {Color = C.BORDER, Thickness = 1.5, Transparency = 0.5})
    end)
    local cardPad = Instance.new("UIPadding")
    cardPad.PaddingTop    = UDim.new(0, 20)
    cardPad.PaddingBottom = UDim.new(0, 20)
    cardPad.PaddingLeft   = UDim.new(0, 20)
    cardPad.PaddingRight  = UDim.new(0, 20)
    cardPad.Parent = card
    local cardLayout = Instance.new("UIListLayout")
    cardLayout.Padding = UDim.new(0, 12)
    cardLayout.SortOrder = Enum.SortOrder.LayoutOrder
    cardLayout.Parent = card
    local badge = Instance.new("Frame")
    badge.Size = UDim2.new(0, 0, 0, 26)
    badge.AutomaticSize = Enum.AutomaticSize.X
    badge.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
    badge.BackgroundTransparency = 0.82
    badge.BorderSizePixel = 0
    badge.LayoutOrder = 1
    badge.ZIndex = 203
    badge.Parent = card
    addCorner(badge, 13)
    addStroke(badge, Color3.fromRGB(255, 200, 60), 1, 0.5)
    local badgePad = Instance.new("UIPadding")
    badgePad.PaddingLeft  = UDim.new(0, 12)
    badgePad.PaddingRight = UDim.new(0, 12)
    badgePad.Parent = badge
    local badgeLbl = Instance.new("TextLabel")
    badgeLbl.Size = UDim2.new(1, 0, 1, 0)
    badgeLbl.BackgroundTransparency = 1
    badgeLbl.Text = "⚡  MIDYE SCRIPT"
    badgeLbl.TextColor3 = Color3.fromRGB(255, 220, 100)
    badgeLbl.TextSize = 12
    badgeLbl.Font = Enum.Font.GothamBold
    badgeLbl.TextXAlignment = Enum.TextXAlignment.Center
    badgeLbl.ZIndex = 204
    badgeLbl.Parent = badge
    local baslik = Instance.new("TextLabel")
    baslik.Size = UDim2.new(1, 0, 0, 0)
    baslik.AutomaticSize = Enum.AutomaticSize.Y
    baslik.BackgroundTransparency = 1
    baslik.Text = "🎮 Midye Script Hakkında"
    baslik.TextColor3 = Color3.fromRGB(255, 255, 255)
    baslik.TextSize = 17
    baslik.Font = Enum.Font.GothamBold
    baslik.TextXAlignment = Enum.TextXAlignment.Left
    baslik.TextWrapped = true
    baslik.LayoutOrder = 2
    baslik.ZIndex = 203
    baslik.Parent = card
    local sep = Instance.new("Frame")
    sep.Size = UDim2.new(1, 0, 0, 2)
    sep.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
    sep.BackgroundTransparency = 0.6
    sep.BorderSizePixel = 0
    sep.LayoutOrder = 3
    sep.ZIndex = 203
    sep.Parent = card
    addCorner(sep, 1)
    addGradient(sep, Color3.fromRGB(255, 150, 60), Color3.fromRGB(100, 100, 255), 90)
    local maddeler = {
        "✈️  Fly — İstediğiniz hızı ayarlayıp uçabilirsin",
        "👻  Noclip — Duvarların ve nesnelerin içinden geçmek için",
        "🔍  ESP — Tüm oyuncuları mesafeleriyle gör",
        "🎯  Aimbot — Crosshair yakınındaki hedefe kilitlenme",
        "👁️  View — Seçili oyuncunun gözünden dünyayı izle",
        "🔁  Auto TP — Seçili oyuncuya kalıcı ışınlan",
        "🚀  Manuel TP — Seçili oyuncuya ışınlan",
        "🔄  Rejoin — Servera yeniden hızlıca bağlan",
        "⚙️  Uçuş hızı, koşu hızı ve aimbot hassasiyeti ayarlanabilir",
        "🎨  Gunslol ve Discord üzerinden istek şikayet belirtebilirsiniz",
        "⚡  Bazı oyunların auto-cheat banlarından ötürü hileyi açar açmaz banlanabilirsiniz",
        "⚡  Oyunda hileyi denerken yan hesabınızla deneyip auto-cheat ban yiyip yemeyeceğinize bakın",
        "⚡  Bazı hileler bazı oyunlarda fixlenmiş olabilir",
        "⚡  Script öncelikle Neighbours için geliştirilmiştir DLIM değerini 1 yapıp rejoin atarak oyunda gezebilirsiniz. Rejoin attıktan sonra karakterinizin sıfırlanması gerekiyor (para 0 olunca anlayabilirsiniz) bu kalıcı bir sıfırlanma değildir script kapatıldığında eski haline geri döner",
    }
    for i, madde in ipairs(maddeler) do
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, 0, 0, 0)
        row.AutomaticSize = Enum.AutomaticSize.Y
        row.BackgroundTransparency = 1
        row.LayoutOrder = 3 + i
        row.ZIndex = 203
        row.Parent = card
        local rowLayout = Instance.new("UIListLayout")
        rowLayout.FillDirection = Enum.FillDirection.Horizontal
        rowLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        rowLayout.Padding = UDim.new(0, 8)
        rowLayout.Parent = row
        local bulletFrame = Instance.new("Frame")
        bulletFrame.Size = UDim2.new(0, 16, 0, 20)
        bulletFrame.BackgroundTransparency = 1
        bulletFrame.ZIndex = 204
        bulletFrame.Parent = row
        local bullet = Instance.new("Frame")
        bullet.Size = UDim2.new(0, 6, 0, 6)
        bullet.Position = UDim2.new(0, 5, 0, 7)
        bullet.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
        bullet.BorderSizePixel = 0
        bullet.ZIndex = 205
        bullet.Parent = bulletFrame
        addCorner(bullet, 3)
        task.spawn(function()
            task.wait(i * 0.06)
            local t = 0
            while bullet and bullet.Parent do
                t = t + task.wait(0.04)
                local raw = (math.sin(t * 1.5 + i) + 1) / 2
                local alpha = raw * raw * (3 - 2 * raw)
                bullet.BackgroundTransparency = 0.2 + alpha * 0.5
            end
        end)
        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, -24, 0, 0)
        lbl.AutomaticSize = Enum.AutomaticSize.Y
        lbl.BackgroundTransparency = 1
        lbl.Text = madde
        lbl.TextColor3 = C.TEXT_MUTED
        lbl.TextSize = 13
        lbl.Font = Enum.Font.Gotham
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.TextWrapped = true
        lbl.ZIndex = 204
        lbl.Parent = row
    end
    local altBilgi = Instance.new("TextLabel")
    altBilgi.Size = UDim2.new(1, 0, 0, 0)
    altBilgi.AutomaticSize = Enum.AutomaticSize.Y
    altBilgi.BackgroundTransparency = 1
    altBilgi.Text = "💬  discord → sherlockn     🎮  guns.lol → realsherlock"
    altBilgi.TextColor3 = Color3.fromRGB(120, 125, 145)
    altBilgi.TextSize = 12
    altBilgi.Font = Enum.Font.Gotham
    altBilgi.TextXAlignment = Enum.TextXAlignment.Center
    altBilgi.TextWrapped = true
    altBilgi.LayoutOrder = 20
    altBilgi.ZIndex = 203
    altBilgi.Parent = card
end
duyuruLayout.Changed:Connect(function()
    duyuruScroll.CanvasSize = UDim2.new(0, 0, 0, duyuruLayout.AbsoluteContentSize.Y + 20)
end)
local duyuruOpen = false
local function openDuyuru()
    if duyuruOpen then return end
    duyuruOpen = true
    duyuruBlur.Visible = true
    tween(duyuruBlur, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0.6
    })
    duyuruFrame.Visible = true
    particleContainer.Visible = true
    duyuruFrame.BackgroundTransparency = 1
    duyuruFrame.Size = UDim2.new(0, 480, 0, 550)
    duyuruFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    duyuruFrame.Rotation = 0
    duyuruScroll.Visible = false
    tween(duyuruFrame, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0,
        Size     = UDim2.new(0, 520, 0, 600),
    })
    task.delay(0.25, function()
        if duyuruOpen then
            duyuruScroll.Visible = true
        end
    end)
    task.delay(0.3, function()
        for i, child in ipairs(duyuruScroll:GetChildren()) do
            if child:IsA("Frame") and child.LayoutOrder then
                child.Position = UDim2.new(0, 0, 0.3, 0)
                child.BackgroundTransparency = 1
                child.Rotation = 0
                task.delay(i * 0.045, function()
                    if child and child.Parent then
                        tween(child, TweenInfo.new(0.42, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Position = UDim2.new(0, 0, 0, 0),
                            BackgroundTransparency = 0,
                        })
                    end
                end)
            end
        end
    end)
end
local function closeDuyuru()
    if not duyuruOpen then return end
    duyuruOpen = false
    duyuruScroll.Visible = false
    tween(duyuruBlur, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        BackgroundTransparency = 1
    })
    task.delay(0.32, function()
        if not duyuruOpen then 
            duyuruBlur.Visible = false
        end
    end)
    local currentSize = duyuruFrame.Size
    local currentPos = duyuruFrame.Position
    tween(duyuruFrame, TweenInfo.new(0.38, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(
            currentPos.X.Scale, currentPos.X.Offset + currentSize.X.Offset / 2,
            currentPos.Y.Scale, currentPos.Y.Offset + currentSize.Y.Offset / 2
        ),
    })
    task.delay(0.40, function()
        if not duyuruOpen then
            duyuruFrame.Visible = false
            particleContainer.Visible = false
            duyuruFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        end
    end)
end
duyurularBtn.MouseButton1Click:Connect(openDuyuru)
duyuruCloseBtn.MouseButton1Click:Connect(closeDuyuru)
attachDrag(titleBar)
attachDrag(bottomHandle)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then updateDrag(input) end
end)
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
local resizeStroke = addStroke(resizeHandle, C.BORDER, 1.5, 0.3)
addGradient(resizeHandle,
    Color3.fromRGB(22, 22, 30),
    Color3.fromRGB(18, 18, 24), 135)
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
task.spawn(function()
    local t = 0
    while resizeStroke and resizeStroke.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 1.8) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        resizeStroke.Color = C.BORDER:Lerp(C.ACCENT, alpha * 0.4)
        resizeStroke.Transparency = 0.2 + alpha * 0.2
    end
end)
resizeHandle.MouseEnter:Connect(function() 
    tween(resizeHandle, EASE_FAST, {BackgroundColor3=C.SURFACE2})
    tween(resizeStroke, EASE_FAST, {Thickness = 2, Transparency = 0})
end)
resizeHandle.MouseLeave:Connect(function() 
    tween(resizeHandle, EASE_FAST, {BackgroundColor3=C.SURFACE})
    tween(resizeStroke, EASE_FAST, {Thickness = 1.5})
end)
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
addGradient(leftSection,
    Color3.fromRGB(20, 20, 28),
    Color3.fromRGB(16, 16, 22), 135)
local leftParticles = Instance.new("Frame")
leftParticles.Size = UDim2.new(1, 0, 1, 0)
leftParticles.BackgroundTransparency = 1
leftParticles.ZIndex = 0
leftParticles.ClipsDescendants = true
leftParticles.Parent = leftSection
for i = 1, 6 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = C.ACCENT
    particle.BackgroundTransparency = 0.8
    particle.BorderSizePixel = 0
    particle.ZIndex = 0
    particle.Parent = leftParticles
    addCorner(particle, math.random(1, 3))
    task.spawn(function()
        local startPos = particle.Position
        local t = math.random() * 10
        while particle and particle.Parent do
            t = t + task.wait(0.05)
            local offsetX = math.sin(t * 0.4 + i) * 0.03
            local offsetY = math.sin(t * 0.25 + i * 0.5) * 0.05
            particle.Position = UDim2.new(
                startPos.X.Scale + offsetX, 0,
                startPos.Y.Scale + offsetY, 0
            )
            local raw = (math.sin(t * 1.2 + i) + 1) / 2
            local alpha = raw * raw * (3 - 2 * raw)
            particle.BackgroundTransparency = 0.75 + alpha * 0.2
        end
    end)
end
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
searchBox.Focused:Connect(function()
    tween(sbStroke, EASE_FAST, {Color = C.ACCENT, Thickness = 2.2})
    tween(searchBox, EASE_FAST, {BackgroundColor3 = C.SURFACE2:Lerp(C.ACCENT, 0.07)})
end)
searchBox.FocusLost:Connect(function()
    tween(sbStroke, EASE_FAST, {Color = C.BORDER, Thickness = 1.5})
    tween(searchBox, EASE_FAST, {BackgroundColor3 = C.SURFACE2})
end)
local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0.35, 0, 0, 42)
clearBtn.BackgroundColor3 = C.SURFACE2
clearBtn.Text = "TEMİZLE"
clearBtn.TextTruncate = Enum.TextTruncate.AtEnd
clearBtn.TextColor3 = Color3.fromRGB(255,255,255)
clearBtn.TextSize = 13
clearBtn.Font = Enum.Font.GothamBold
clearBtn.AutoButtonColor = false
clearBtn.Parent = searchContainer
addCorner(clearBtn, 8)
addStroke(clearBtn, C.BORDER, 1.5)
hookHover(clearBtn, C.SURFACE2, C.SURFACE2:Lerp(Color3.fromRGB(255,255,255), 0.12))
btnBaseSize[clearBtn] = clearBtn.Size
btnBasePos[clearBtn]  = clearBtn.Position
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
local selectedPanel = Instance.new("Frame")
selectedPanel.Size = UDim2.new(1, -20, 0, 165)
selectedPanel.Position = UDim2.new(0, 10, 1, -175)
selectedPanel.BackgroundColor3 = C.SURFACE2
selectedPanel.BorderSizePixel = 0
selectedPanel.Parent = leftSection
addCorner(selectedPanel, 12)
local selectedStroke = addStroke(selectedPanel, C.BORDER, 1.5)
addGradient(selectedPanel,
    Color3.fromRGB(26, 26, 34),
    Color3.fromRGB(20, 20, 28), 135)
task.spawn(function()
    local t = 0
    while selectedStroke and selectedStroke.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 1.5) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        selectedStroke.Color = C.BORDER:Lerp(C.ACCENT, alpha * 0.3)
    end
end)
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
    btn.ClipsDescendants = true   -- ripple için
    btn.Parent = parent
    addCorner(btn, 8)
    local s = addStroke(btn, C.BORDER, 1, 0.3)
    btnStrokeRef[btn] = s
    btnBaseSize[btn]  = size
    btnBasePos[btn]   = pos
    hookPress(btn)
    return btn
end
local viewBtn = makeToggleBtn(selectedPanel,
    UDim2.new(0.9,0,0,36), UDim2.new(0.05,0,0,45), "👁️ VIEW KAPALI")
local autoTPBtn = makeToggleBtn(selectedPanel,
    UDim2.new(0.9,0,0,36), UDim2.new(0.05,0,0,86), "⚡ AUTO TP KAPALI")
local manualTPBtn = makeToggleBtn(selectedPanel,
    UDim2.new(0.9,0,0,36), UDim2.new(0.05,0,0,127), "🚀 ŞİMDİ TP AT")
hookToggleHover(viewBtn)
hookToggleHover(autoTPBtn)
hookToggleHover(manualTPBtn)
local rightSection = Instance.new("Frame")
rightSection.Size = UDim2.new(0.55, -10, 1, -82)
rightSection.Position = UDim2.new(0.45, 0, 0, 45)
rightSection.BackgroundColor3 = C.SURFACE
rightSection.BorderSizePixel = 0
rightSection.ClipsDescendants = true
rightSection.Parent = mainFrame
addCorner(rightSection, 14)
addStroke(rightSection, C.BORDER, 1.5)
addGradient(rightSection,
    Color3.fromRGB(20, 20, 28),
    Color3.fromRGB(16, 16, 22), 135)
local rightParticles = Instance.new("Frame")
rightParticles.Size = UDim2.new(1, 0, 1, 0)
rightParticles.BackgroundTransparency = 1
rightParticles.ZIndex = 0
rightParticles.ClipsDescendants = true
rightParticles.Parent = rightSection
for i = 1, 6 do
    local particle = Instance.new("Frame")
    particle.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5))
    particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
    particle.BackgroundColor3 = C.ACCENT
    particle.BackgroundTransparency = 0.8
    particle.BorderSizePixel = 0
    particle.ZIndex = 0
    particle.Parent = rightParticles
    addCorner(particle, math.random(1, 3))
    task.spawn(function()
        local startPos = particle.Position
        local t = math.random() * 10
        while particle and particle.Parent do
            t = t + task.wait(0.05)
            local offsetX = math.sin(t * 0.4 + i) * 0.03
            local offsetY = math.sin(t * 0.25 + i * 0.5) * 0.05
            particle.Position = UDim2.new(
                startPos.X.Scale + offsetX, 0,
                startPos.Y.Scale + offsetY, 0
            )
            local raw = (math.sin(t * 1.2 + i) + 1) / 2
            local alpha = raw * raw * (3 - 2 * raw)
            particle.BackgroundTransparency = 0.75 + alpha * 0.2
        end
    end)
end
local cheatTitle = Instance.new("TextLabel")
cheatTitle.Size = UDim2.new(1, 0, 0, 48)
cheatTitle.BackgroundTransparency = 1
cheatTitle.Text = "⚙️ HİLE MENÜSÜ"
cheatTitle.TextColor3 = C.TEXT
cheatTitle.TextSize = 18
cheatTitle.TextTruncate = Enum.TextTruncate.AtEnd
cheatTitle.Font = Enum.Font.GothamBold
cheatTitle.Parent = rightSection
local cheatButtons = {}
local buttonData = {
    {Text = "✈️ FLY KAPALI",    Color = C.GREEN},
    {Text = "👻 NOCLIP KAPALI", Color = C.GREEN},
    {Text = "🔍 ESP KAPALI",    Color = C.GREEN},
    {Text = "🎯 AIMBOT KAPALI", Color = C.GREEN},
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
    btn.ClipsDescendants = true   -- ripple için
    btn.Parent = rightSection
    addCorner(btn, 12)
    local s = addStroke(btn, C.BORDER, 1.5, 0.2)
    btnStrokeRef[btn] = s
    btnBaseSize[btn]  = btn.Size
    btnBasePos[btn]   = btn.Position
    hookToggleHover(btn)
    hookPress(btn)
    cheatButtons[data.Text] = btn
end
local settingsContainer = Instance.new("Frame")
settingsContainer.Size = UDim2.new(0.9, 0, 0, 268)
settingsContainer.Position = UDim2.new(0.05, 0, 0, 406)
settingsContainer.BackgroundColor3 = C.SURFACE2
settingsContainer.BackgroundTransparency = 0.5
settingsContainer.BorderSizePixel = 0
settingsContainer.Parent = rightSection
addCorner(settingsContainer, 12)
local settingsStroke = addStroke(settingsContainer, C.BORDER, 1.5, 0.5)
addGradient(settingsContainer,
    Color3.fromRGB(26, 26, 34),
    Color3.fromRGB(20, 20, 28), 135)
task.spawn(function()
    local t = 0
    while settingsStroke and settingsStroke.Parent do
        t = t + task.wait(0.04)
        local raw = (math.sin(t * 1.2) + 1) / 2
        local alpha = raw * raw * (3 - 2 * raw)
        settingsStroke.Transparency = 0.4 + alpha * 0.2
    end
end)
local settingsPadding = Instance.new("UIPadding")
settingsPadding.PaddingTop = UDim.new(0, 10)
settingsPadding.PaddingBottom = UDim.new(0, 10)
settingsPadding.PaddingLeft = UDim.new(0, 12)
settingsPadding.PaddingRight = UDim.new(0, 12)
settingsPadding.Parent = settingsContainer
local settingsData = {
    {Label = "⚡ Uçuş Hızı:",        Default = "120"},
    {Label = "🏃 Koşu Hızı:",        Default = "16"},
    {Label = "📊 DLIM:",             Default = "1"},
    {Label = "🎯 Aimbot Hızı:",      Default = "0.15"},
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
    box.Focused:Connect(function()
        tween(bxStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Color = C.ACCENT, 
            Thickness = 2.5,
            Transparency = 0
        })
        tween(box, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = C.SURFACE2:Lerp(C.ACCENT, 0.12),
            Size = UDim2.new(0.5, -8, 0, 44),
            Position = UDim2.new(0.5, 4, 0, -1)
        })
    end)
    box.FocusLost:Connect(function()
        tween(bxStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Color = C.BORDER, 
            Thickness = 1.5,
            Transparency = 0
        })
        tween(box, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = C.SURFACE2,
            Size = UDim2.new(0.5, -10, 0, 42),
            Position = UDim2.new(0.5, 5, 0, 0)
        })
    end)
    controls[s.Label] = box
end
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
local aimbotEnabled   = false
local aimbotConnection= nil
local aimbotRadius    = 23  -- Crosshair'dan biraz büyük daire yarıçapı (piksel) - 46 piksel çap
local aimbotSmoothness= 0.15 -- Smooth takip hızı (0.1 = çok yavaş, 0.3 = hızlı, 1 = anlık)
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
    setToggleColor(viewBtn, col)
    applyView()
end
local function toggleAutoTP()
    autoTPEnabled = not autoTPEnabled
    autoTPBtn.Text = autoTPEnabled and "⚡ AUTO TP AÇIK" or "⚡ AUTO TP KAPALI"
    local col = autoTPEnabled and C.RED or C.GREEN
    setToggleColor(autoTPBtn, col)
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
        distLabel.TextColor3 = Color3.fromRGB(255, 80, 220)
        distLabel.TextStrokeColor3 = Color3.fromRGB(0,0,0)
        distLabel.TextStrokeTransparency = 0
        distLabel.TextSize = 15
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
    setToggleColor(espBtn, col)
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
local aimbotBtn = cheatButtons["🎯 AIMBOT KAPALI"]
local rejoinBtn = cheatButtons["🔄 REJOIN"]
local function toggleFly()
    local character = localPlayer.Character
    local root      = character and character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if flying then
        flying = false
        flyBtn.Text = "✈️ FLY KAPALI"
        setToggleColor(flyBtn, C.GREEN)
        if bv then bv:Destroy(); bv = nil end
        if bg then bg:Destroy(); bg = nil end
        if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
        local hum = character and character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.PlatformStand = false
            hum.WalkSpeed = walkSpeed
        end
    else
        flying = true
        flyBtn.Text = "✈️ FLY AÇIK"
        setToggleColor(flyBtn, C.RED)
        local hum = character and character:FindFirstChildOfClass("Humanoid")
        bv = Instance.new("BodyVelocity")
        bv.Name       = "MidyeFlyBV"
        bv.Velocity   = Vector3.new(0, 0, 0)
        bv.MaxForce   = Vector3.new(1e5, 1e5, 1e5)
        bv.Parent     = root
        bg = Instance.new("BodyGyro")
        bg.Name        = "MidyeFlyBG"
        bg.MaxTorque   = Vector3.new(1e5, 1e5, 1e5)
        bg.P           = 1e4
        bg.D           = 500
        bg.CFrame      = CFrame.new(root.Position)
        bg.Parent      = root
        flyConnection = RunService.Heartbeat:Connect(function()
            if not flying then return end
            if not root or not root.Parent then
                flying = false
                flyBtn.Text = "✈️ FLY KAPALI"
                setToggleColor(flyBtn, C.GREEN)
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
            bv.Velocity = dir * flySpeed
            local look = cam.CFrame.LookVector
            local flatLook = Vector3.new(look.X, 0, look.Z)
            if flatLook.Magnitude > 0.01 then
                bg.CFrame = CFrame.new(root.Position, root.Position + flatLook)
            end
            if hum then
                if dir.Magnitude > 0 then
                    hum.WalkSpeed = flySpeed
                else
                    hum.WalkSpeed = 0
                end
            end
        end)
    end
end
local function toggleNoclip()
    noclipEnabled = not noclipEnabled
    noclipBtn.Text = noclipEnabled and "👻 NOCLIP AÇIK" or "👻 NOCLIP KAPALI"
    local col = noclipEnabled and C.RED or C.GREEN
    setToggleColor(noclipBtn, col)
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
local function getClosestPlayerInRadius()
    local cam = workspace.CurrentCamera
    local screenCenter = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
    local closestPlayer = nil
    local closestDistance = aimbotRadius
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= localPlayer and plr.Character then
            local head = plr.Character:FindFirstChild("Head")
            if head then
                local screenPos, onScreen = cam:WorldToViewportPoint(head.Position)
                if onScreen then
                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = plr
                    end
                end
            end
        end
    end
    return closestPlayer
end
local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    aimbotBtn.Text = aimbotEnabled and "🎯 AIMBOT AÇIK" or "🎯 AIMBOT KAPALI"
    local col = aimbotEnabled and C.RED or C.GREEN
    setToggleColor(aimbotBtn, col)
    if aimbotEnabled then
        aimbotConnection = RunService.RenderStepped:Connect(function()
            if not aimbotEnabled then return end
            local targetPlayer = getClosestPlayerInRadius()
            if targetPlayer and targetPlayer.Character then
                local head = targetPlayer.Character:FindFirstChild("Head")
                if head then
                    local cam = workspace.CurrentCamera
                    local targetCFrame = CFrame.new(cam.CFrame.Position, head.Position)
                    cam.CFrame = cam.CFrame:Lerp(targetCFrame, aimbotSmoothness)
                end
            end
        end)
    else
        if aimbotConnection then 
            aimbotConnection:Disconnect() 
            aimbotConnection = nil 
        end
    end
end
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
                    tween(btn, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = C.SURFACE2:Lerp(C.ACCENT, 0.18),
                        Size = UDim2.new(1, -6, 0, 40),
                        Position = btn.Position + UDim2.new(0, 3, 0, -1),
                    })
                    tween(bStroke, EASE_FAST, {
                        Color = C.ACCENT:Lerp(Color3.fromRGB(255, 255, 255), 0.3),
                        Thickness = 2,
                        Transparency = 0.1
                    })
                end
            end)
            btn.MouseLeave:Connect(function()
                if selectedPlayer ~= plr then
                    tween(btn, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundColor3 = C.SURFACE2,
                        Size = UDim2.new(1, -10, 0, 38),
                        Position = btn.Position - UDim2.new(0, 3, 0, -1),
                    })
                    tween(bStroke, EASE_FAST, {
                        Color = C.BORDER,
                        Thickness = 1.5,
                        Transparency = 0.3
                    })
                end
            end)
            btn.MouseButton1Click:Connect(function()
                if selectedButton and selectedButton ~= btn then
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
            if selectedPlayer == plr then
                selectedButton = btn
            end
        end
    end
    playerListFrame.CanvasSize = UDim2.new(0,0,0, playerListLayout.AbsoluteContentSize.Y + 10)
end
searchBox:GetPropertyChangedSignal("Text"):Connect(function() refreshPlayers(searchBox.Text) end)
clearBtn.MouseButton1Click:Connect(function() searchBox.Text = ""; refreshPlayers("") end)
flyBtn.MouseButton1Click:Connect(toggleFly)
noclipBtn.MouseButton1Click:Connect(toggleNoclip)
espBtn.MouseButton1Click:Connect(toggleESP)
aimbotBtn.MouseButton1Click:Connect(toggleAimbot)
rejoinBtn.MouseButton1Click:Connect(rejoinGame)
viewBtn.MouseButton1Click:Connect(toggleView)
autoTPBtn.MouseButton1Click:Connect(toggleAutoTP)
manualTPBtn.MouseButton1Click:Connect(manualTP)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then toggleESP() end
end)
local flySpeedBox      = controls["⚡ Uçuş Hızı:"]
local walkSpeedBox     = controls["🏃 Koşu Hızı:"]
local dataLimitBox     = controls["📊 DLIM:"]
local aimbotSpeedBox   = controls["🎯 Aimbot Hızı:"]
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
aimbotSpeedBox.FocusLost:Connect(function()
    local v = tonumber(aimbotSpeedBox.Text)
    if v then
        v = math.clamp(v, 0.1, 1)
        aimbotSmoothness = v
        aimbotSpeedBox.Text = tostring(v)
    else
        aimbotSpeedBox.Text = tostring(aimbotSmoothness)
    end
end)
localPlayer.CharacterAdded:Connect(function(char)
    if flying then
        flying = false
        flyBtn.Text = "✈️ FLY KAPALI"
        setToggleColor(flyBtn, C.GREEN)
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
local isMinimized  = false
local normalSize   = mainFrame.Size
local normalPosition = mainFrame.Position
minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        normalSize     = mainFrame.Size
        normalPosition = mainFrame.Position
        tween(leftSection,  TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.In),  {BackgroundTransparency = 1})
        tween(rightSection, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.In),  {BackgroundTransparency = 1})
        task.delay(0.16, function()
            leftSection.Visible  = false
            rightSection.Visible = false
            resizeHandle.Visible = false
            bottomHandle.Visible = false
            bottomHandle.BackgroundTransparency = 1
            topDiv.BackgroundTransparency = 1
            titleBarFill.Visible = false
            titleDivider.Visible = false
            titleBar.Size = UDim2.new(1, 0, 1, 0)
            titleLabel.Visible = false
            titleLabelMin.Visible = true
            mainFrame.ClipsDescendants = true
            tween(mainFrame, TweenInfo.new(0.38, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size     = UDim2.new(0, 220, 0, 40),
                Position = UDim2.new(normalPosition.X.Scale, normalPosition.X.Offset, normalPosition.Y.Scale, normalPosition.Y.Offset),
            })
        end)
    else
        titleBar.Size = UDim2.new(1, 0, 0, 40)
        tween(mainFrame, TweenInfo.new(0.50, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size     = normalSize,
            Position = normalPosition,
        })
        task.delay(0.30, function()
            leftSection.Visible  = true
            rightSection.Visible = true
            leftSection.BackgroundTransparency  = 1
            rightSection.BackgroundTransparency = 1
            resizeHandle.Visible = true
            bottomHandle.Visible = true
            bottomHandle.BackgroundTransparency = 0
            topDiv.BackgroundTransparency = 0.7
            titleBarFill.Visible = true
            titleDivider.Visible = true
            titleLabel.Visible    = true
            titleLabelMin.Visible = false
            tween(leftSection,  TweenInfo.new(0.30, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0})
            tween(rightSection, TweenInfo.new(0.30, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0})
        end)
    end
end)
end
