--[[
MMMMMMMM               MMMMMMMM                  lllllllWWWWWWWW                           WWWWWWWWhhhhhhh                                                                         
M:::::::M             M:::::::M                  l:::::lW::::::W                           W::::::Wh:::::h                                                                         
M::::::::M           M::::::::M                  l:::::lW::::::W                           W::::::Wh:::::h                                                                         
M:::::::::M         M:::::::::M                  l:::::lW::::::W                           W::::::Wh:::::h                                                                         
M::::::::::M       M::::::::::M  aaaaaaaaaaaaa    l::::l W:::::W           WWWWW           W:::::W  h::::h hhhhh           eeeeeeeeeeee    rrrrr   rrrrrrrrr       eeeeeeeeeeee    
M:::::::::::M     M:::::::::::M  a::::::::::::a   l::::l  W:::::W         W:::::W         W:::::W   h::::hh:::::hhh      ee::::::::::::ee  r::::rrr:::::::::r    ee::::::::::::ee  
M:::::::M::::M   M::::M:::::::M  aaaaaaaaa:::::a  l::::l   W:::::W       W:::::::W       W:::::W    h::::::::::::::hh   e::::::eeeee:::::eer:::::::::::::::::r  e::::::eeeee:::::ee
M::::::M M::::M M::::M M::::::M           a::::a  l::::l    W:::::W     W:::::::::W     W:::::W     h:::::::hhh::::::h e::::::e     e:::::err::::::rrrrr::::::re::::::e     e:::::e
M::::::M  M::::M::::M  M::::::M    aaaaaaa:::::a  l::::l     W:::::W   W:::::W:::::W   W:::::W      h::::::h   h::::::he:::::::eeeee::::::e r:::::r     r:::::re:::::::eeeee::::::e
M::::::M   M:::::::M   M::::::M  aa::::::::::::a  l::::l      W:::::W W:::::W W:::::W W:::::W       h:::::h     h:::::he:::::::::::::::::e  r:::::r     rrrrrrre:::::::::::::::::e 
M::::::M    M:::::M    M::::::M a::::aaaa::::::a  l::::l       W:::::W:::::W   W:::::W:::::W        h:::::h     h:::::he::::::eeeeeeeeeee   r:::::r            e::::::eeeeeeeeeee  
M::::::M     MMMMM     M::::::Ma::::a    a:::::a  l::::l        W:::::::::W     W:::::::::W         h:::::h     h:::::he:::::::e            r:::::r            e:::::::e           
M::::::M               M::::::Ma::::a    a:::::a l::::::l        W:::::::W       W:::::::W          h:::::h     h:::::he::::::::e           r:::::r            e::::::::e          
M::::::M               M::::::Ma:::::aaaa::::::a l::::::l         W:::::W         W:::::W           h:::::h     h:::::h e::::::::eeeeeeee   r:::::r             e::::::::eeeeeeee  
M::::::M               M::::::M a::::::::::aa:::al::::::l          W:::W           W:::W            h:::::h     h:::::h  ee:::::::::::::e   r:::::r              ee:::::::::::::e  
MMMMMMMM               MMMMMMMM  aaaaaaaaaa  aaaallllllll           WWW             WWW             hhhhhhh     hhhhhhh    eeeeeeeeeeeeee   rrrrrrr                eeeeeeeeeeeeee
====================================================================================================================================================================================
                                                                      UI Library MalWhere | Made By MinhZ
]]--

local MalWhere = {}
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local RunService = game:GetService("RunService")

local IsMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local CountryToNationality = {
    ["AD"]="Andorran",["AE"]="Emirati",["AF"]="Afghan",["AG"]="Antiguan, Barbudan",["AI"]="Anguillian",
    ["AL"]="Albanian",["AM"]="Armenian",["AN"]="Dutch",["AO"]="Angolan",["AQ"]="Unknown",
    ["AR"]="Argentinean",["AS"]="American Samoan",["AT"]="Austrian",["AU"]="Australian",["AW"]="Aruban",
    ["AX"]="Swedish",["AZ"]="Azerbaijani",["BA"]="Bosnian, Herzegovinian",["BB"]="Barbadian",
    ["BD"]="Bangladeshi",["BE"]="Belgian",["BF"]="Burkinabe",["BG"]="Bulgarian",["BH"]="Bahraini",
    ["BI"]="Burundian",["BJ"]="Beninese",["BL"]="Saint Barthélemy Islander",["BM"]="Bermudian",
    ["BN"]="Bruneian",["BO"]="Bolivian",["BQ"]="Dutch",["BR"]="Brazilian",["BS"]="Bahamian",
    ["BT"]="Bhutanese",["BV"]="Unknown",["BW"]="Motswana",["BY"]="Belarusian",["BZ"]="Belizean",
    ["CA"]="Canadian",["CC"]="Cocos Islander",["CD"]="Congolese",["CF"]="Central African",
    ["CG"]="Congolese",["CH"]="Swiss",["CI"]="Ivorian",["CK"]="Cook Islander",["CL"]="Chilean",
    ["CM"]="Cameroonian",["CN"]="Chinese",["CO"]="Colombian",["CR"]="Costa Rican",
    ["CS"]="Montenegrins, Serbs",["CT"]="Unknown",["CU"]="Cuban",["CV"]="Cape Verdian",
    ["CW"]="Curaçaoan",["CX"]="Christmas Island",["CY"]="Cypriot",["CZ"]="Czech",["DE"]="German",
    ["DJ"]="Djibouti",["DK"]="Danish",["DM"]="Dominican",["DO"]="Dominican",["DZ"]="Algerian",
    ["EC"]="Ecuadorean",["EE"]="Estonian",["EG"]="Egyptian",["EH"]="Sahrawi",["ER"]="Eritrean",
    ["ES"]="Spanish",["ET"]="Ethiopian",["FI"]="Finnish",["FJ"]="Fijian",["FK"]="Falkland Islander",
    ["FM"]="Micronesian",["FO"]="Faroese",["FQ"]="Unknown",["FR"]="French",["FX"]="Unknown",
    ["GA"]="Gabonese",["GB"]="British",["GD"]="Grenadian",["GE"]="Georgian",["GF"]="Unknown",
    ["GG"]="Channel Islander",["GH"]="Ghanaian",["GI"]="Gibraltar",["GL"]="Greenlandic",
    ["GM"]="Gambian",["GN"]="Guinean",["GP"]="Guadeloupian",["GQ"]="Equatorial Guinean",
    ["GR"]="Greek",["GS"]="South Georgia and the South Sandwich Islander",["GT"]="Guatemalan",
    ["GU"]="Guamanian",["GW"]="Guinea-Bissauan",["GY"]="Guyanese",["HK"]="Chinese",
    ["HM"]="Heard and McDonald Islander",["HN"]="Honduran",["HR"]="Croatian",["HT"]="Haitian",
    ["HU"]="Hungarian",["ID"]="Indonesian",["IE"]="Irish",["IL"]="Israeli",["IM"]="Manx",
    ["IN"]="Indian",["IO"]="Indian",["IQ"]="Iraqi",["IR"]="Iranian",["IS"]="Icelander",
    ["IT"]="Italian",["JE"]="Channel Islander",["JM"]="Jamaican",["JO"]="Jordanian",["JP"]="Japanese",
    ["JT"]="Unknown",["KE"]="Kenyan",["KG"]="Kirghiz",["KH"]="Cambodian",["KI"]="I-Kiribati",
    ["KM"]="Comoran",["KN"]="Kittian and Nevisian",["KP"]="North Korean",["KR"]="South Korean",
    ["KW"]="Kuwaiti",["KY"]="Caymanian",["KZ"]="Kazakhstani",["LA"]="Laotian",["LB"]="Lebanese",
    ["LC"]="Saint Lucian",["LI"]="Liechtensteiner",["LK"]="Sri Lankan",["LR"]="Liberian",
    ["LS"]="Mosotho",["LT"]="Lithuanian",["LU"]="Luxembourger",["LV"]="Latvian",["LY"]="Libyan",
    ["MA"]="Moroccan",["MC"]="Monegasque",["MD"]="Moldovan",["ME"]="Montenegrin",
    ["MF"]="Saint Martin Islander",["MG"]="Malagasy",["MH"]="Marshallese",["MI"]="Unknown",
    ["MK"]="Macedonian",["ML"]="Malian",["MM"]="Myanmar",["MN"]="Mongolian",["MO"]="Chinese",
    ["MP"]="American",["MQ"]="French",["MR"]="Mauritanian",["MS"]="Montserratian",["MT"]="Maltese",
    ["MU"]="Mauritian",["MV"]="Maldivan",["MW"]="Malawian",["MX"]="Mexican",["MY"]="Malaysian",
    ["MZ"]="Mozambican",["NA"]="Namibian",["NC"]="New Caledonian",["NE"]="Nigerian",
    ["NF"]="Norfolk Islander",["NG"]="Nigerian",["NI"]="Nicaraguan",["NL"]="Dutch",["NO"]="Norwegian",
    ["NP"]="Nepalese",["NQ"]="Unknown",["NR"]="Nauruan",["NT"]="Unknown",["NU"]="Niuean",
    ["NZ"]="New Zealander",["OM"]="Omani",["PA"]="Panamanian",["PC"]="Unknown",["PE"]="Peruvian",
    ["PF"]="French Polynesian",["PG"]="Papua New Guinean",["PH"]="Filipino",["PK"]="Pakistani",
    ["PL"]="Polish",["PM"]="French",["PN"]="Pitcairn Islander",["PR"]="Puerto Rican",
    ["PS"]="Palestinian",["PT"]="Portuguese",["PU"]="Unknown",["PW"]="Palauan",["PY"]="Paraguayan",
    ["PZ"]="Unknown",["QA"]="Qatari",["RE"]="French",["RO"]="Romanian",["RS"]="Serbian",
    ["RU"]="Russian",["RW"]="Rwandan",["SA"]="Saudi Arabian",["SB"]="Solomon Islander",
    ["SC"]="Seychellois",["SD"]="Sudanese",["SE"]="Swedish",["SG"]="Singaporean",
    ["SH"]="Saint Helenian",["SI"]="Slovene",["SJ"]="Norwegian",["SK"]="Slovak",
    ["SL"]="Sierra Leonean",["SM"]="Sammarinese",["SN"]="Senegalese",["SO"]="Somali",
    ["SR"]="Surinamer",["ST"]="Sao Tomean",["SU"]="Unknown",["SV"]="Salvadoran",["SY"]="Syrian",
    ["SZ"]="Swazi",["TC"]="Turks and Caicos Islander",["TD"]="Chadian",["TF"]="French",
    ["TG"]="Togolese",["TH"]="Thai",["TJ"]="Tadzhik",["TK"]="Tokelauan",["TL"]="East Timorese",
    ["TM"]="Turkmen",["TN"]="Tunisian",["TO"]="Tongan",["TR"]="Turkish",["TT"]="Trinidadian",
    ["TV"]="Tuvaluan",["TW"]="Taiwanese",["TZ"]="Tanzanian",["UA"]="Ukrainian",["UG"]="Ugandan",
    ["UM"]="American",["US"]="American",["UY"]="Uruguayan",["UZ"]="Uzbekistani",["VA"]="Italian",
    ["VC"]="Saint Vincentian",["VD"]="Unknown",["VE"]="Venezuelan",["VG"]="Virgin Islander",
    ["VI"]="Virgin Islander",["VN"]="Vietnamese",["VU"]="Ni-Vanuatu",
    ["WF"]="Wallis and Futuna Islander",["WK"]="Unknown",["WS"]="Samoan",["YE"]="Yemeni",
    ["YT"]="French",["ZA"]="South African",["ZM"]="Zambian",["ZW"]="Zimbabwean",
}

