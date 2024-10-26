-- Loadstring Script
local function getplrsname()
    for i, v in pairs(game:GetChildren()) do
        if v.ClassName == "Players" then
            return v.Name
        end
    end
end

local players = getplrsname()
local plr = game[players].LocalPlayer

-- settings is passed as a parameter to this script
local function setupHitboxes(settings)
    coroutine.resume(coroutine.create(function()
        while wait(1) do
            for _, v in pairs(game[players]:GetPlayers()) do
                if v.Name ~= plr.Name and v.Character then
                    -- Ensure HeadHB exists
                    if not v.Character:FindFirstChild("HeadHB") then
                        local headHB = Instance.new("Part")
                        headHB.Name = "HeadHB"
                        headHB.CanCollide = false
                        headHB.Transparency = 0.5
                        headHB.Size = Vector3.new(settings.HeadHitboxSize, settings.HeadHitboxSize, settings.HeadHitboxSize)
                        headHB.Parent = v.Character
                    end

                    -- Ensure HumanoidRootPart exists
                    if not v.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = Instance.new("Part")
                        hrp.Name = "HumanoidRootPart"
                        hrp.CanCollide = false
                        hrp.Transparency = 0.5
                        hrp.Size = Vector3.new(settings.HRPHitboxSize, settings.HRPHitboxSize, settings.HRPHitboxSize)
                        hrp.Parent = v.Character
                    end

                    -- Update sizes
                    local headHB = v.Character.HeadHB
                    local humanoidRootPart = v.Character:FindFirstChild("HumanoidRootPart")

                    if headHB then
                        headHB.Size = Vector3.new(settings.HeadHitboxSize, settings.HeadHitboxSize, settings.HeadHitboxSize)
                    end

                    if humanoidRootPart then
                        humanoidRootPart.Size = Vector3.new(settings.HRPHitboxSize, settings.HRPHitboxSize, settings.HRPHitSize)
                    end
                end
            end
        end
    end))
end

setupHitboxes(settings)  -- Call the function with settings
