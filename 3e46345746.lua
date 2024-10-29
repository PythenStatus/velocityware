local players = game.Players

coroutine.resume(coroutine.create(function()
    while wait(1) do
        coroutine.resume(coroutine.create(function()
            for _, v in pairs(players:GetPlayers()) do
                if v.Name ~= players.LocalPlayer.Name and v.Character then
                    -- Update hitbox sizes using global variables
                    if v.Character:FindFirstChild("HeadHB") then
                        v.Character.HeadHB.CanCollide = false
                        v.Character.HeadHB.Transparency = 0.5
                        v.Character.HeadHB.Size = Vector3.new(getgenv().HHBSize, getgenv().HHBSize, getgenv().HHBSize)
                    end
                    
                    if v.Character:FindFirstChild("HumanoidRootPart") then
                        v.Character.HumanoidRootPart.CanCollide = false
                        v.Character.HumanoidRootPart.Transparency = 0.5
                        v.Character.HumanoidRootPart.Size = Vector3.new(getgenv().HRPHBSize, getgenv().HRPHBSize, getgenv().HRPHBSize)
                    end
                end
            end
        end))
    end
end))
