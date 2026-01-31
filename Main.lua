--[[
    PROJECT: SHADOW ARCHITECT [ULTIMATE EDITION]
    PART: 1 (UI & VISUALS)
    TARGET: MM2
]]

--// 1. Kütüphane ve Kurulum
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "VORTEX HUB | MM2", HidePremium = false, SaveConfig = true, ConfigFolder = "ShadowConfig"})

--// Global Değişkenler (Diğer parçalarla iletişim için)
getgenv().ShadowSettings = {
    Speed = 16,
    Jump = 50,
    KillAuraDist = 15,
    AutoFarm = false,
    Spectate = nil
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

--// 2. GÖRSEL SEKME (Visuals Tab)
local VisualsTab = Window:MakeTab({Name = "Gözcü (ESP)", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- ESP Fonksiyonu
local function UpdateESP(Value)
    getgenv().ESPEnabled = Value
    if not Value then
        -- Kapatıldığında temizle
        for _, v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == "ShadowESP" then v:Destroy() end
        end
        return
    end

    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled then return end
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                -- Mevcut ESP kontrolü
                if not plr.Character:FindFirstChild("ShadowHighlight") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "ShadowHighlight"
                    hl.Parent = plr.Character
                    hl.FillTransparency = 0.5
                    hl.OutlineTransparency = 0
                    
                    -- Rol Rengi Belirleme
                    if plr.Backpack:FindFirstChild("Gun") or plr.Character:FindFirstChild("Gun") then
                        hl.FillColor = Color3.fromRGB(0, 0, 255) -- Mavi (Şerif)
                    elseif plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife") then
                        hl.FillColor = Color3.fromRGB(255, 0, 0) -- Kırmızı (Katil)
                    else
                        hl.FillColor = Color3.fromRGB(0, 255, 0) -- Yeşil (Masum)
                    end
                end
            end
        end
    end)
end

VisualsTab:AddToggle({
    Name = "ESP (Rolleri Gör)",
    Default = false,
    Callback = function(Value)
        UpdateESP(Value)
    end
})

VisualsTab:AddToggle({
    Name = "X-Ray (Duvar Arkası)",
    Default = false,
    Callback = function(Value)
        if Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.LocalTransparencyModifier = 0.5 end
            end
        else
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.LocalTransparencyModifier = 0 end
            end
        end
    end
})

OrionLib:MakeNotification({
    Name = "Shadow Architect",
    Content = "Çekirdek Sistem ve Görseller Yüklendi.",
    Image = "rbxassetid://4483345998",
    Time = 3
})
--[[
    PROJECT: SHADOW ARCHITECT [ULTIMATE EDITION]
    PART: 1 (UI & VISUALS)
    TARGET: MM2
]]

--// 1. Kütüphane ve Kurulum
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Shadow Architect | MM2", HidePremium = false, SaveConfig = true, ConfigFolder = "ShadowConfig"})

--// Global Değişkenler (Diğer parçalarla iletişim için)
getgenv().ShadowSettings = {
    Speed = 16,
    Jump = 50,
    KillAuraDist = 15,
    AutoFarm = false,
    Spectate = nil
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

--// 2. GÖRSEL SEKME (Visuals Tab)
local VisualsTab = Window:MakeTab({Name = "Gözcü (ESP)", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- ESP Fonksiyonu
local function UpdateESP(Value)
    getgenv().ESPEnabled = Value
    if not Value then
        -- Kapatıldığında temizle
        for _, v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == "ShadowESP" then v:Destroy() end
        end
        return
    end

    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled then return end
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                -- Mevcut ESP kontrolü
                if not plr.Character:FindFirstChild("ShadowHighlight") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "ShadowHighlight"
                    hl.Parent = plr.Character
                    hl.FillTransparency = 0.5
                    hl.OutlineTransparency = 0
                    
                    -- Rol Rengi Belirleme
                    if plr.Backpack:FindFirstChild("Gun") or plr.Character:FindFirstChild("Gun") then
                        hl.FillColor = Color3.fromRGB(0, 0, 255) -- Mavi (Şerif)
                    elseif plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife") then
                        hl.FillColor = Color3.fromRGB(255, 0, 0) -- Kırmızı (Katil)
                    else
                        hl.FillColor = Color3.fromRGB(0, 255, 0) -- Yeşil (Masum)
                    end
                end
            end
        end
    end)
end

VisualsTab:AddToggle({
    Name = "ESP (Rolleri Gör)",
    Default = false,
    Callback = function(Value)
        UpdateESP(Value)
    end
})

VisualsTab:AddToggle({
    Name = "X-Ray (Duvar Arkası)",
    Default = false,
    Callback = function(Value)
        if Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.LocalTransparencyModifier = 0.5 end
            end
        else
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.LocalTransparencyModifier = 0 end
            end
        end
    end
})

OrionLib:MakeNotification({
    Name = "Shadow Architect",
    Content = "Çekirdek Sistem ve Görseller Yüklendi.",
    Image = "rbxassetid://4483345998",
    Time = 3
})
--[[
    PROJECT: SHADOW ARCHITECT [ULTIMATE EDITION]
    PART: 2 (COMBAT & FARM)
]]

local CombatTab = Window:MakeTab({Name = "Savaş (Combat)", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local FarmTab = Window:MakeTab({Name = "Farm & XP", Icon = "rbxassetid://4483345998", PremiumOnly = false})

--// KILL AURA LOGIC
CombatTab:AddToggle({
    Name = "Kill Aura (Katil Modu)",
    Default = false,
    Callback = function(Value)
        getgenv().KillAura = Value
        spawn(function()
            while getgenv().KillAura do
                task.wait()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Knife") then
                    for _, target in pairs(Players:GetPlayers()) do
                        if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                            local dist = (char.HumanoidRootPart.Position - target.Character.HumanoidRootPart.Position).Magnitude
                            if dist < getgenv().ShadowSettings.KillAuraDist then
                                char.Knife:Activate()
                                -- İsteğe bağlı: Teleport behind player
                                -- char.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                            end
                        end
                    end
                end
            end
        end)
    end
})

CombatTab:AddSlider({
    Name = "Aura Menzili",
    Min = 5,
    Max = 30,
    Default = 15,
    Color = Color3.fromRGB(255,0,0),
    Increment = 1,
    ValueName = "Studs",
    Callback = function(Value)
        getgenv().ShadowSettings.KillAuraDist = Value
    end
})

--// SILENT AIM LOGIC (Şerif)
CombatTab:AddButton({
    Name = "Auto-Shoot Murderer (Şerif)",
    Callback = function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Gun") then
            -- Katili bul
            local murderer = nil
            for _, v in pairs(Players:GetPlayers()) do
                if v.Backpack:FindFirstChild("Knife") or (v.Character and v.Character:FindFirstChild("Knife")) then
                    murderer = v
                    break
                end
            end
            
            if murderer and murderer.Character then
                -- Silahı kuşandırt ve ateşle
                char.Humanoid:EquipTool(char.Gun)
                task.wait(0.1)
                -- Mermiyi yönlendirmek yerine, merminin gittiği yeri manipüle ediyoruz (Hook gerektirir, bu basit versiyon)
                local args = {
                    [1] = 1,
                    [2] = murderer.Character.HumanoidRootPart.Position,
                    [3] = "AH"
                }
                char.Gun.KnifeDown:FireServer(unpack(args))
            end
        else
            OrionLib:MakeNotification({Name = "Hata", Content = "Silahın yok!", Time = 2})
        end
    end
})

--// FARM LOGIC (Vortex Tween)
FarmTab:AddToggle({
    Name = "Auto Coin Farm (Vortex)",
    Default = false,
    Callback = function(Value)
        getgenv().ShadowSettings.AutoFarm = Value
        spawn(function()
            while getgenv().ShadowSettings.AutoFarm do
                task.wait()
                local char = LocalPlayer.Character
                if not char then continue end
                
                -- Coinleri bul
                local coinContainer = workspace:FindFirstChild("CoinContainer")
                if coinContainer then
                    for _, coin in pairs(coinContainer:GetChildren()) do
                        if not getgenv().ShadowSettings.AutoFarm then break end
                        if coin.Name == "Coin_Server" and coin:FindFirstChild("Coin") then
                            -- Karakteri coin'e kaydır (Tween)
                            local tween = game:GetService("TweenService"):Create(
                                char.HumanoidRootPart,
                                TweenInfo.new(0.5, Enum.EasingStyle.Linear),
                                {CFrame = coin.Coin.CFrame}
                            )
                            tween:Play()
                            tween.Completed:Wait()
                            
                            -- Çanta dolu mu kontrolü (Basit)
                            -- Otomatik çanta boşaltma eklenmeli
                        end
                    end
                end
            end
        end)
    end
})
--[[
    PROJECT: SHADOW ARCHITECT [ULTIMATE EDITION]
    PART: 3 (PHYSICS & TROLL)
]]

local PlayerTab = Window:MakeTab({Name = "Oyuncu (Player)", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TrollTab = Window:MakeTab({Name = "Troll & Fun", Icon = "rbxassetid://4483345998", PremiumOnly = false})

--// FİZİK AYARLARI
PlayerTab:AddSlider({
    Name = "Yürüme Hızı (Speed)",
    Min = 16,
    Max = 200,
    Default = 16,
    Color = Color3.fromRGB(0,255,255),
    Increment = 1,
    ValueName = "Hız",
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

PlayerTab:AddSlider({
    Name = "Zıplama Gücü (Jump)",
    Min = 50,
    Max = 300,
    Default = 50,
    Color = Color3.fromRGB(0,255,255),
    Increment = 1,
    ValueName = "Güç",
    Callback = function(Value)
        LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

PlayerTab:AddButton({
    Name = "Noclip (Duvarlardan Geç)",
    Callback = function()
        game:GetService("RunService").Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then v.CanCollide = false end
                end
            end
        end)
        OrionLib:MakeNotification({Name = "Noclip", Content = "Artık duvarsızsın.", Time = 2})
    end
})

PlayerTab:AddButton({
    Name = "Görünmezlik (Invisible - Client)",
    Callback = function()
        local char = LocalPlayer.Character
        for _, v in pairs(char:GetChildren()) do
            if v:IsA("BasePart") or v:IsA("Decal") then
                v.Transparency = 1
            end
        end
    end
})

--// TROLL ÖZELLİKLERİ
TrollTab:AddButton({
    Name = "Lobiye Işınlan (Teleport Lobby)",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10, 0) -- Koordinatlar haritaya göre değişebilir
    end
})

TrollTab:AddToggle({
    Name = "Chat Spam (Reklam/Troll)",
    Default = false,
    Callback = function(Value)
        getgenv().SpamChat = Value
        spawn(function()
            while getgenv().SpamChat do
                local msgs = {
                    "Shadow Architect on Top! 👑",
                    "Lotus Hub detected? 👁️",
                    "Arceus X Neo Power ⚡"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msgs[math.random(1, #msgs)], "All")
                task.wait(2)
            end
        end)
    end
})

TrollTab:AddButton({
    Name = "Emote Spam (Floss)",
    Callback = function()
        -- Bu özellik oyunun animasyon ID'lerine göre çalışır
        game:GetService("Players").LocalPlayer.Character.Humanoid:PlayAnimation(workspace.Animation) -- Örnek
    end
})

--// SİSTEMİ BAŞLAT
OrionLib:Init()