local Themes = {
    Purple   = { Primary=Color3.fromRGB(180,70,220),  Background=Color3.fromRGB(18,15,28),   Sidebar=Color3.fromRGB(25,20,38),   Component=Color3.fromRGB(35,28,50)  },
    Blue     = { Primary=Color3.fromRGB(66,135,245),  Background=Color3.fromRGB(12,17,28),   Sidebar=Color3.fromRGB(18,25,40),   Component=Color3.fromRGB(26,36,55)  },
    Red      = { Primary=Color3.fromRGB(245,66,66),   Background=Color3.fromRGB(22,12,15),   Sidebar=Color3.fromRGB(32,18,22),   Component=Color3.fromRGB(42,26,30)  },
    Green    = { Primary=Color3.fromRGB(60,235,120),  Background=Color3.fromRGB(12,22,17),   Sidebar=Color3.fromRGB(18,32,25),   Component=Color3.fromRGB(25,42,35)  },
    Dark     = { Primary=Color3.fromRGB(220,220,220), Background=Color3.fromRGB(12,12,12),   Sidebar=Color3.fromRGB(20,20,20),   Component=Color3.fromRGB(30,30,30)  },
    Sakura   = { Primary=Color3.fromRGB(255,100,170), Background=Color3.fromRGB(35,16,22),   Sidebar=Color3.fromRGB(46,22,30),   Component=Color3.fromRGB(58,30,40)  },
    Ocean    = { Primary=Color3.fromRGB(0,190,255),   Background=Color3.fromRGB(8,20,35),    Sidebar=Color3.fromRGB(12,30,48),   Component=Color3.fromRGB(18,40,62)  },
    Midnight = { Primary=Color3.fromRGB(110,110,255), Background=Color3.fromRGB(8,8,18),     Sidebar=Color3.fromRGB(13,13,28),   Component=Color3.fromRGB(22,22,42)  },
    Light    = { Primary=Color3.fromRGB(60,60,200),   Background=Color3.fromRGB(238,238,245),Sidebar=Color3.fromRGB(218,218,230),Component=Color3.fromRGB(198,198,212)},
    Cyber    = { Primary=Color3.fromRGB(0,255,200),   Background=Color3.fromRGB(8,16,26),    Sidebar=Color3.fromRGB(12,26,42),   Component=Color3.fromRGB(16,36,56)  },
}

local CurrentTheme = Themes.Purple

local function GetContrastText(bg)
    local lum = bg.R*0.299 + bg.G*0.587 + bg.B*0.114
    return lum > 0.5 and Color3.fromRGB(0,0,0) or Color3.fromRGB(255,255,255)
end

local function Lerp3(a, b, t)
    return Color3.new(a.R+(b.R-a.R)*t, a.G+(b.G-a.G)*t, a.B+(b.B-a.B)*t)
end

local NotifContainer = nil

local function InitNotifGui()
    if NotifContainer and NotifContainer.Parent then return NotifContainer end
    local existing = CoreGui:FindFirstChild("MalWhere_Notifications")
    if existing then existing:Destroy() end

    local gui = Instance.new("ScreenGui", CoreGui)
    gui.Name = "MalWhere_Notifications"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    NotifContainer = Instance.new("Frame", gui)
    NotifContainer.Size = UDim2.new(0, 310, 1, 0)
    NotifContainer.Position = UDim2.new(1, -330, 0, 0)
    NotifContainer.BackgroundTransparency = 1

    local layout = Instance.new("UIListLayout", NotifContainer)
    layout.Padding = UDim.new(0, 10)
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    local pad = Instance.new("UIPadding", NotifContainer)
    pad.PaddingBottom = UDim.new(0, 20)

    return NotifContainer
end

function MalWhere:Notify(options)
    local title       = options.Title or "Notification"
    local description = options.Description or ""
    local duration    = options.Duration or 3
    local notifType   = options.Type or "Info"

    local typeData = {
        Success = { color=Color3.fromRGB(0,210,110),  icon="✔" },
        Error   = { color=Color3.fromRGB(255,75,75),  icon="✖" },
        Info    = { color=Color3.fromRGB(80,155,255), icon="ℹ" },
        Warning = { color=Color3.fromRGB(255,185,0),  icon="⚠" },
    }
    local td          = typeData[notifType] or typeData.Info
    local accentColor = td.color
    local container   = InitNotifGui()

    local Notif = Instance.new("Frame", container)
    Notif.Size = UDim2.new(0, 300, 0, 78)
    Notif.BackgroundColor3 = Lerp3(CurrentTheme.Background, CurrentTheme.Component, 0.5)
    Notif.BackgroundTransparency = 1
    Notif.BorderSizePixel = 0
    Instance.new("UICorner", Notif).CornerRadius = UDim.new(0, 10)

    local NotifBg2 = Instance.new("Frame", Notif)
    NotifBg2.Size = UDim2.new(1, 0, 1, 0)
    NotifBg2.BackgroundColor3 = accentColor
    NotifBg2.BackgroundTransparency = 1
    NotifBg2.BorderSizePixel = 0
    Instance.new("UICorner", NotifBg2).CornerRadius = UDim.new(0, 10)

    local NotifStroke = Instance.new("UIStroke", Notif)
    NotifStroke.Color = accentColor
    NotifStroke.Thickness = 1.2
    NotifStroke.Transparency = 1

    local Accent = Instance.new("Frame", Notif)
    Accent.Size = UDim2.new(0, 3, 1, -18)
    Accent.Position = UDim2.new(0, 10, 0, 9)
    Accent.BackgroundColor3 = accentColor
    Accent.BackgroundTransparency = 1
    Accent.BorderSizePixel = 0
    Instance.new("UICorner", Accent).CornerRadius = UDim.new(1, 0)

    local IconCircle = Instance.new("Frame", Notif)
    IconCircle.Size = UDim2.new(0, 28, 0, 28)
    IconCircle.Position = UDim2.new(0, 20, 0, 12)
    IconCircle.BackgroundColor3 = accentColor
    IconCircle.BackgroundTransparency = 1
    IconCircle.BorderSizePixel = 0
    Instance.new("UICorner", IconCircle).CornerRadius = UDim.new(1, 0)

    local IconLabel = Instance.new("TextLabel", IconCircle)
    IconLabel.Size = UDim2.new(1, 0, 1, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = td.icon
    IconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    IconLabel.TextTransparency = 1
    IconLabel.Font = Enum.Font.GothamBold
    IconLabel.TextSize = 13

    local TitleLabel = Instance.new("TextLabel", Notif)
    TitleLabel.Size = UDim2.new(1, -65, 0, 20)
    TitleLabel.Position = UDim2.new(0, 57, 0, 11)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextTransparency = 1
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 13
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local DescLabel = Instance.new("TextLabel", Notif)
    DescLabel.Size = UDim2.new(1, -65, 0, 28)
    DescLabel.Position = UDim2.new(0, 57, 0, 32)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = description
    DescLabel.TextColor3 = Color3.fromRGB(200, 198, 215)
    DescLabel.TextTransparency = 1
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextSize = 11
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextWrapped = true

    local ProgressBg = Instance.new("Frame", Notif)
    ProgressBg.Size = UDim2.new(1, -20, 0, 2)
    ProgressBg.Position = UDim2.new(0, 10, 1, -7)
    ProgressBg.BackgroundColor3 = Lerp3(CurrentTheme.Background, Color3.new(1,1,1), 0.1)
    ProgressBg.BackgroundTransparency = 1
    ProgressBg.BorderSizePixel = 0
    Instance.new("UICorner", ProgressBg).CornerRadius = UDim.new(1, 0)

    local ProgressFill = Instance.new("Frame", ProgressBg)
    ProgressFill.Size = UDim2.new(1, 0, 1, 0)
    ProgressFill.BackgroundColor3 = accentColor
    ProgressFill.BackgroundTransparency = 1
    ProgressFill.BorderSizePixel = 0
    Instance.new("UICorner", ProgressFill).CornerRadius = UDim.new(1, 0)

    local tweenIn = TweenInfo.new(0.35, Enum.EasingStyle.Quart)
    TweenService:Create(Notif,        tweenIn, {BackgroundTransparency=0.1}):Play()
    TweenService:Create(NotifBg2,     tweenIn, {BackgroundTransparency=0.94}):Play()
    TweenService:Create(NotifStroke,  tweenIn, {Transparency=0.5}):Play()
    TweenService:Create(Accent,       tweenIn, {BackgroundTransparency=0}):Play()
    TweenService:Create(IconCircle,   tweenIn, {BackgroundTransparency=0.15}):Play()
    TweenService:Create(IconLabel,    tweenIn, {TextTransparency=0}):Play()
    TweenService:Create(TitleLabel,   tweenIn, {TextTransparency=0}):Play()
    TweenService:Create(DescLabel,    tweenIn, {TextTransparency=0}):Play()
    TweenService:Create(ProgressBg,   tweenIn, {BackgroundTransparency=0.55}):Play()
    TweenService:Create(ProgressFill, tweenIn, {BackgroundTransparency=0}):Play()
    TweenService:Create(ProgressFill, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size=UDim2.new(0,0,1,0)}):Play()

    task.delay(duration, function()
        if not (Notif and Notif.Parent) then return end
        local tweenOut = TweenInfo.new(0.28, Enum.EasingStyle.Quart)
        local fadeOut  = TweenService:Create(Notif, tweenOut, {BackgroundTransparency=1})
        TweenService:Create(NotifBg2,     tweenOut, {BackgroundTransparency=1}):Play()
        TweenService:Create(NotifStroke,  tweenOut, {Transparency=1}):Play()
        TweenService:Create(Accent,       tweenOut, {BackgroundTransparency=1}):Play()
        TweenService:Create(IconCircle,   tweenOut, {BackgroundTransparency=1}):Play()
        TweenService:Create(IconLabel,    tweenOut, {TextTransparency=1}):Play()
        TweenService:Create(TitleLabel,   tweenOut, {TextTransparency=1}):Play()
        TweenService:Create(DescLabel,    tweenOut, {TextTransparency=1}):Play()
        TweenService:Create(ProgressBg,   tweenOut, {BackgroundTransparency=1}):Play()
        TweenService:Create(ProgressFill, tweenOut, {BackgroundTransparency=1}):Play()
        fadeOut:Play()
        fadeOut.Completed:Once(function()
            if Notif and Notif.Parent then Notif:Destroy() end
        end)
    end)
