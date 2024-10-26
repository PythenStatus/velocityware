local function getplrsname()
    for i, v in pairs(game:GetChildren()) do
        if v.ClassName == "Players" then
            return v.Name
        end
    end
end

local players = getplrsname()
local plr = game[players].LocalPlayer

-- This function will set up the hitboxes
local function setupHitboxes(settings)
    coroutine.resume(coroutine.create(function()
        while wait(1) do
            for _, v in pairs(game[players]:GetPlayers()) do
                if v.Name ~= plr.Name and v.Character then
                    -- Check and create HeadHB if it doesn't exist
                    local headHB = v.Character:FindFirstChild("HeadHB")
                    if not headHB then
                        headHB = Instance.new("Part")
                        headHB.Name = "HeadHB"
                        headHB.CanCollide = false
                        headHB.Transparency = 0.5
                        headHB.Parent = v.Character
                    end
                    
                    -- Check and create HumanoidRootPart if it doesn't exist
                    local humanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")
                    if not humanoidRootPart then
                        humanoidRootPart = Instance.new("Part")
                        humanoidRootPart.Name = "HumanoidRootPart"
                        humanoidRootPart.CanCollide = false
                        humanoidRootPart.Transparency = 0.5
                        humanoidRootPart.Parent = v.Character
                    end

                    -- Update sizes based on settings
                    headHB.Size = Vector3.new(settings.HeadHitboxSize, settings.HeadHitboxSize, settings.HeadHitboxSize)
                    humanoidRootPart.Size = Vector3.new(settings.HRPHitboxSize, settings.HRPHitboxSize, settings.HRPHitboxSize)

                    -- Optional: Set CanCollide and Transparency
                    headHB.CanCollide = false
                    headHB.Transparency = 0.5

                    humanoidRootPart.CanCollide = false
                    humanoidRootPart.Transparency = 0.5
                end
            end
        end
    end))
end

-- Call the setup function with the passed settings
setupHitboxes(settings)
