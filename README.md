# ⚡ MinhZ Library v2

A modern, clean and feature-rich UI Library for Roblox scripts with beautiful animations and smooth interactions.

![Version](https://img.shields.io/badge/version-2.0-purple)
![License](https://img.shields.io/badge/license-MIT-blue)
![Roblox](https://img.shields.io/badge/platform-Roblox-red)

## ✨ Features

- 🎨 **Modern Dark Theme** - Beautiful purple/pink gradient design
- 🖱️ **Draggable Window** - Move the UI anywhere on screen
- 📱 **Minimizable** - Clean minimize/close buttons
- 🔄 **Smooth Animations** - TweenService powered transitions
- 📦 **6 Component Types** - Everything you need for a complete GUI
- 🎯 **Auto Canvas Sizing** - Scrolling frames adjust automatically
- 💾 **Easy to Use** - Simple and intuitive API

## 📦 Components

| Component | Description |
|-----------|-------------|
| **Button** | Simple clickable button |
| **Toggle** | ON/OFF switch with indicator |
| **Dropdown** | Expandable selection menu |
| **Slider** | Value adjuster with visual feedback |
| **Keybind** | Custom keybind selector |
| **ColorPicker** | Color palette with 15 preset colors |

## 🚀 Installation

### Method 1: Loadstring (Recommended)
```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr"))()
```

### Method 2: Local Module
1. Download the library file
2. Place it in your script folder
3. Require it:
```lua
local MinhZ = require(path.to.MinhZLibrary)
```

## 📖 Quick Start

### Basic Setup
```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr"))()
local Window = MinhZ:CreateWindow("My Script")

local Tab1 = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("Settings")
```

### Creating Components

#### Button
```lua
Tab1:CreateButton("Click Me", function()
    print("Button clicked!")
end)
```

#### Toggle
```lua
local MyToggle = Tab1:CreateToggle("Enable Feature", function(value)
    print("Toggle is now:", value)
end)

-- Update toggle from code
MyToggle:Set(true)  -- Turn ON
MyToggle:Set(false) -- Turn OFF
```

#### Dropdown
```lua
Tab1:CreateDropdown("Select Mode", {"Option 1", "Option 2", "Option 3"}, function(selected)
    print("Selected:", selected)
end)
```

#### Slider
```lua
Tab1:CreateSlider("Speed", 1, 100, 50, function(value)
    print("Speed set to:", value)
end)
-- Parameters: (name, min, max, default, callback)
```

#### Keybind
```lua
Tab1:CreateKeybind("Toggle Fly", Enum.KeyCode.F, function()
    print("F key pressed!")
end)
-- Click the keybind to change the key
```

#### ColorPicker
```lua
Tab1:CreateColorPicker("ESP Color", Color3.fromRGB(255, 0, 0), function(color)
    print("Color selected:", color)
end)
```

## 🎯 Advanced Examples

### Synced Toggle with Keybind
```lua
local enabled = false

local MyToggle = Tab:CreateToggle("Enable Feature", function(value)
    enabled = value
    print("Feature:", enabled and "ON" or "OFF")
end)

Tab:CreateKeybind("Toggle Key", Enum.KeyCode.E, function()
    enabled = not enabled
    MyToggle:Set(enabled)  -- Sync UI
    print("Feature:", enabled and "ON" or "OFF")
end)
```

### Multiple Tabs with Different Features
```lua
local Window = MinhZ:CreateWindow("Advanced Script")

-- Combat Tab
local Combat = Window:CreateTab("Combat")
Combat:CreateToggle("Aimbot", function(v) _G.Aimbot = v end)
Combat:CreateSlider("FOV", 50, 400, 150, function(v) _G.AimbotFOV = v end)
Combat:CreateKeybind("Aimbot Key", Enum.KeyCode.E, function() 
    -- Your aimbot logic
end)

-- Visuals Tab
local Visual = Window:CreateTab("Visuals")
Visual:CreateToggle("ESP", function(v) _G.ESP = v end)
Visual:CreateColorPicker("ESP Color", Color3.fromRGB(255, 0, 0), function(c)
    _G.ESPColor = c
end)

-- Movement Tab
local Movement = Window:CreateTab("Movement")
Movement:CreateToggle("Fly", function(v) _G.Flying = v end)
Movement:CreateSlider("Fly Speed", 1, 10, 5, function(v) _G.FlySpeed = v end)
```

## 🎨 Customization

### Default Colors
```lua
-- Main Theme
Background: Color3.fromRGB(20, 18, 30)
Sidebar: Color3.fromRGB(28, 24, 38)
Component: Color3.fromRGB(38, 30, 50)

-- Accent Colors
Primary: Color3.fromRGB(200, 80, 180)  -- Purple-Pink
Text: Color3.fromRGB(240, 240, 245)    -- Light Gray
```

### Window Size
Default: **550x350** pixels
- Can be minimized to **550x40** (header only)
- Centered on screen by default
- Draggable to any position

## 📝 API Reference

### Window Functions
```lua
MinhZ:CreateWindow(title: string) -> WindowObject
```

### Window Methods
```lua
Window:CreateTab(name: string) -> TabObject
```

### Tab Methods
```lua
Tab:CreateButton(text: string, callback: function)
Tab:CreateToggle(text: string, callback: function(value: boolean)) -> ToggleObject
Tab:CreateDropdown(text: string, options: table, callback: function(selected: string))
Tab:CreateSlider(text: string, min: number, max: number, default: number, callback: function(value: number))
Tab:CreateKeybind(text: string, defaultKey: KeyCode, callback: function)
Tab:CreateColorPicker(text: string, defaultColor: Color3, callback: function(color: Color3))
```

### Toggle Object Methods
```lua
Toggle:Set(value: boolean) -- Update toggle state
```

## 🔧 Troubleshooting

### UI not loading?
- Make sure you're using the correct loadstring URL
- Check if your executor supports `game:HttpGet()`
- Verify that `syn.protect_gui` or equivalent is available

### Components not working?
- Ensure callbacks are valid functions
- Check for typos in parameter names
- Use `pcall()` to catch errors in callbacks

### Keybind not detecting?
- Click the keybind UI element first
- Wait for "..." to appear
- Press your desired key
- Check if key is already bound to Roblox functions

## 🤝 Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Improve documentation

## 📄 License

MIT License - Feel free to use in your projects!

## 💬 Support

- **Discord**: [discord.gg/4tkJqrZv4m]
- **GitHub Issues**: Report bugs here
- **Roblox**: [[Your Profile](https://www.roblox.com/users/9773437936/profile)]

---

<div align="center">

**Made with ❤️ by MinhZ**

⭐ Star this repo if you found it helpful!

</div>