end

function MalWhere:CreateWindow(titleText, iconImage)
    for _, gui in pairs(CoreGui:GetChildren()) do
        if gui.Name == "MalWhere_Library" then gui:Destroy() end
    end

    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "MalWhere_Library"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Shadow2 = Instance.new("Frame", ScreenGui)
    Shadow2.Size = UDim2.new(0, 598, 0, 393)
    Shadow2.Position = UDim2.new(0.5, -296, 0.5, -193)
    Shadow2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Shadow2.BackgroundTransparency = 0.82
    Shadow2.BorderSizePixel = 0
    Shadow2.ZIndex = 0
    Instance.new("UICorner", Shadow2).CornerRadius = UDim.new(0, 13)

    local Shadow = Instance.new("Frame", ScreenGui)
    Shadow.Size = UDim2.new(0, 594, 0, 389)
    Shadow.Position = UDim2.new(0.5, -295, 0.5, -191)
    Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.BackgroundTransparency = 0.68
    Shadow.BorderSizePixel = 0
    Shadow.ZIndex = 0
    Instance.new("UICorner", Shadow).CornerRadius = UDim.new(0, 12)

    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 590, 0, 385)
    Main.Position = UDim2.new(0.5, -295, 0.5, -192)
    Main.BackgroundColor3 = CurrentTheme.Background
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.ZIndex = 1
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = CurrentTheme.Primary
    MainStroke.Thickness = 1.5
    MainStroke.Transparency = 0.55
    MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local Header = Instance.new("Frame", Main)
    Header.Size = UDim2.new(1, 0, 0, 48)
    Header.BackgroundColor3 = CurrentTheme.Sidebar
    Header.BorderSizePixel = 0
    Header.ZIndex = 2
    Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)

    local HeaderFill = Instance.new("Frame", Header)
    HeaderFill.Size = UDim2.new(1, 0, 0.5, 0)
    HeaderFill.Position = UDim2.new(0, 0, 0.5, 0)
    HeaderFill.BackgroundColor3 = CurrentTheme.Sidebar
    HeaderFill.BorderSizePixel = 0
    HeaderFill.ZIndex = 2

    local HeaderLine = Instance.new("Frame", Header)
    HeaderLine.Size = UDim2.new(1, 0, 0, 1)
    HeaderLine.Position = UDim2.new(0, 0, 1, -1)
    HeaderLine.BackgroundColor3 = CurrentTheme.Primary
    HeaderLine.BackgroundTransparency = 0.45
    HeaderLine.BorderSizePixel = 0
    HeaderLine.ZIndex = 3

    local iconOffsetX = 14
    if iconImage and iconImage ~= "" then
        local HeaderIcon = Instance.new("ImageLabel", Header)
        HeaderIcon.Size = UDim2.new(0, 26, 0, 26)
        HeaderIcon.Position = UDim2.new(0, 14, 0.5, -13)
        HeaderIcon.BackgroundTransparency = 1
        HeaderIcon.Image = iconImage
        HeaderIcon.ZIndex = 3
        iconOffsetX = 48
    end

    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(1, -115, 1, 0)
    Title.Position = UDim2.new(0, iconOffsetX, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = titleText or "MalWhere Library"
    Title.TextColor3 = CurrentTheme.Primary
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 17
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 3

    local CloseBtn = Instance.new("TextButton", Main)
    CloseBtn.Size = UDim2.new(0, 28, 0, 28)
    CloseBtn.Position = UDim2.new(1, -38, 0, 10)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 12
    CloseBtn.ZIndex = 4
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

    local MinBtn = Instance.new("TextButton", Main)
    MinBtn.Size = UDim2.new(0, 28, 0, 28)
    MinBtn.Position = UDim2.new(1, -72, 0, 10)
    MinBtn.BackgroundColor3 = Color3.fromRGB(190, 150, 0)
    MinBtn.BorderSizePixel = 0
    MinBtn.Text = "–"
    MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 15
    MinBtn.ZIndex = 4
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1, 0)

    CloseBtn.MouseEnter:Connect(function() TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundColor3=Color3.fromRGB(255,75,75)}):Play() end)
    CloseBtn.MouseLeave:Connect(function() TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundColor3=Color3.fromRGB(200,50,50)}):Play() end)
    MinBtn.MouseEnter:Connect(function()   TweenService:Create(MinBtn,   TweenInfo.new(0.15), {BackgroundColor3=Color3.fromRGB(255,200,0)}):Play() end)
    MinBtn.MouseLeave:Connect(function()   TweenService:Create(MinBtn,   TweenInfo.new(0.15), {BackgroundColor3=Color3.fromRGB(190,150,0)}):Play() end)

    local MobileToggle = Instance.new("Frame", ScreenGui)
    MobileToggle.Size = UDim2.new(0, 58, 0, 58)
    MobileToggle.Position = UDim2.new(0, 14, 0.5, -29)
    MobileToggle.BackgroundColor3 = CurrentTheme.Primary
    MobileToggle.BorderSizePixel = 0
    MobileToggle.ZIndex = 10
    Instance.new("UICorner", MobileToggle).CornerRadius = UDim.new(1, 0)

    local ToggleStroke = Instance.new("UIStroke", MobileToggle)
    ToggleStroke.Color = CurrentTheme.Primary
    ToggleStroke.Thickness = 2.5
    ToggleStroke.Transparency = 0.4

    local ToggleGlow = Instance.new("Frame", ScreenGui)
    ToggleGlow.Size = UDim2.new(0, 72, 0, 72)
    ToggleGlow.Position = UDim2.new(0, 7, 0.5, -36)
    ToggleGlow.BackgroundColor3 = CurrentTheme.Primary
    ToggleGlow.BackgroundTransparency = 0.78
    ToggleGlow.BorderSizePixel = 0
    ToggleGlow.ZIndex = 9
    Instance.new("UICorner", ToggleGlow).CornerRadius = UDim.new(1, 0)

    if iconImage and iconImage ~= "" then
        local ToggleImg = Instance.new("ImageLabel", MobileToggle)
        ToggleImg.Size = UDim2.new(0, 32, 0, 32)
        ToggleImg.Position = UDim2.new(0.5, -16, 0.5, -16)
        ToggleImg.BackgroundTransparency = 1
        ToggleImg.Image = iconImage
        ToggleImg.ImageColor3 = GetContrastText(CurrentTheme.Primary)
        ToggleImg.ZIndex = 11
    else
        for i = 0, 2 do
            local Line = Instance.new("Frame", MobileToggle)
            Line.Size = UDim2.new(0, 24, 0, 3)
            Line.Position = UDim2.new(0.5, -12, 0, 17 + i*9)
            Line.BackgroundColor3 = GetContrastText(CurrentTheme.Primary)
            Line.BorderSizePixel = 0
            Line.ZIndex = 11
            Instance.new("UICorner", Line).CornerRadius = UDim.new(1, 0)
        end
    end

    local ToggleBtn = Instance.new("TextButton", MobileToggle)
    ToggleBtn.Size = UDim2.new(1, 0, 1, 0)
    ToggleBtn.BackgroundTransparency = 1
    ToggleBtn.Text = ""
    ToggleBtn.ZIndex = 12

    if IsMobile then
        Main.Visible = false
    else
        MobileToggle.Visible = false
        ToggleGlow.Visible = false
    end

    local Sidebar = Instance.new("ScrollingFrame", Main)
    Sidebar.Size = UDim2.new(0, 158, 1, -60)
    Sidebar.Position = UDim2.new(0, 10, 0, 52)
    Sidebar.BackgroundColor3 = CurrentTheme.Sidebar
    Sidebar.BorderSizePixel = 0
    Sidebar.ScrollBarThickness = 3
    Sidebar.ScrollBarImageColor3 = CurrentTheme.Primary
    Sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
    Sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Sidebar.ZIndex = 2
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

    local SidebarStroke = Instance.new("UIStroke", Sidebar)
    SidebarStroke.Color = CurrentTheme.Primary
    SidebarStroke.Thickness = 1
    SidebarStroke.Transparency = 0.8

    local SideLayout = Instance.new("UIListLayout", Sidebar)
    SideLayout.Padding = UDim.new(0, 5)
    SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local SidePad = Instance.new("UIPadding", Sidebar)
    SidePad.PaddingTop    = UDim.new(0, 8)
    SidePad.PaddingBottom = UDim.new(0, 8)

    local TabContainer = Instance.new("Frame", Main)
    TabContainer.Size = UDim2.new(1, -182, 1, -60)
    TabContainer.Position = UDim2.new(0, 178, 0, 52)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ZIndex = 2

    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local dragging, dragInput, dragStart, startPos

    local function updateMainDrag(input)
        if not dragging then return end
        local delta = input.Position - dragStart
        local nx = startPos.X.Offset + delta.X
        local ny = startPos.Y.Offset + delta.Y
        Main.Position    = UDim2.new(startPos.X.Scale, nx, startPos.Y.Scale, ny)
        Shadow.Position  = UDim2.new(startPos.X.Scale, nx-2,  startPos.Y.Scale, ny+3)
        Shadow2.Position = UDim2.new(startPos.X.Scale, nx-4,  startPos.Y.Scale, ny+5)
    end

    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging  = true
            dragStart = input.Position
            startPos  = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)

    Header.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then updateMainDrag(input) end
    end)

    local toggleDragging, toggleDragStart, toggleStartPos = false, nil, nil
    local toggleMoved = false
    local DRAG_THRESHOLD = 6

    ToggleBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            toggleDragging  = true
            toggleMoved     = false
            toggleDragStart = input.Position
            toggleStartPos  = MobileToggle.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then toggleDragging = false end
            end)
        end
    end)

    local toggleMovedConn = UserInputService.InputChanged:Connect(function(input)
        if not toggleDragging then return end
        if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end
        local delta = input.Position - toggleDragStart
        if delta.Magnitude > DRAG_THRESHOLD then toggleMoved = true end
        local nx = toggleStartPos.X.Offset + delta.X
        local ny = toggleStartPos.Y.Offset + delta.Y
        MobileToggle.Position = UDim2.new(toggleStartPos.X.Scale, nx, toggleStartPos.Y.Scale, ny)
        ToggleGlow.Position   = UDim2.new(toggleStartPos.X.Scale, nx-7, toggleStartPos.Y.Scale, ny-7)
    end)

    ToggleBtn.MouseButton1Click:Connect(function()
        if toggleMoved then toggleMoved = false return end
        local nowVisible = not Main.Visible
        Main.Visible = nowVisible
        TweenService:Create(MobileToggle, TweenInfo.new(0.2), {
            BackgroundColor3 = nowVisible and CurrentTheme.Primary or Lerp3(CurrentTheme.Primary, Color3.new(0,0,0), 0.35)
        }):Play()
    end)

    local WindowFuncs = {}
    local FirstTab = true
    local globalConnections = { toggleMovedConn }

    local function TagTheme(element, role)
        element:SetAttribute("ThemeRole", role)
    end

    local function RefreshTheme(element)
        if not element then return end
        local role = element:GetAttribute("ThemeRole")
        if role == "Background" then
            element.BackgroundColor3 = CurrentTheme.Background
        elseif role == "Sidebar" then
            element.BackgroundColor3 = CurrentTheme.Sidebar
            if element:IsA("ScrollingFrame") then element.ScrollBarImageColor3 = CurrentTheme.Primary end
        elseif role == "Component" then
            element.BackgroundColor3 = CurrentTheme.Component
        elseif role == "Primary" then
            if element:IsA("UIStroke") then
                element.Color = CurrentTheme.Primary
            else
                element.BackgroundColor3 = CurrentTheme.Primary
                if element:IsA("TextButton") or element:IsA("TextLabel") then
                    element.TextColor3 = GetContrastText(CurrentTheme.Primary)
                end
            end
        elseif role == "PrimaryText" then
            element.TextColor3 = CurrentTheme.Primary
        elseif role == "PrimaryScrollBar" then
            element.ScrollBarImageColor3 = CurrentTheme.Primary
        elseif role == "PrimaryStroke" then
            if element:IsA("UIStroke") then element.Color = CurrentTheme.Primary
            else element.BackgroundColor3 = CurrentTheme.Primary end
        end
        for _, child in pairs(element:GetChildren()) do RefreshTheme(child) end
    end

    TagTheme(Main, "Background")
    TagTheme(Header, "Sidebar"); TagTheme(HeaderFill, "Sidebar"); TagTheme(HeaderLine, "PrimaryStroke")
    TagTheme(MainStroke, "PrimaryStroke"); TagTheme(Title, "PrimaryText")
    TagTheme(Sidebar, "Sidebar"); TagTheme(SidebarStroke, "PrimaryStroke")
    TagTheme(MobileToggle, "Primary"); TagTheme(ToggleGlow, "Primary"); TagTheme(ToggleStroke, "PrimaryStroke")

    local MinPill = Instance.new("Frame", ScreenGui)
    MinPill.Size = UDim2.new(0, 46, 0, 46)
    MinPill.Position = UDim2.new(0.5, -23, 0, 60)
    MinPill.BackgroundColor3 = CurrentTheme.Sidebar
    MinPill.BorderSizePixel = 0
    MinPill.Visible = false
    MinPill.ZIndex = 20
    Instance.new("UICorner", MinPill).CornerRadius = UDim.new(0, 12)
    TagTheme(MinPill, "Sidebar")

    local MinPillStroke = Instance.new("UIStroke", MinPill)
    MinPillStroke.Color = CurrentTheme.Primary
    MinPillStroke.Thickness = 1.5
    MinPillStroke.Transparency = 0.4
    TagTheme(MinPillStroke, "PrimaryStroke")

    if iconImage and iconImage ~= "" then
        local PillIcon = Instance.new("ImageLabel", MinPill)
        PillIcon.Size = UDim2.new(0, 28, 0, 28)
        PillIcon.Position = UDim2.new(0.5, -14, 0.5, -14)
        PillIcon.BackgroundTransparency = 1
        PillIcon.Image = iconImage
        PillIcon.ZIndex = 21
    else
        local PillText = Instance.new("TextLabel", MinPill)
        PillText.Size = UDim2.new(1, 0, 1, 0)
        PillText.BackgroundTransparency = 1
        PillText.Text = "M"
        PillText.TextColor3 = CurrentTheme.Primary
        PillText.Font = Enum.Font.GothamBold
        PillText.TextSize = 16
        PillText.ZIndex = 21
        TagTheme(PillText, "PrimaryText")
    end

    local PillBtn = Instance.new("TextButton", MinPill)
    PillBtn.Size = UDim2.new(1, 0, 1, 0)
    PillBtn.BackgroundTransparency = 1
    PillBtn.Text = ""
    PillBtn.ZIndex = 22

    local pillDragging, pillDragStart, pillStartPos, pillMoved = false, nil, nil, false

    PillBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            pillDragging  = true
            pillMoved     = false
            pillDragStart = input.Position
            pillStartPos  = MinPill.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then pillDragging = false end
            end)
        end
    end)

    local pillDragConn = UserInputService.InputChanged:Connect(function(input)
        if not pillDragging then return end
        if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end
        local delta = input.Position - pillDragStart
        if delta.Magnitude > 6 then pillMoved = true end
        MinPill.Position = UDim2.new(pillStartPos.X.Scale, pillStartPos.X.Offset+delta.X, pillStartPos.Y.Scale, pillStartPos.Y.Offset+delta.Y)
    end)
    table.insert(globalConnections, pillDragConn)

    PillBtn.MouseButton1Click:Connect(function()
        if pillMoved then pillMoved = false return end
        MinPill.Visible = false
        Main.Visible = true
        TweenService:Create(Shadow,  TweenInfo.new(0.25), {BackgroundTransparency=0.68}):Play()
        TweenService:Create(Shadow2, TweenInfo.new(0.25), {BackgroundTransparency=0.82}):Play()
        Sidebar.Visible = true
        TabContainer.Visible = true
    end)

    PillBtn.MouseEnter:Connect(function()
        TweenService:Create(MinPill,       TweenInfo.new(0.15), {BackgroundColor3=Lerp3(CurrentTheme.Sidebar, CurrentTheme.Primary, 0.18)}):Play()
        TweenService:Create(MinPillStroke, TweenInfo.new(0.15), {Transparency=0.08}):Play()
    end)
    PillBtn.MouseLeave:Connect(function()
        TweenService:Create(MinPill,       TweenInfo.new(0.15), {BackgroundColor3=CurrentTheme.Sidebar}):Play()
        TweenService:Create(MinPillStroke, TweenInfo.new(0.15), {Transparency=0.4}):Play()
    end)

    MinBtn.MouseButton1Click:Connect(function()
        TweenService:Create(Shadow,  TweenInfo.new(0.18), {BackgroundTransparency=1}):Play()
        TweenService:Create(Shadow2, TweenInfo.new(0.18), {BackgroundTransparency=1}):Play()
        local shrink = TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Size=UDim2.new(0,590,0,0)})
        shrink:Play()
        shrink.Completed:Once(function()
            Main.Visible = false
            Main.Size = UDim2.new(0, 590, 0, 385)
        end)
        MinPill.Position = UDim2.new(0.5, -23, 0, 60)
        MinPill.BackgroundTransparency = 1
        MinPillStroke.Transparency = 1
        MinPill.Visible = true
        TweenService:Create(MinPill,       TweenInfo.new(0.3, Enum.EasingStyle.Back), {BackgroundTransparency=0}):Play()
        TweenService:Create(MinPillStroke, TweenInfo.new(0.3),                        {Transparency=0.4}):Play()
    end)

    function WindowFuncs:SetTheme(themeName)
        if not Themes[themeName] then return end
        CurrentTheme = Themes[themeName]
        RefreshTheme(Main)
        RefreshTheme(MobileToggle)
        RefreshTheme(ToggleGlow)
        RefreshTheme(MinPill)
    end

    function WindowFuncs:Toggle()
        Main.Visible = not Main.Visible
    end

    function WindowFuncs:Destroy()
        for _, conn in pairs(globalConnections) do
            if conn then conn:Disconnect() end
        end
        globalConnections = {}
        ScreenGui:Destroy()
    end

    function WindowFuncs:CreateTab(name, tabIcon)
        local TabContent = Instance.new("ScrollingFrame", TabContainer)
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.Visible = false
        TabContent.ScrollBarThickness = 3
        TabContent.ScrollBarImageColor3 = CurrentTheme.Primary
        TabContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
        TagTheme(TabContent, "PrimaryScrollBar")

        local ContentLayout = Instance.new("UIListLayout", TabContent)
        ContentLayout.Padding = UDim.new(0, 7)
        ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local ContentPad = Instance.new("UIPadding", TabContent)
        ContentPad.PaddingLeft   = UDim.new(0, 4)
        ContentPad.PaddingRight  = UDim.new(0, 4)
        ContentPad.PaddingTop    = UDim.new(0, 4)
        ContentPad.PaddingBottom = UDim.new(0, 12)

        local TabBtn = Instance.new("TextButton", Sidebar)
        TabBtn.Size = UDim2.new(0, 142, 0, 36)
        TabBtn.BackgroundColor3 = CurrentTheme.Background
        TabBtn.BorderSizePixel = 0
        TabBtn.Text = (tabIcon and (tabIcon.."  ") or "")..name
        TabBtn.TextColor3 = Color3.fromRGB(155, 150, 170)
        TabBtn.Font = Enum.Font.GothamBold
        TabBtn.TextSize = 13
        TabBtn.ZIndex = 3
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 7)
        TagTheme(TabBtn, "Background")

        local ActiveBar = Instance.new("Frame", TabBtn)
        ActiveBar.Size = UDim2.new(0, 3, 0, 16)
        ActiveBar.Position = UDim2.new(0, 0, 0.5, -8)
        ActiveBar.BackgroundColor3 = CurrentTheme.Primary
        ActiveBar.BackgroundTransparency = 1
        ActiveBar.BorderSizePixel = 0
        ActiveBar.ZIndex = 4
        Instance.new("UICorner", ActiveBar).CornerRadius = UDim.new(1, 0)
        TagTheme(ActiveBar, "Primary")

        local function setActive(on)
            if on then
                TweenService:Create(TabBtn,    TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundColor3=Lerp3(CurrentTheme.Background, CurrentTheme.Primary, 0.2), TextColor3=CurrentTheme.Primary}):Play()
                TweenService:Create(ActiveBar, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundTransparency=0}):Play()
            else
                TweenService:Create(TabBtn,    TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundColor3=CurrentTheme.Background, TextColor3=Color3.fromRGB(155,150,170)}):Play()
                TweenService:Create(ActiveBar, TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundTransparency=1}):Play()
            end
        end

        if FirstTab then FirstTab = false; TabContent.Visible = true; setActive(true) end

        TabBtn.MouseButton1Click:Connect(function()
            for _, v in pairs(TabContainer:GetChildren()) do
                if v:IsA("ScrollingFrame") then v.Visible = false end
            end
            for _, v in pairs(Sidebar:GetChildren()) do
                if v:IsA("TextButton") then
                    TweenService:Create(v, TweenInfo.new(0.2), {BackgroundColor3=CurrentTheme.Background, TextColor3=Color3.fromRGB(155,150,170)}):Play()
                    local bar = v:FindFirstChildWhichIsA("Frame")
                    if bar then TweenService:Create(bar, TweenInfo.new(0.2), {BackgroundTransparency=1}):Play() end
                end
            end
            TabContent.Visible = true
            setActive(true)
        end)

        TabBtn.MouseEnter:Connect(function()
            if TabContent.Visible then return end
            TweenService:Create(TabBtn, TweenInfo.new(0.15), {BackgroundColor3=Lerp3(CurrentTheme.Background, CurrentTheme.Primary, 0.08)}):Play()
        end)
        TabBtn.MouseLeave:Connect(function()
            if TabContent.Visible then return end
            TweenService:Create(TabBtn, TweenInfo.new(0.15), {BackgroundColor3=CurrentTheme.Background}):Play()
        end)

        local TabFuncs = {}
        local order = 0

        function TabFuncs:CreateInfo()
            order = order + 1
            local lp = Players.LocalPlayer

            local InfoFrame = Instance.new("Frame", TabContent)
            InfoFrame.LayoutOrder = order
            InfoFrame.Size = UDim2.new(1, 0, 0, 205)
            InfoFrame.BackgroundColor3 = CurrentTheme.Component
            InfoFrame.BorderSizePixel = 0
            Instance.new("UICorner", InfoFrame).CornerRadius = UDim.new(0, 10)
            TagTheme(InfoFrame, "Component")

            local InfoStroke = Instance.new("UIStroke", InfoFrame)
            InfoStroke.Color = CurrentTheme.Primary
            InfoStroke.Thickness = 1
            InfoStroke.Transparency = 0.75
            TagTheme(InfoStroke, "PrimaryStroke")

            local Avatar = Instance.new("ImageLabel", InfoFrame)
            Avatar.Size = UDim2.new(0, 68, 0, 68)
            Avatar.Position = UDim2.new(0, 14, 0, 14)
            Avatar.BackgroundColor3 = CurrentTheme.Background
            Avatar.BorderSizePixel = 0
            Instance.new("UICorner", Avatar).CornerRadius = UDim.new(0, 10)
            TagTheme(Avatar, "Background")

            local AvatarRing = Instance.new("UIStroke", Avatar)
            AvatarRing.Color = CurrentTheme.Primary
            AvatarRing.Thickness = 2
            AvatarRing.Transparency = 0.3
            TagTheme(AvatarRing, "PrimaryStroke")

            task.spawn(function()
                local ok, img = pcall(function()
                    return Players:GetUserThumbnailAsync(lp.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
                end)
                Avatar.Image = ok and img or "rbxassetid://0"
            end)

            local Username = Instance.new("TextLabel", InfoFrame)
            Username.Size = UDim2.new(1, -100, 0, 22)
            Username.Position = UDim2.new(0, 92, 0, 14)
            Username.BackgroundTransparency = 1
            Username.Text = "@"..lp.Name
            Username.TextColor3 = Color3.fromRGB(255, 255, 255)
            Username.Font = Enum.Font.GothamBold
            Username.TextSize = 15
            Username.TextXAlignment = Enum.TextXAlignment.Left

            local DisplayName = Instance.new("TextLabel", InfoFrame)
            DisplayName.Size = UDim2.new(1, -100, 0, 18)
            DisplayName.Position = UDim2.new(0, 92, 0, 38)
            DisplayName.BackgroundTransparency = 1
            DisplayName.Text = lp.DisplayName
            DisplayName.TextColor3 = Color3.fromRGB(155, 150, 170)
            DisplayName.Font = Enum.Font.Gotham
            DisplayName.TextSize = 12
            DisplayName.TextXAlignment = Enum.TextXAlignment.Left

            local NationalityLabel = Instance.new("TextLabel", InfoFrame)
            NationalityLabel.Size = UDim2.new(1, -100, 0, 18)
            NationalityLabel.Position = UDim2.new(0, 92, 0, 58)
            NationalityLabel.BackgroundTransparency = 1
            NationalityLabel.Text = "🌐 Loading..."
            NationalityLabel.TextColor3 = Color3.fromRGB(155, 150, 170)
            NationalityLabel.Font = Enum.Font.Gotham
            NationalityLabel.TextSize = 12
            NationalityLabel.TextXAlignment = Enum.TextXAlignment.Left

            task.spawn(function()
                local ok, country = pcall(function()
                    return LocalizationService:GetCountryRegionForPlayerAsync(lp)
                end)
                NationalityLabel.Text = "🌐 "..(( ok and country and CountryToNationality[country]) or "Unknown")
            end)

            local Divider = Instance.new("Frame", InfoFrame)
            Divider.Size = UDim2.new(1, -28, 0, 1)
            Divider.Position = UDim2.new(0, 14, 0, 95)
            Divider.BackgroundColor3 = CurrentTheme.Primary
            Divider.BackgroundTransparency = 0.7
            Divider.BorderSizePixel = 0
            TagTheme(Divider, "Primary")

            local function infoLine(icon, y)
                local lbl = Instance.new("TextLabel", InfoFrame)
                lbl.Size = UDim2.new(1, -28, 0, 18)
                lbl.Position = UDim2.new(0, 14, 0, y)
                lbl.BackgroundTransparency = 1
                lbl.TextColor3 = Color3.fromRGB(185, 182, 200)
                lbl.Font = Enum.Font.Gotham
                lbl.TextSize = 12
                lbl.TextXAlignment = Enum.TextXAlignment.Left
                lbl.Text = icon.." Loading..."
                return lbl
            end

            local TimeLabel     = infoLine("⏳", 104)
            local ExecutorLabel = infoLine("⚙️", 126)
            local CreationLabel = infoLine("📅", 148)

            CreationLabel.Text = "📅 "..os.date("%Y-%m-%d", os.time() - (lp.AccountAge * 86400))

            local execName = "Unknown"
            local ok, res = pcall(identifyexecutor)
            if ok and res then execName = res
            else
                local ok2, res2 = pcall(getexecutorname)
                if ok2 and res2 then execName = res2
                elseif syn then execName = "Synapse"
                elseif KRNL_LOADED then execName = "KRNL"
                elseif fluxus then execName = "Fluxus" end
            end
            ExecutorLabel.Text = "⚙️ "..execName

            local timeConn
            timeConn = RunService.Heartbeat:Connect(function()
                if not InfoFrame.Parent then timeConn:Disconnect() return end
                local t = workspace.DistributedGameTime
                TimeLabel.Text = string.format("⏳ %02d:%02d:%02d", math.floor(t/3600), math.floor((t%3600)/60), math.floor(t%60))
            end)
            table.insert(globalConnections, timeConn)

            local InfoBtnContainer = Instance.new("Frame", InfoFrame)
            InfoBtnContainer.Size = UDim2.new(1, -28, 0, 32)
            InfoBtnContainer.Position = UDim2.new(0, 14, 0, 170)
            InfoBtnContainer.BackgroundTransparency = 1

            local IBLayout = Instance.new("UIListLayout", InfoBtnContainer)
            IBLayout.FillDirection = Enum.FillDirection.Horizontal
            IBLayout.Padding = UDim.new(0, 8)

            local InfoFuncs = {}
            function InfoFuncs:AddButton(btnText, callback)
                local SBtn = Instance.new("TextButton", InfoBtnContainer)
                SBtn.Size = UDim2.new(0, 95, 1, 0)
                SBtn.BackgroundColor3 = CurrentTheme.Background
                SBtn.BorderSizePixel = 0
                SBtn.Text = btnText
                SBtn.TextColor3 = CurrentTheme.Primary
                SBtn.Font = Enum.Font.GothamBold
                SBtn.TextSize = 12
                Instance.new("UICorner", SBtn).CornerRadius = UDim.new(0, 6)
                TagTheme(SBtn, "Background")
                SBtn.MouseButton1Click:Connect(function() pcall(callback) end)
            end
            return InfoFuncs
        end

        local function applyComponentStyle(frame, strokeTransp)
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
            TagTheme(frame, "Component")
            local s = Instance.new("UIStroke", frame)
            s.Color = CurrentTheme.Primary
            s.Thickness = 1
            s.Transparency = strokeTransp or 0.88
            TagTheme(s, "PrimaryStroke")
            return s
        end

        function TabFuncs:CreateButton(text, callback)
            order = order + 1
            local Btn = Instance.new("TextButton", TabContent)
            Btn.LayoutOrder = order
            Btn.Size = UDim2.new(1, 0, 0, 40)
            Btn.BackgroundColor3 = CurrentTheme.Component
            Btn.BorderSizePixel = 0
            Btn.Text = "  "..text
            Btn.TextColor3 = Color3.fromRGB(228, 225, 242)
            Btn.TextXAlignment = Enum.TextXAlignment.Left
            Btn.Font = Enum.Font.GothamBold
            Btn.TextSize = 13
            local stroke = applyComponentStyle(Btn)

            Btn.MouseEnter:Connect(function()
                TweenService:Create(Btn,    TweenInfo.new(0.15), {BackgroundColor3=Lerp3(CurrentTheme.Component, CurrentTheme.Primary, 0.15)}):Play()
                TweenService:Create(stroke, TweenInfo.new(0.15), {Transparency=0.5}):Play()
            end)
            Btn.MouseLeave:Connect(function()
                TweenService:Create(Btn,    TweenInfo.new(0.15), {BackgroundColor3=CurrentTheme.Component}):Play()
                TweenService:Create(stroke, TweenInfo.new(0.15), {Transparency=0.88}):Play()
            end)
            Btn.MouseButton1Click:Connect(function()
                TweenService:Create(Btn, TweenInfo.new(0.08), {BackgroundColor3=Lerp3(CurrentTheme.Component, CurrentTheme.Primary, 0.32)}):Play()
                task.delay(0.1, function() TweenService:Create(Btn, TweenInfo.new(0.18), {BackgroundColor3=CurrentTheme.Component}):Play() end)
                pcall(callback)
            end)
        end

        function TabFuncs:CreateToggle(text, callback)
            order = order + 1
            local toggled = false

            local TogFrame = Instance.new("TextButton", TabContent)
            TogFrame.LayoutOrder = order
            TogFrame.Size = UDim2.new(1, 0, 0, 40)
            TogFrame.BackgroundColor3 = CurrentTheme.Component
            TogFrame.BorderSizePixel = 0
            TogFrame.Text = "  "..text
            TogFrame.TextColor3 = Color3.fromRGB(228, 225, 242)
            TogFrame.TextXAlignment = Enum.TextXAlignment.Left
            TogFrame.Font = Enum.Font.GothamBold
            TogFrame.TextSize = 13
            local stroke = applyComponentStyle(TogFrame)

            local Ind = Instance.new("Frame", TogFrame)
            Ind.Size = UDim2.new(0, 38, 0, 20)
            Ind.Position = UDim2.new(1, -48, 0.5, -10)
            Ind.BackgroundColor3 = Color3.fromRGB(42, 35, 58)
            Ind.BorderSizePixel = 0
            Instance.new("UICorner", Ind).CornerRadius = UDim.new(1, 0)

            local Dot = Instance.new("Frame", Ind)
            Dot.Size = UDim2.new(0, 14, 0, 14)
            Dot.Position = UDim2.new(0, 3, 0.5, -7)
            Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Dot.BorderSizePixel = 0
            Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

            TogFrame.MouseButton1Click:Connect(function()
                toggled = not toggled
                local tPos = toggled and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7)
                local tCol = toggled and CurrentTheme.Primary or Color3.fromRGB(42,35,58)
                TweenService:Create(Dot,    TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Position=tPos}):Play()
                TweenService:Create(Ind,    TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundColor3=tCol}):Play()
                TweenService:Create(stroke, TweenInfo.new(0.2),                         {Transparency=toggled and 0.42 or 0.88}):Play()
                pcall(callback, toggled)
            end)

            return {
                Set = function(self, v)
                    toggled = v
                    local tPos = toggled and UDim2.new(1,-17,0.5,-7) or UDim2.new(0,3,0.5,-7)
                    local tCol = toggled and CurrentTheme.Primary or Color3.fromRGB(42,35,58)
                    TweenService:Create(Dot,    TweenInfo.new(0.2, Enum.EasingStyle.Quart), {Position=tPos}):Play()
                    TweenService:Create(Ind,    TweenInfo.new(0.2, Enum.EasingStyle.Quart), {BackgroundColor3=tCol}):Play()
                    TweenService:Create(stroke, TweenInfo.new(0.2),                         {Transparency=toggled and 0.42 or 0.88}):Play()
                end
            }
        end

        function TabFuncs:CreateDropdown(text, list, callback)
            order = order + 1
            local dropped = false
            local selected = "Select..."

            local DropFrame = Instance.new("Frame", TabContent)
            DropFrame.LayoutOrder = order
            DropFrame.Size = UDim2.new(1, 0, 0, 40)
            DropFrame.BackgroundColor3 = CurrentTheme.Component
            DropFrame.BorderSizePixel = 0
            DropFrame.ClipsDescendants = true
            DropFrame.ZIndex = 2
            local stroke = applyComponentStyle(DropFrame)

            local DropBtn = Instance.new("TextButton", DropFrame)
            DropBtn.Size = UDim2.new(1, 0, 0, 40)
            DropBtn.BackgroundTransparency = 1
            DropBtn.BorderSizePixel = 0
            DropBtn.Text = "  "..text.."  :  "..selected
            DropBtn.TextColor3 = Color3.fromRGB(228, 225, 242)
            DropBtn.TextXAlignment = Enum.TextXAlignment.Left
            DropBtn.Font = Enum.Font.GothamBold
            DropBtn.TextSize = 13
            DropBtn.ZIndex = 2

            local Arrow = Instance.new("TextLabel", DropBtn)
            Arrow.Size = UDim2.new(0, 30, 0, 40)
            Arrow.Position = UDim2.new(1, -34, 0, 0)
            Arrow.BackgroundTransparency = 1
            Arrow.Text = "▾"
            Arrow.TextColor3 = CurrentTheme.Primary
            Arrow.Font = Enum.Font.GothamBold
            Arrow.TextSize = 14
            Arrow.ZIndex = 2
            TagTheme(Arrow, "PrimaryText")

            local ListHolder = Instance.new("ScrollingFrame", DropFrame)
            ListHolder.Size = UDim2.new(1, 0, 0, 0)
            ListHolder.Position = UDim2.new(0, 0, 0, 40)
            ListHolder.BackgroundTransparency = 1
            ListHolder.ZIndex = 2
            ListHolder.ScrollBarThickness = 3
            ListHolder.ScrollBarImageColor3 = CurrentTheme.Primary
            ListHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            TagTheme(ListHolder, "PrimaryScrollBar")

            local ListLayout = Instance.new("UIListLayout", ListHolder)
            ListLayout.Padding = UDim.new(0, 4)
            ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

            local ListPad = Instance.new("UIPadding", ListHolder)
            ListPad.PaddingTop = UDim.new(0, 4)

            local function updateDrop()
                local listH = ListLayout.AbsoluteContentSize.Y + 12
                local target = dropped and (40+listH) or 40
                Arrow.Text = dropped and "▴" or "▾"
                if dropped then ListHolder.Size = UDim2.new(1, 0, 0, listH) end
                TweenService:Create(DropFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size=UDim2.new(1,0,0,target)}):Play()
                TweenService:Create(stroke,    TweenInfo.new(0.2), {Transparency=dropped and 0.48 or 0.88}):Play()
            end

            local function makeItem(v)
                local Item = Instance.new("TextButton", ListHolder)
                Item.Size = UDim2.new(1, -12, 0, 28)
                Item.BackgroundColor3 = CurrentTheme.Background
                Item.BorderSizePixel = 0
                Item.Text = "  "..v
                Item.TextColor3 = Color3.fromRGB(185, 182, 200)
                Item.Font = Enum.Font.GothamBold
                Item.TextSize = 12
                Item.TextXAlignment = Enum.TextXAlignment.Left
                Item.ZIndex = 2
                Instance.new("UICorner", Item).CornerRadius = UDim.new(0, 6)
                TagTheme(Item, "Background")
                Item.MouseEnter:Connect(function() TweenService:Create(Item, TweenInfo.new(0.12), {BackgroundColor3=Lerp3(CurrentTheme.Background, CurrentTheme.Primary, 0.16)}):Play() end)
                Item.MouseLeave:Connect(function()  TweenService:Create(Item, TweenInfo.new(0.12), {BackgroundColor3=CurrentTheme.Background}):Play() end)
                Item.MouseButton1Click:Connect(function()
                    selected = v
                    DropBtn.Text = "  "..text.."  :  "..v
                    dropped = false
                    updateDrop()
                    pcall(callback, v)
                end)
            end

            DropBtn.MouseButton1Click:Connect(function() dropped = not dropped; updateDrop() end)
            for _, v in pairs(list) do makeItem(v) end

            return {
                AddItem    = function(self, item) makeItem(item) end,
                SetSelected = function(self, v) selected = v; DropBtn.Text = "  "..text.."  :  "..v end,
            }
        end

        function TabFuncs:CreateSlider(text, min, max, default, callback, increment)
            order = order + 1
            increment = increment or 0
            if increment == 0 then
                local range = max - min
                increment = range <= 1 and 0.01 or range <= 10 and 0.1 or 1
            end

            local SliderFrame = Instance.new("Frame", TabContent)
            SliderFrame.LayoutOrder = order
            SliderFrame.Size = UDim2.new(1, 0, 0, 58)
            SliderFrame.BackgroundColor3 = CurrentTheme.Component
            SliderFrame.BorderSizePixel = 0
            local stroke = applyComponentStyle(SliderFrame)

            local Label = Instance.new("TextLabel", SliderFrame)
            Label.Size = UDim2.new(1, -10, 0, 20)
            Label.Position = UDim2.new(0, 12, 0, 6)
            Label.BackgroundTransparency = 1
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(228, 225, 242)
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Font = Enum.Font.GothamBold
            Label.TextSize = 13

            local ValueLabel = Instance.new("TextLabel", SliderFrame)
            ValueLabel.Size = UDim2.new(0, 55, 0, 20)
            ValueLabel.Position = UDim2.new(1, -62, 0, 6)
            ValueLabel.BackgroundTransparency = 1
            ValueLabel.TextColor3 = CurrentTheme.Primary
            ValueLabel.Font = Enum.Font.GothamBold
            ValueLabel.TextSize = 13
            ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
            TagTheme(ValueLabel, "PrimaryText")

            local function fmt(v)
                if increment < 1 then
                    return string.format("%."..math.max(0, math.ceil(-math.log10(increment))).."f", v)
                end
                return tostring(math.floor(v))
            end
            ValueLabel.Text = fmt(default)

            local Bar = Instance.new("Frame", SliderFrame)
            Bar.Size = UDim2.new(1, -24, 0, 5)
            Bar.Position = UDim2.new(0, 12, 0, 37)
            Bar.BackgroundColor3 = Lerp3(CurrentTheme.Component, Color3.new(1,1,1), 0.09)
            Bar.BorderSizePixel = 0
            Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

            local Fill = Instance.new("Frame", Bar)
            Fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
            Fill.BackgroundColor3 = CurrentTheme.Primary
            Fill.BorderSizePixel = 0
            Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)
            TagTheme(Fill, "Primary")

            local Knob = Instance.new("Frame", Fill)
            Knob.Size = UDim2.new(0, 13, 0, 13)
            Knob.Position = UDim2.new(1, -6, 0.5, -6)
            Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Knob.BorderSizePixel = 0
            Instance.new("UICorner", Knob).CornerRadius = UDim.new(1, 0)

            local KnobStroke = Instance.new("UIStroke", Knob)
            KnobStroke.Color = CurrentTheme.Primary
            KnobStroke.Thickness = 2
            KnobStroke.Transparency = 0.35
            TagTheme(KnobStroke, "PrimaryStroke")

            local sliderDragging = false

            local function update(input)
                local pos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
                local val = math.clamp(math.floor((min+(max-min)*pos)/increment+0.5)*increment, min, max)
                TweenService:Create(Fill, TweenInfo.new(0.07), {Size=UDim2.new((val-min)/(max-min),0,1,0)}):Play()
                ValueLabel.Text = fmt(val)
                pcall(callback, val)
            end

            SliderFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    sliderDragging = true
                    TweenService:Create(Knob,   TweenInfo.new(0.1), {Size=UDim2.new(0,16,0,16), Position=UDim2.new(1,-8,0.5,-8)}):Play()
                    TweenService:Create(stroke, TweenInfo.new(0.1), {Transparency=0.45}):Play()
                    update(input)
                end
            end)

            local chConn = UserInputService.InputChanged:Connect(function(input)
                if sliderDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    update(input)
                end
            end)

            local endConn = UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    sliderDragging = false
                    TweenService:Create(Knob,   TweenInfo.new(0.1), {Size=UDim2.new(0,13,0,13), Position=UDim2.new(1,-6,0.5,-6)}):Play()
                    TweenService:Create(stroke, TweenInfo.new(0.1), {Transparency=0.88}):Play()
                end
            end)

            table.insert(globalConnections, chConn)
            table.insert(globalConnections, endConn)

            return {
                SetValue = function(self, v)
                    v = math.clamp(v, min, max)
                    TweenService:Create(Fill, TweenInfo.new(0.1), {Size=UDim2.new((v-min)/(max-min),0,1,0)}):Play()
                    ValueLabel.Text = fmt(v)
                end
            }
        end

        function TabFuncs:CreateKeybind(text, defaultKey, callback)
            order = order + 1
            local currentKey = defaultKey or Enum.KeyCode.E
            local binding = false

            local KeyFrame = Instance.new("TextButton", TabContent)
            KeyFrame.LayoutOrder = order
            KeyFrame.Size = UDim2.new(1, 0, 0, 40)
            KeyFrame.BackgroundColor3 = CurrentTheme.Component
            KeyFrame.BorderSizePixel = 0
            KeyFrame.Text = "  "..text
            KeyFrame.TextColor3 = Color3.fromRGB(228, 225, 242)
            KeyFrame.TextXAlignment = Enum.TextXAlignment.Left
            KeyFrame.Font = Enum.Font.GothamBold
            KeyFrame.TextSize = 13
            local stroke = applyComponentStyle(KeyFrame)

            local KeyBadge = Instance.new("TextLabel", KeyFrame)
            KeyBadge.Size = UDim2.new(0, 65, 0, 24)
            KeyBadge.Position = UDim2.new(1, -74, 0.5, -12)
            KeyBadge.BackgroundColor3 = CurrentTheme.Background
            KeyBadge.BorderSizePixel = 0
            KeyBadge.Text = currentKey.Name
            KeyBadge.TextColor3 = CurrentTheme.Primary
            KeyBadge.Font = Enum.Font.GothamBold
            KeyBadge.TextSize = 12
            Instance.new("UICorner", KeyBadge).CornerRadius = UDim.new(0, 5)
            TagTheme(KeyBadge, "Background")

            local BadgeStroke = Instance.new("UIStroke", KeyBadge)
            BadgeStroke.Color = CurrentTheme.Primary
            BadgeStroke.Thickness = 1
            BadgeStroke.Transparency = 0.55
            TagTheme(BadgeStroke, "PrimaryStroke")

            KeyFrame.MouseButton1Click:Connect(function()
                if binding then return end
                binding = true
                KeyBadge.Text = "..."
                KeyBadge.TextColor3 = Color3.fromRGB(255, 215, 70)
                TweenService:Create(stroke, TweenInfo.new(0.15), {Transparency=0.3}):Play()
            end)

            local keybindConn
            keybindConn = UserInputService.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if binding and input.UserInputType == Enum.UserInputType.Keyboard then
                    currentKey = input.KeyCode
                    KeyBadge.Text = currentKey.Name
                    KeyBadge.TextColor3 = CurrentTheme.Primary
                    TweenService:Create(stroke, TweenInfo.new(0.15), {Transparency=0.88}):Play()
                    binding = false
                elseif not binding and input.KeyCode == currentKey then
                    pcall(callback)
                end
            end)
            table.insert(globalConnections, keybindConn)

            return { Destroy = function(self) keybindConn:Disconnect() end }
        end

        function TabFuncs:CreateColorPicker(text, defaultColor, callback)
            order = order + 1
            local currentColor = defaultColor or Color3.fromRGB(255, 255, 255)
            local pickerOpen = false

            local ColorFrame = Instance.new("TextButton", TabContent)
            ColorFrame.LayoutOrder = order
            ColorFrame.Size = UDim2.new(1, 0, 0, 40)
            ColorFrame.BackgroundColor3 = CurrentTheme.Component
            ColorFrame.BorderSizePixel = 0
            ColorFrame.Text = "  "..text
            ColorFrame.TextColor3 = Color3.fromRGB(228, 225, 242)
            ColorFrame.TextXAlignment = Enum.TextXAlignment.Left
            ColorFrame.Font = Enum.Font.GothamBold
            ColorFrame.TextSize = 13
            ColorFrame.ClipsDescendants = true
            local stroke = applyComponentStyle(ColorFrame)

            local ColorPreview = Instance.new("Frame", ColorFrame)
            ColorPreview.Size = UDim2.new(0, 28, 0, 22)
            ColorPreview.Position = UDim2.new(1, -38, 0.5, -11)
            ColorPreview.BackgroundColor3 = currentColor
            ColorPreview.BorderSizePixel = 0
            Instance.new("UICorner", ColorPreview).CornerRadius = UDim.new(0, 5)

            local PreviewStroke = Instance.new("UIStroke", ColorPreview)
            PreviewStroke.Color = Color3.fromRGB(255, 255, 255)
            PreviewStroke.Thickness = 1
            PreviewStroke.Transparency = 0.65

            local PaletteWrap = Instance.new("Frame", ColorFrame)
            PaletteWrap.Size = UDim2.new(1, -16, 0, 0)
            PaletteWrap.Position = UDim2.new(0, 8, 0, 46)
            PaletteWrap.BackgroundColor3 = CurrentTheme.Background
            PaletteWrap.BorderSizePixel = 0
            PaletteWrap.ClipsDescendants = true
            Instance.new("UICorner", PaletteWrap).CornerRadius = UDim.new(0, 7)
            TagTheme(PaletteWrap, "Background")

            local PaletteGrid = Instance.new("Frame", PaletteWrap)
            PaletteGrid.Size = UDim2.new(1, -12, 0, 0)
            PaletteGrid.Position = UDim2.new(0, 6, 0, 6)
            PaletteGrid.BackgroundTransparency = 1
            PaletteGrid.AutomaticSize = Enum.AutomaticSize.Y

            local GridLayout = Instance.new("UIGridLayout", PaletteGrid)
            GridLayout.CellSize = UDim2.new(0, 26, 0, 26)
            GridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
            GridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
            GridLayout.SortOrder = Enum.SortOrder.LayoutOrder

            local palColors = {
                Color3.fromRGB(255,0,0),     Color3.fromRGB(255,80,0),    Color3.fromRGB(255,165,0),
                Color3.fromRGB(255,215,0),   Color3.fromRGB(200,255,0),   Color3.fromRGB(0,255,0),
                Color3.fromRGB(0,255,130),   Color3.fromRGB(0,255,255),   Color3.fromRGB(0,180,255),
                Color3.fromRGB(0,100,255),   Color3.fromRGB(0,0,255),     Color3.fromRGB(90,0,255),
                Color3.fromRGB(160,0,255),   Color3.fromRGB(255,0,255),   Color3.fromRGB(255,0,130),
                Color3.fromRGB(255,105,180), Color3.fromRGB(255,255,255), Color3.fromRGB(200,200,200),
                Color3.fromRGB(140,140,140), Color3.fromRGB(80,80,80),    Color3.fromRGB(40,40,40),
                Color3.fromRGB(0,0,0),       Color3.fromRGB(139,0,0),     Color3.fromRGB(34,139,34),
                Color3.fromRGB(0,0,139),     Color3.fromRGB(128,0,128),   Color3.fromRGB(255,140,0),
            }

            for i, col in ipairs(palColors) do
                local Box = Instance.new("TextButton", PaletteGrid)
                Box.LayoutOrder = i
                Box.Size = UDim2.new(0, 26, 0, 26)
                Box.BackgroundColor3 = col
                Box.BorderSizePixel = 0
                Box.Text = ""
                Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 5)

                local BoxStroke = Instance.new("UIStroke", Box)
                BoxStroke.Color = Color3.fromRGB(255,255,255)
                BoxStroke.Thickness = 1
                BoxStroke.Transparency = 0.85

                Box.MouseEnter:Connect(function()
                    TweenService:Create(BoxStroke, TweenInfo.new(0.1), {Transparency=0.3}):Play()
                    TweenService:Create(Box,       TweenInfo.new(0.1), {Size=UDim2.new(0,28,0,28)}):Play()
                end)
                Box.MouseLeave:Connect(function()
                    TweenService:Create(BoxStroke, TweenInfo.new(0.1), {Transparency=0.85}):Play()
                    TweenService:Create(Box,       TweenInfo.new(0.1), {Size=UDim2.new(0,26,0,26)}):Play()
                end)
                Box.MouseButton1Click:Connect(function()
                    currentColor = col
                    ColorPreview.BackgroundColor3 = col
                    pcall(callback, col)
                end)
            end

            local PALETTE_HEIGHT = 110

            local function togglePicker()
                pickerOpen = not pickerOpen
                local targetFrame = pickerOpen and (40+8+PALETTE_HEIGHT+8) or 40
                if pickerOpen then PaletteWrap.Size = UDim2.new(1,-16,0,PALETTE_HEIGHT) end
                TweenService:Create(stroke, TweenInfo.new(0.2), {Transparency=pickerOpen and 0.42 or 0.88}):Play()
                local tw = TweenService:Create(ColorFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {Size=UDim2.new(1,0,0,targetFrame)})
                tw:Play()
                tw.Completed:Once(function()
                    if not pickerOpen then PaletteWrap.Size = UDim2.new(1,-16,0,0) end
                end)
            end

            ColorFrame.MouseButton1Click:Connect(togglePicker)

            return {
                SetColor = function(self, c)
                    currentColor = c
                    ColorPreview.BackgroundColor3 = c
                end
            }
        end

        function TabFuncs:CreateTextbox(text, placeholder, callback)
            order = order + 1

            local TextboxFrame = Instance.new("Frame", TabContent)
            TextboxFrame.LayoutOrder = order
            TextboxFrame.Size = UDim2.new(1, 0, 0, 68)
            TextboxFrame.BackgroundColor3 = CurrentTheme.Component
            TextboxFrame.BorderSizePixel = 0
            local stroke = applyComponentStyle(TextboxFrame)

            local LabelEl = Instance.new("TextLabel", TextboxFrame)
            LabelEl.Size = UDim2.new(1, -20, 0, 18)
            LabelEl.Position = UDim2.new(0, 12, 0, 8)
            LabelEl.BackgroundTransparency = 1
            LabelEl.Text = text
            LabelEl.TextColor3 = Color3.fromRGB(228, 225, 242)
            LabelEl.TextXAlignment = Enum.TextXAlignment.Left
            LabelEl.Font = Enum.Font.GothamBold
            LabelEl.TextSize = 13

            local InputBox = Instance.new("TextBox", TextboxFrame)
            InputBox.Size = UDim2.new(1, -24, 0, 28)
            InputBox.Position = UDim2.new(0, 12, 0, 30)
            InputBox.BackgroundColor3 = CurrentTheme.Background
            InputBox.BorderSizePixel = 0
            InputBox.PlaceholderText = placeholder or "Enter text..."
            InputBox.PlaceholderColor3 = Color3.fromRGB(108, 105, 125)
            InputBox.Text = ""
            InputBox.TextColor3 = Color3.fromRGB(240, 238, 252)
            InputBox.Font = Enum.Font.Gotham
            InputBox.TextSize = 12
            InputBox.TextXAlignment = Enum.TextXAlignment.Left
            InputBox.ClearTextOnFocus = false
            Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 5)
            TagTheme(InputBox, "Background")

            local InputPad = Instance.new("UIPadding", InputBox)
            InputPad.PaddingLeft  = UDim.new(0, 8)
            InputPad.PaddingRight = UDim.new(0, 8)

            InputBox.Focused:Connect(function()
                TweenService:Create(stroke, TweenInfo.new(0.2), {Transparency=0.38}):Play()
            end)
            InputBox.FocusLost:Connect(function(enterPressed)
                TweenService:Create(stroke, TweenInfo.new(0.2), {Transparency=0.88}):Play()
                if enterPressed then pcall(callback, InputBox.Text) end
            end)

            return {
                SetText = function(self, v) InputBox.Text = v end,
                GetText = function(self) return InputBox.Text end,
            }
        end

        function TabFuncs:CreateLabel(text)
            order = order + 1

            local LabelFrame = Instance.new("Frame", TabContent)
            LabelFrame.LayoutOrder = order
            LabelFrame.Size = UDim2.new(1, 0, 0, 34)
            LabelFrame.BackgroundColor3 = CurrentTheme.Component
            LabelFrame.BorderSizePixel = 0
            applyComponentStyle(LabelFrame)

            local Label = Instance.new("TextLabel", LabelFrame)
            Label.Size = UDim2.new(1, -24, 1, 0)
            Label.Position = UDim2.new(0, 12, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(188, 185, 205)
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Font = Enum.Font.Gotham
            Label.TextSize = 12
            Label.TextWrapped = true

            return { SetText = function(self, v) Label.Text = v end }
        end

        function TabFuncs:CreateSection(text)
            order = order + 1

            local SectionFrame = Instance.new("Frame", TabContent)
            SectionFrame.LayoutOrder = order
            SectionFrame.Size = UDim2.new(1, 0, 0, 28)
            SectionFrame.BackgroundTransparency = 1

            local SectionLabel = Instance.new("TextLabel", SectionFrame)
            SectionLabel.Size = UDim2.new(1, 0, 1, 0)
            SectionLabel.BackgroundTransparency = 1
            SectionLabel.Text = text
            SectionLabel.TextColor3 = CurrentTheme.Primary
            SectionLabel.TextXAlignment = Enum.TextXAlignment.Left
            SectionLabel.Font = Enum.Font.GothamBold
            SectionLabel.TextSize = 14
            TagTheme(SectionLabel, "PrimaryText")

            local Divider = Instance.new("Frame", SectionFrame)
            Divider.Size = UDim2.new(1, 0, 0, 1)
            Divider.Position = UDim2.new(0, 0, 1, -1)
            Divider.BackgroundColor3 = CurrentTheme.Primary
            Divider.BackgroundTransparency = 0.55
            Divider.BorderSizePixel = 0
            TagTheme(Divider, "Primary")
        end

        return TabFuncs
    end

    return WindowFuncs
end

return MalWhere
