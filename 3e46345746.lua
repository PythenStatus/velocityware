local HHBSize = 13
local HRPHBSize = 13

function getplrsname()
for i,v in pairs(game:GetChildren()) do
if v.ClassName == "Players" then
return v.Name
end
end
end
local players = getplrsname()
local plr = game[players].LocalPlayer
coroutine.resume(coroutine.create(function()
while  wait(1) do
coroutine.resume(coroutine.create(function()
for _,v in pairs(game[players]:GetPlayers()) do
if v.Name ~= plr.Name and v.Character then
 
v.Character.HeadHB.CanCollide = false
v.Character.HeadHB.Transparency = 0.5
v.Character.HeadHB.Size = Vector3.new(HHBSize, HHBSize, HHBSize)
 
v.Character.HumanoidRootPart.CanCollide = false
v.Character.HumanoidRootPart.Transparency = 0.5
v.Character.HumanoidRootPart.Size = Vector3.new(HRPHBSize, HRPHBSize, HRPHBSize)
 
end
end
end))
end
end))
