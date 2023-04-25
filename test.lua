local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("A") 

local b = w:CreateFolder("Farms") 
local c = w:CreateFolder("ATM") 
local d = w:CreateFolder("Store")
local function fireproximityprompt(Obj, Amount, Skip)
    if Obj.ClassName == "ProximityPrompt" then 
        Amount = Amount or 1
        local PromptTime = Obj.HoldDuration
        if Skip then 
            Obj.HoldDuration = 0
        end
        for i = 1, Amount do 
            Obj:InputHoldBegin()
            if not Skip then 
                wait(Obj.HoldDuration)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
    else 
        error("userdata<ProximityPrompt> expected")
    end
end

getgenv().loop = false
getgenv().PP = false
local restock = game:GetService("Workspace").Restocking.Part.ProximityPrompt
local player = game.Players.LocalPlayer
local humr = player.Character.HumanoidRootPart


local db1 = false
local db2 = false



function jobaura()
    if getgenv().loop then
        spawn(function()
            repeat wait()
                
                for i,v in pairs(game:GetService("Workspace").Restocking:GetChildren()) do
                    if v:IsA("Part") and v:FindFirstChild("ProximityPrompt") and player.Backpack:FindFirstChild(v.Name) then
                            local mag = (humr.Position - v.Position).Magnitude
                            if mag < 5 then
                                fireproximityprompt(v.ProximityPrompt,1,getgenv().PP)
                                repeat wait(.5) fireproximityprompt(v.ProximityPrompt,1,getgenv().PP) until player.Backpack:FindFirstChild(v.Name) == nil
                                end
                elseif v.Name == "Part" and v:FindFirstChild("ProximityPrompt") and db2 == false and player.Backpack:FindFirstChild("Grey") == nil and player.Backpack:FindFirstChild("White") == nil and player.Backpack:FindFirstChild("Black") == nil and player.Backpack:FindFirstChild("Green") == nil and player.Backpack:FindFirstChild("Blue") == nil and player.Backpack:FindFirstChild("Purple") == nil and player.Backpack:FindFirstChild("Red") == nil and player.Backpack:FindFirstChild("Pink") == nil and player.Backpack:FindFirstChild("Brown") == nil and player.Backpack:FindFirstChild("Orange") == nil then
                            local mag = (humr.Position - v.Position).Magnitude
                            if mag < 5 then
                                db2 = true
                                fireproximityprompt(v.ProximityPrompt,1,getgenv().PP)
                                repeat wait() until player.Backpack:FindFirstChild("Grey") or player.Backpack:FindFirstChild("White") or player.Backpack:FindFirstChild("Black") or player.Backpack:FindFirstChild("Green") or player.Backpack:FindFirstChild("Blue") or player.Backpack:FindFirstChild("Purple") or player.Backpack:FindFirstChild("Red") or player.Backpack:FindFirstChild("Pink") or player.Backpack:FindFirstChild("Brown") or player.Backpack:FindFirstChild("Orange") 
                                db2 = false
                            end
                            
                    end
                end
                
                
                
            until getgenv().loop == false
            return
            end)
        end
end


b:DestroyGui()

b:Toggle("Restock Aura",function(bool)
if bool then
    getgenv().loop = bool
    jobaura()
    else
    getgenv().loop = bool
    end
end)

b:Toggle("Instant PP",function(bool)
if bool then
    getgenv().PP = bool

    else
    getgenv().PP = bool
    end
end)

local amount = 100


c:Box("Withdraw: ","number",function(value) -- "number" or "string"
    amount = value
end)

c:Button("Withdraw",function(bool)
    game.ReplicatedStorage.Remotes.Withdraw:FireServer((tonumber(amount)));
end)

c:Button("Deposit",function(bool)
    game.ReplicatedStorage.Remotes.Deposit:FireServer((tonumber(amount)));
end)

local stores = {}
local selectedstore = nil
for i,v in pairs(game.ReplicatedStorage.GameplayUIs:GetChildren()) do
    if v.Name ~= "Deathscreen" and v.Name ~= "Blindfold" and v.Name ~= "CC" and v.Name ~= "GameFull" and v.Name ~= "Voting" then
        table.insert(stores,v.Name)
        end
    end

local selectedguifr = nil

d:Dropdown("Select A Store",stores,true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
    local GUI = game:GetService("ReplicatedStorage").GameplayUIs[mob]:Clone()
    local pGui = game:GetService("Players").LocalPlayer.PlayerGui
    GUI.Parent = pGui
    selectedguifr = mob
    
end)

d:Button("Close Gui",function()
     local pGui = game:GetService("Players").LocalPlayer.PlayerGui
     pGui[selectedguifr]:Destroy()
end)


local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://138014729"
sound.Volume = 1
sound.Parent = Workspace

local modtable = {
    
    981737150,
    670482746,
    2020346000,
    253025461,
    90194545,
    146895162,
    1102415403,
    531999610,
    531999610,
    1468951621,
    120245,
    99800862,
    10584735,
    370926934,
    143600058

    
    
    
    
}


if getgenv().notif == nil then
getgenv().notif = true


for i,v in pairs(game.Players:GetChildren()) do
    if v:IsA("Player") then
        local plr = v
            if plr:GetRankInGroup(6336966) > 1 or table.find(modtable,plr.UserId) then
    game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Moderator Is In-Game", -- Required
	Text = plr.Name, -- Required
	Icon = "rbxassetid://9694021111", -- Optional
	Duration = 50,
	Button1 = "Dismiss";
})
sound:Play()
end
        end
end    

game.Players.PlayerAdded:Connect(function(plr)
    if plr:GetRankInGroup(6336966) > 1 or table.find(modtable,plr.UserId) then
    game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Moderator Joined", -- Required
	Text = plr.Name, -- Required
	Icon = "rbxassetid://9694021111",
	Duration = 50,
	Button1 = "Dismiss"
})
sound:Play()
end
end)

game.Players.PlayerRemoving:Connect(function(plr)
    if plr:GetRankInGroup(6336966) > 1 or table.find(modtable,plr.UserId) then
    game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Moderator Left", -- Required
	Text = plr.Name, -- Required
	Icon = "rbxassetid://9694021111", -- Optional
	Duration = 50,
	Button1 = "Dismiss";
})
sound:Play()
end
end)
end
