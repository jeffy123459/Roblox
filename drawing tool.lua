local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local ignore = Instance.new('Model',game.Workspace)
mouse.TargetFilter = ignore
local a = false

mouse.Button1Down:connect(function()
a = false
repeat wait(.01) 
local par = Instance.new("Part", ignore) 
par.Name = "line"
par.FormFactor = "Custom"
par.Anchored = true 
par.BrickColor = BrickColor.White() -- problem starts here..
par.Size = Vector3.new(.1,.1,.1)  -- it doesnt read whole properties.
par.CFrame = CFrame.new(mouse.Hit.p)  -- does it matter ._. so it wont show rotate
par.CanCollide = false
until a == true
end)


player.Chatted:connect(function(msg)
if msg:lower() == "clear" then
for k,v in pairs(workspace:GetChildren()) do
ypcall(function()ignore:remove()end)
ignore = Instance.new('Model',Workspace)
mouse.TargetFilter = ignore
end
end
end)

mouse.Button1Up:connect(function()
a = true
end)
