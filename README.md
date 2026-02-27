<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=7B2FBE&height=200&section=header&text=MinhZ%20Library&fontSize=60&fontColor=ffffff&fontAlignY=38&desc=A%20modern%20UI%20Library%20for%20Roblox%20scripts&descAlignY=60&descColor=e0c8ff" width="100%"/>

![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![Roblox](https://img.shields.io/badge/Roblox-000000?style=for-the-badge&logo=roblox&logoColor=white)
![Version](https://img.shields.io/badge/version-2.0.0-blueviolet?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)

**Clean · Fast · Beautiful**

[Features](#-features) · [Installation](#-installation) · [Quick Start](#-quick-start) · [API Reference](#-api-reference) · [Themes](#-themes) · [Examples](#-examples)

</div>

---

## ✨ Features

- 🎨 **10 Built-in Themes** — Purple, Blue, Red, Green, Dark, Sakura, Ocean, Midnight, Light, Cyber
- 📱 **Mobile Support** — Touch-friendly with auto-detected toggle button
- 🖱️ **Draggable Window** — Smooth drag support for both mouse and touch
- 🌈 **Full HSV Color Picker** — SV square, hue bar, and hex input field
- 🔔 **Notification System** — 4 types: `Success`, `Error`, `Info`, `Warning`
- ⚡ **Rich Component Set** — Button, Toggle, Slider, Dropdown, Keybind, ColorPicker, Textbox, Label, Section, Info Card
- 🏷️ **Theme-Aware UI** — All components update automatically when switching themes
- 🔁 **Full Getter/Setter API** — Get and set values on all interactive components at any time

---

## 📦 Installation

```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr"))()
```

---

## 🚀 Quick Start

```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr))()

local Window = MinhZ:CreateWindow("My Script")

MinhZ:Notify({
    Title = "Loaded!",
    Description = "Script initialized successfully.",
    Type = "Success",
    Duration = 3
})

local Tab = Window:CreateTab("Main")

Tab:CreateButton("Say Hello", function()
    print("Hello!")
end)
```

---

## 📚 API Reference

### 🌐 MinhZ (Global)

---

#### `MinhZ:CreateWindow(title)` → `WindowFuncs`

Creates the main UI window.

```lua
local Window = MinhZ:CreateWindow("My Script")
```

---

#### `MinhZ:Notify(options)`

Displays a notification in the bottom-right corner of the screen.

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Title` | `string` | `"Notification"` | Notification title |
| `Description` | `string` | `""` | Notification body text |
| `Type` | `string` | `"Info"` | `"Success"` `"Error"` `"Info"` `"Warning"` |
| `Duration` | `number` | `3` | Auto-dismiss delay in seconds |

```lua
MinhZ:Notify({
    Title = "Error",
    Description = "Something went wrong.",
    Type = "Error",
    Duration = 5
})
```

---

### 🪟 WindowFuncs

Returned by `MinhZ:CreateWindow()`.

| Method | Description |
|--------|-------------|
| `Window:CreateTab(name)` | Creates a new sidebar tab. Returns `TabFuncs` |
| `Window:SetTheme(name)` | Switches the UI theme. See [Themes](#-themes) |
| `Window:Toggle()` | Toggles window visibility |
| `Window:Destroy()` | Destroys the entire UI |

---

### 📋 TabFuncs

Returned by `Window:CreateTab()`.

---

#### `Tab:CreateSection(text)`

Adds a labeled section divider with a colored underline.

```lua
Tab:CreateSection("Combat")
```

---

#### `Tab:CreateButton(text, callback)`

Adds a clickable button.

```lua
Tab:CreateButton("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
```

---

#### `Tab:CreateToggle(text, callback)` → `{ Set(value), Get() }`

Adds an animated toggle switch.

```lua
local Toggle = Tab:CreateToggle("Aimbot", function(value)
    print("Aimbot:", value)
end)

Toggle:Set(true)
print(Toggle:Get()) -- true
```

---

#### `Tab:CreateSlider(text, min, max, default, callback, increment)` → `{ SetValue(v), GetValue() }`

Adds a draggable slider. `increment` is optional — auto-calculated if omitted.

```lua
local Slider = Tab:CreateSlider("Walk Speed", 16, 300, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end, 1)

Slider:SetValue(100)
print(Slider:GetValue())
```

---

#### `Tab:CreateDropdown(text, list, callback)` → `{ AddItem(v), SetSelected(v), GetSelected() }`

Adds an animated expandable dropdown.

```lua
local Dropdown = Tab:CreateDropdown("Team", {"Red", "Blue", "Green"}, function(value)
    print("Selected:", value)
end)

Dropdown:AddItem("Yellow")
Dropdown:SetSelected("Blue")
print(Dropdown:GetSelected())
```

---

#### `Tab:CreateKeybind(text, defaultKey, callback)` → `{ GetKey(), Destroy() }`

Adds a rebindable keybind. Click the component then press any key to rebind.

```lua
local Keybind = Tab:CreateKeybind("Toggle Menu", Enum.KeyCode.RightShift, function()
    Window:Toggle()
end)

print(Keybind:GetKey())
Keybind:Destroy()
```

---

#### `Tab:CreateColorPicker(text, defaultColor, callback)` → `{ SetColor(c), GetColor() }`

Adds a full HSV color picker with SV square, hue bar, and hex input.

```lua
local Picker = Tab:CreateColorPicker("ESP Color", Color3.fromRGB(255, 0, 0), function(color)
    print("Color:", color)
end)

Picker:SetColor(Color3.fromRGB(0, 255, 128))
print(Picker:GetColor())
```

---

#### `Tab:CreateTextbox(text, placeholder, callback)` → `{ SetText(t), GetText() }`

Adds a text input field. Callback fires on Enter key.

```lua
local Box = Tab:CreateTextbox("Player Name", "Enter name...", function(text)
    print("Input:", text)
end)

Box:SetText("Player1")
print(Box:GetText())
```

---

#### `Tab:CreateLabel(text)` → `{ SetText(t), GetText() }`

Adds a static text label.

```lua
local Label = Tab:CreateLabel("Version: 2.0.0")

Label:SetText("Version: 2.1.0")
```

---

#### `Tab:CreateInfo()` → `InfoFuncs`

Adds a player info card displaying:
- 👤 Avatar, Username, Display Name
- 🌍 Nationality (via `LocalizationService`)
- 📅 Account creation date
- 🖥️ Executor name
- ⏱️ Live server time (updates every second)

```lua
local Info = Tab:CreateInfo()
```

##### `InfoFuncs:AddButton(text, callback)`

Adds a small action button inside the info card.

```lua
Info:AddButton("Copy UserID", function()
    setclipboard(tostring(game.Players.LocalPlayer.UserId))
end)
```

---

## 🎨 Themes

| Name | Primary | Style |
|------|---------|-------|
| `Purple` | `#C850B4` | Default dark purple |
| `Blue` | `#4287F5` | Deep blue |
| `Red` | `#F54242` | Dark red |
| `Green` | `#42F587` | Dark green |
| `Dark` | `#FFFFFF` | Pure dark / monochrome |
| `Sakura` | `#FF69B4` | Soft pink blossom |
| `Ocean` | `#00BEFF` | Deep ocean |
| `Midnight` | `#6464FF` | Midnight blue |
| `Light` | `#323232` | Light / white mode |
| `Cyber` | `#00FFC8` | Neon cyberpunk |

```lua
Window:SetTheme("Ocean")
```

---

## 💡 Examples

<details>
<summary><b>Full Script Example — click to expand</b></summary>

```lua
local MinhZ = loadstring(game:HttpGet("RAW_URL_HERE"))()

local Window = MinhZ:CreateWindow("My Hub")

MinhZ:Notify({ Title = "Loaded!", Description = "Welcome.", Type = "Success" })

local Main     = Window:CreateTab("Main")
local Visual   = Window:CreateTab("Visual")
local Settings = Window:CreateTab("Settings")

-- Main Tab
Main:CreateSection("Movement")

local Speed = Main:CreateSlider("WalkSpeed", 16, 300, 16, function(v)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end, 1)

Main:CreateToggle("Infinite Jump", function(enabled)
    -- your logic here
end)

Main:CreateKeybind("Toggle UI", Enum.KeyCode.RightShift, function()
    Window:Toggle()
end)

-- Visual Tab
Visual:CreateSection("ESP")

local ESPColor = Visual:CreateColorPicker("ESP Color", Color3.fromRGB(255, 50, 50), function(color)
    -- apply color to ESP
end)

Visual:CreateToggle("Box ESP", function(v)
    -- toggle box ESP
end)

-- Settings Tab
Settings:CreateDropdown("Theme", {
    "Purple", "Blue", "Red", "Green",
    "Dark", "Sakura", "Ocean", "Midnight", "Light", "Cyber"
}, function(v)
    Window:SetTheme(v)
    MinhZ:Notify({ Title = "Theme", Description = "Switched to " .. v, Type = "Info" })
end)

Settings:CreateLabel("MinhZ Library v2.0.0")
```

</details>

---

## 📁 File Structure

```
MinhZ_Library/
├── MinhZ_Library.lua        -- Main library source
├── MinhZ_Example_Usage.lua  -- Full usage example
└── README.md                -- Documentation
```

---

## 📄 License

Licensed under the **MIT License** — free to use, modify, and distribute with credit.

---

<div align="center">

Made with ❤️ by **MinhZ**

<img src="https://capsule-render.vercel.app/api?type=waving&color=7B2FBE&height=100&section=footer" width="100%"/>

</div>
