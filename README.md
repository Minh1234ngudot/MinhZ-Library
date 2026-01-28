# 🎨 MinhZ Library - Roblox UI Library

A modern, feature-rich UI library for Roblox with automatic decimal slider support, beautiful themes, and smooth animations.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Roblox](https://img.shields.io/badge/platform-Roblox-red)
![License](https://img.shields.io/badge/license-MIT-green)

## ✨ Features

### 🎯 Core Features
- **Modern Design** - Clean, professional UI with smooth animations
- **10+ Themes** - Purple, Blue, Red, Green, Dark, Sakura, Ocean, Midnight, Light, Cyber
- **Mobile Support** - Fully responsive with touch controls
- **Drag & Drop** - Movable windows
- **Minimize Function** - Collapsible interface

### 🧩 UI Components
- ✅ **Buttons** - Click actions
- 🔘 **Toggles** - On/off switches with smooth animations
- 📋 **Dropdowns** - Selection lists
- 🎚️ **Sliders** - Automatic decimal/integer detection
- ⌨️ **Keybinds** - Key binding system
- 🎨 **Color Pickers** - 15-color palette
- 📝 **Textboxes** - Text input fields
- 🏷️ **Labels** - Static text display
- 📑 **Sections** - Visual dividers with headers
- ℹ️ **Info Panel** - Player avatar, stats, executor info, server time

### 🔔 Notifications
- Multiple types: Success, Error, Info, Warning
- Auto-fade animations
- Customizable duration
- Stacking system

## 📦 Installation

### Method 1: Direct Load (Recommended)
```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr"))()
```

### Method 2: Local File
1. Download `MinhZ_Library_Fixed.lua`
2. Load it in your executor

## 🚀 Quick Start

### Basic Window Setup
```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr"))()

-- Create window
local Window = MinhZ:CreateWindow("My Script")

-- Create tab
local Tab = Window:CreateTab("Main")

-- Add components
Tab:CreateButton("Click Me", function()
    print("Button clicked!")
end)
```

### Complete Example
```lua
local MinhZ = loadstring(game:HttpGet("YOUR_URL"))()
local Window = MinhZ:CreateWindow("⚡ My Hub ⚡")

-- Change theme
Window:SetTheme("Ocean")

-- Create tabs
local MainTab = Window:CreateTab("Main")
local SettingsTab = Window:CreateTab("Settings")

-- Add components
MainTab:CreateButton("Test Button", function()
    print("Clicked!")
end)

local toggle = MainTab:CreateToggle("Enable Feature", function(state)
    print("Toggle:", state)
end)

-- Slider with automatic decimal detection
MainTab:CreateSlider("Speed", 0, 1, 0.5, function(value)
    print("Value:", value) -- 0.00, 0.01, 0.02...
end)

-- Manual increment (optional)
MainTab:CreateSlider("FOV", 0, 180, 90, function(value)
    print("FOV:", value)
end, 1) -- Force integer

-- Dropdown
MainTab:CreateDropdown("Select Mode", {"Mode 1", "Mode 2", "Mode 3"}, function(value)
    print("Selected:", value)
end)

-- Keybind
MainTab:CreateKeybind("Toggle Key", Enum.KeyCode.E, function()
    print("Key pressed!")
end)

-- Color Picker
MainTab:CreateColorPicker("ESP Color", Color3.fromRGB(255, 0, 0), function(color)
    print("Color:", color)
end)

-- Textbox
local textbox = MainTab:CreateTextbox("Enter Name", "Type here...", function(text)
    print("Input:", text)
end)

-- Label
local label = MainTab:CreateLabel("This is a label")

-- Section (divider)
MainTab:CreateSection("Section Title")

-- Info Panel
local Info = MainTab:CreateInfo()
Info:AddButton("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
```

## 📖 API Reference

### Window Functions

#### `MinhZ:CreateWindow(title)`
Creates a new window.
```lua
local Window = MinhZ:CreateWindow("My Script")
```

#### `Window:SetTheme(themeName)`
Changes the window theme.
```lua
Window:SetTheme("Ocean")
```
**Available Themes:** `Purple`, `Blue`, `Red`, `Green`, `Dark`, `Sakura`, `Ocean`, `Midnight`, `Light`, `Cyber`

#### `Window:Toggle()`
Shows/hides the window.
```lua
Window:Toggle()
```

#### `Window:CreateTab(name)`
Creates a new tab.
```lua
local Tab = Window:CreateTab("Main")
```

### Tab Components

#### `Tab:CreateButton(text, callback)`
```lua
Tab:CreateButton("Click Me", function()
    print("Clicked!")
end)
```

#### `Tab:CreateToggle(text, callback)`
```lua
local toggle = Tab:CreateToggle("Enable", function(state)
    print("State:", state)
end)

-- Programmatically set state
toggle:Set(true)
```

#### `Tab:CreateSlider(text, min, max, default, callback, increment?)`
```lua
-- Auto-detect increment (recommended)
Tab:CreateSlider("Speed", 0, 1, 0.5, function(value)
    print(value) -- 0.00, 0.01, 0.02...
end)

-- Manual increment
Tab:CreateSlider("FOV", 50, 120, 90, function(value)
    print(value)
end, 5) -- Steps of 5
```

**Auto-Detection Logic:**
- Range ≤ 1 → increment = 0.01
- Range ≤ 10 → increment = 0.1
- Range > 10 → increment = 1

#### `Tab:CreateDropdown(text, options, callback)`
```lua
Tab:CreateDropdown("Mode", {"Option 1", "Option 2"}, function(value)
    print("Selected:", value)
end)
```

#### `Tab:CreateKeybind(text, defaultKey, callback)`
```lua
Tab:CreateKeybind("Toggle", Enum.KeyCode.E, function()
    print("Key pressed!")
end)
```

#### `Tab:CreateColorPicker(text, defaultColor, callback)`
```lua
Tab:CreateColorPicker("Color", Color3.fromRGB(255, 0, 0), function(color)
    print("Color:", color)
end)
```

#### `Tab:CreateTextbox(text, placeholder, callback)`
```lua
local textbox = Tab:CreateTextbox("Name", "Enter name...", function(text)
    print("Input:", text)
end)

-- Methods
textbox:SetText("New text")
local text = textbox:GetText()
```

#### `Tab:CreateLabel(text)`
```lua
local label = Tab:CreateLabel("This is a label")

-- Update label
label:SetText("New text")
```

#### `Tab:CreateSection(text)`
```lua
Tab:CreateSection("Settings")
```

#### `Tab:CreateInfo()`
```lua
local Info = Tab:CreateInfo()

-- Add buttons to info panel
Info:AddButton("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

Info:AddButton("Copy Discord", function()
    setclipboard("discord.gg/your_invite")
end)
```

### Notifications

#### `MinhZ:Notify(options)`
```lua
MinhZ:Notify({
    Title = "Success",
    Description = "Action completed!",
    Duration = 3,
    Type = "Success" -- Success, Error, Info, Warning
})
```

**Options:**
- `Title` (string) - Notification title
- `Description` (string) - Notification message
- `Duration` (number) - Display duration in seconds (default: 3)
- `Type` (string) - "Success", "Error", "Info", "Warning" (default: "Info")

## 🎨 Themes

| Theme | Primary Color | Use Case |
|-------|--------------|----------|
| Purple | Pink-Purple | Default, feminine |
| Blue | Sky Blue | Professional, clean |
| Red | Bright Red | Aggressive, combat |
| Green | Mint Green | Nature, calm |
| Dark | White on Black | Minimalist, stealthy |
| Sakura | Hot Pink | Anime, cute |
| Ocean | Cyan | Water, cool |
| Midnight | Purple-Blue | Dark, mysterious |
| Light | Dark on Light | High visibility |
| Cyber | Neon Cyan | Futuristic, tech |

## 🎯 Slider Examples

### Automatic Detection (Recommended)
```lua
-- Small range (0-1) → 0.01 increment
Tab:CreateSlider("Transparency", 0, 1, 0.5, function(val)
    workspace.Part.Transparency = val
end)

-- Medium range (0-10) → 0.1 increment  
Tab:CreateSlider("WalkSpeed Multiplier", 0, 5, 1, function(val)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 * val
end)

-- Large range (10-500) → 1 increment
Tab:CreateSlider("FOV", 50, 120, 90, function(val)
    workspace.CurrentCamera.FieldOfView = val
end)
```

### Manual Increment
```lua
-- Force 0.01 precision
Tab:CreateSlider("Aim Smoothness", 0, 1, 0.5, function(val)
    settings.smoothness = val
end, 0.01)

-- Force integer
Tab:CreateSlider("Max Players", 1, 100, 50, function(val)
    settings.maxPlayers = val
end, 1)

-- Custom increment
Tab:CreateSlider("Volume", 0, 100, 50, function(val)
    sound.Volume = val / 100
end, 5) -- Steps of 5
```

## 📋 Best Practices

### 1. Organization
```lua
-- Group related settings in sections
Tab:CreateSection("Movement")
Tab:CreateSlider("Speed", ...)
Tab:CreateSlider("Jump Power", ...)

Tab:CreateSection("Visuals")
Tab:CreateToggle("ESP", ...)
Tab:CreateColorPicker("ESP Color", ...)
```

### 2. User Feedback
```lua
Tab:CreateButton("Execute", function()
    -- Do action
    executeAction()
    
    -- Notify user
    MinhZ:Notify({
        Title = "Success",
        Description = "Action executed!",
        Type = "Success"
    })
end)
```

### 3. State Management
```lua
-- Save toggle references
local toggles = {}

toggles.esp = Tab:CreateToggle("ESP", function(state)
    config.esp = state
end)

-- Later: programmatically set
toggles.esp:Set(true)
```

### 4. Info Panel Usage
```lua
local Info = Tab:CreateInfo()

Info:AddButton("Rejoin Server", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

Info:AddButton("Copy Discord", function()
    setclipboard("discord.gg/invite")
    MinhZ:Notify({
        Title = "Discord",
        Description = "Copied to clipboard!",
        Type = "Success"
    })
end)
```

## 🔧 Advanced Features

### Custom Theme Creation
Themes are stored in the library. To add custom themes, modify the `Themes` table:
```lua
Themes.MyTheme = {
    Primary = Color3.fromRGB(255, 0, 255),
    Background = Color3.fromRGB(20, 20, 20),
    Sidebar = Color3.fromRGB(30, 30, 30),
    Component = Color3.fromRGB(40, 40, 40)
}
```

### Info Panel Details
The info panel automatically displays:
- Player avatar (150x150)
- Username (@username)
- Display name
- Nationality (auto-detected)
- Account creation date
- Executor name
- Server uptime (real-time)

## 🐛 Troubleshooting

### Sliders Only Show Integers
**Problem:** Slider shows `0, 1, 2` instead of `0.01, 0.02, 0.03`

**Solution:** Update to the latest library version with automatic increment detection.

### UI Not Showing on Mobile
**Problem:** UI doesn't appear on mobile devices

**Solution:** The library includes a hamburger menu button (☰) in the top-left corner for mobile users.

### Theme Not Changing
**Problem:** `Window:SetTheme()` doesn't work

**Solution:** Make sure the theme name is spelled correctly (case-sensitive):
```lua
Window:SetTheme("Ocean") -- ✅ Correct
Window:SetTheme("ocean") -- ❌ Wrong
```

## 📜 License

MIT License - Free to use and modify

## 🤝 Credits

- **Created by:** MinhZ
- **Slider Fix:** Advanced decimal detection system
- **Special Thanks:** Community feedback and testing

## 📞 Support

- **Discord:** [Discord Here](https://discord.gg/4tkJqrZv4m)
- **GitHub:** [GitHub Here](https://github.com/Minh1234ngudot)

## 📝 Changelog

### v1.0.0 (Latest)
- ✨ Added automatic decimal slider detection
- 🎨 10 pre-built themes
- 📱 Full mobile support
- 🔔 Notification system
- ℹ️ Info panel with real-time stats
- 🎨 Color picker with 15 colors
- ⌨️ Keybind system
- 📋 All core UI components

---

Made with ❤️ by MinhZ | Star ⭐ if you like it!
