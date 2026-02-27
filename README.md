<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=7B2FBE&height=200&section=header&text=MinhZ%20Library&fontSize=60&fontColor=ffffff&fontAlignY=38&desc=A%20Modern%20UI%20Library%20For%20Roblox%20Scripts&descAlignY=60&descColor=e0c8ff" width="100%"/>

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
- 📱 **Mobile Support** — Touch-Friendly With Auto-Detected Toggle Button
- 🖱️ **Draggable Window** — Smooth Drag Support For Both Mouse And Touch
- 🌈 **Full HSV Color Picker** — SV Square, Hue Bar, And Hex Input Field
- 🔔 **Notification System** — 4 Types: `Success`, `Error`, `Info`, `Warning`
- ⚡ **Rich Component Set** — Button, Toggle, Slider, Dropdown, Keybind, ColorPicker, Textbox, Label, Section, Info Card
- 🏷️ **Theme-Aware UI** — All Components Update Automatically When Switching Themes
- 🔁 **Full Getter/Setter API** — Get And Set Values On All Interactive Components At Any Time

---

## 📦 Installation

```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr"))()
```

---

## 🚀 Quick Start

```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr"))()

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

Creates The Main UI Window.

```lua
local Window = MinhZ:CreateWindow("My Script")
```

---

#### `MinhZ:Notify(options)`

Displays A Notification In The Bottom-Right Corner Of The Screen.

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `Title` | `string` | `"Notification"` | Notification Title |
| `Description` | `string` | `""` | Notification Body Text |
| `Type` | `string` | `"Info"` | `"Success"` `"Error"` `"Info"` `"Warning"` |
| `Duration` | `number` | `3` | Auto-Dismiss Delay In Seconds |

```lua
MinhZ:Notify({
    Title = "Error",
    Description = "Something Went Wrong.",
    Type = "Error",
    Duration = 5
})
```

---

### 🪟 WindowFuncs

Returned by `MinhZ:CreateWindow()`.

| Method | Description |
|--------|-------------|
| `Window:CreateTab(name)` | Creates A New Sidebar Tab. Returns `TabFuncs` |
| `Window:SetTheme(name)` | Switches The UI Theme. See [Themes](#-themes) |
| `Window:Toggle()` | Toggles Window Visibility |
| `Window:Destroy()` | Destroys The Entire UI |

---

### 📋 TabFuncs

Returned By `Window:CreateTab()`.

---

#### `Tab:CreateSection(text)`

Adds A Labeled Section Divider With A Colored Underline.

```lua
Tab:CreateSection("Combat")
```

---

#### `Tab:CreateButton(text, callback)`

Adds A Clickable Button.

```lua
Tab:CreateButton("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
```

---

#### `Tab:CreateToggle(text, callback)` → `{ Set(value), Get() }`

Adds An Animated Toggle Switch.

```lua
local Toggle = Tab:CreateToggle("Aimbot", function(value)
    print("Aimbot:", value)
end)

Toggle:Set(true)
print(Toggle:Get()) -- true
```

---

#### `Tab:CreateSlider(text, min, max, default, callback, increment)` → `{ SetValue(v), GetValue() }`

Adds A Draggable Slider. `increment` Is Optional — Auto-Calculated If Omitted.

```lua
local Slider = Tab:CreateSlider("Walk Speed", 16, 300, 16, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end, 1)

Slider:SetValue(100)
print(Slider:GetValue())
```

---

#### `Tab:CreateDropdown(text, list, callback)` → `{ AddItem(v), SetSelected(v), GetSelected() }`

Adds An Animated Expandable Dropdown.

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

Adds A Rebindable Keybind. Click The Component Then Press Any Key To Rebind.

```lua
local Keybind = Tab:CreateKeybind("Toggle Menu", Enum.KeyCode.RightShift, function()
    Window:Toggle()
end)

print(Keybind:GetKey())
Keybind:Destroy()
```

---

#### `Tab:CreateColorPicker(text, defaultColor, callback)` → `{ SetColor(c), GetColor() }`

Adds A Full HSV Color Picker With SV Square, Hue Bar, And Hex Input.

```lua
local Picker = Tab:CreateColorPicker("ESP Color", Color3.fromRGB(255, 0, 0), function(color)
    print("Color:", color)
end)

Picker:SetColor(Color3.fromRGB(0, 255, 128))
print(Picker:GetColor())
```

---

#### `Tab:CreateTextbox(text, placeholder, callback)` → `{ SetText(t), GetText() }`

Adds A Text Input Field. Callback Fires On Enter Key.

```lua
local Box = Tab:CreateTextbox("Player Name", "Enter name...", function(text)
    print("Input:", text)
end)

Box:SetText("Player1")
print(Box:GetText())
```

---

#### `Tab:CreateLabel(text)` → `{ SetText(t), GetText() }`

Adds A Static Text Label.

```lua
local Label = Tab:CreateLabel("Version: 2.0.0")

Label:SetText("Version: 2.1.0")
```

---

#### `Tab:CreateInfo()` → `InfoFuncs`

Adds A Player Info Card Displaying:
- 👤 Avatar, Username, Display Name
- 🌍 Nationality (via `LocalizationService`)
- 📅 Account Creation Date
- 🖥️ Executor Name
- ⏱️ Live Server Time (Updates Every Second)

```lua
local Info = Tab:CreateInfo()
```

##### `InfoFuncs:AddButton(text, callback)`

Adds A Small Action Button Inside The Info Card.

```lua
Info:AddButton("Copy UserID", function()
    setclipboard(tostring(game.Players.LocalPlayer.UserId))
end)
```

---

## 🎨 Themes

| Name | Primary | Style |
|------|---------|-------|
| `Purple` | `#C850B4` | Default Dark Purple |
| `Blue` | `#4287F5` | Deep Blue |
| `Red` | `#F54242` | Dark Red |
| `Green` | `#42F587` | Dark Green |
| `Dark` | `#FFFFFF` | Pure Dark / Monochrome |
| `Sakura` | `#FF69B4` | Soft Pink Blossom |
| `Ocean` | `#00BEFF` | Deep Ocean |
| `Midnight` | `#6464FF` | Midnight Blue |
| `Light` | `#323232` | Light / White Mode |
| `Cyber` | `#00FFC8` | Neon Cyberpunk |

```lua
Window:SetTheme("Ocean")
```

---

## 💡 Examples

<details>
<summary><b>Full Script Example — Click To Expand</b></summary>

```lua
local MinhZ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Minh1234ngudot/MinhZ-Library/refs/heads/main/MinhZ-Lib-Scr"))()

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
## 📄 License

Licensed Under The **MIT License** — Free To Use, Modify, And Distribute With Credit.

---

<div align="center">

Made with ❤️ By **MinhZ**

<img src="https://capsule-render.vercel.app/api?type=waving&color=7B2FBE&height=100&section=footer" width="100%"/>

</div>
