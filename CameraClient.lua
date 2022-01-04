repeat task.wait() until game:IsLoaded()
-- Services
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")


local LocalPlayer = Players.LocalPlayer -- Not a sevice but who cares!
local Camera = workspace.Camera -- Not a service but who cares
local Mouse = LocalPlayer:GetMouse() -- Not a service but who cares
-- Folders
local Map = workspace:WaitForChild("Map")
local Cameras = Map.Cameras
-- Variables
-- Parenting Uis
StarterGui:WaitForChild("PartPositionGui"):Clone().Parent = LocalPlayer.PlayerGui

local PartPositionGui = LocalPlayer.PlayerGui:WaitForChild("PartPositionGui")
local PartPositionLabel = PartPositionGui.PartPositionLabel
-- Main Code
-- Funcs
local function StayInCamera()
	Camera.CameraType = "Scriptable"
	Camera.CFrame = Cameras.MainCameraPart.CFrame
	
	PartPositionLabel.Text = tostring(Cameras.MainCameraPart.Position)
end

RunService:BindToRenderStep("StayInMainCamera", Enum.RenderPriority.Camera.Value, StayInCamera)
-- Camera Movement
UserInputService.InputBegan:Connect(function(input, process)
	if process then
		return
	end
	
	if input.KeyCode == Enum.KeyCode.Down then
		Cameras.MainCameraPart.Position += Vector3.new(0, 0, 3)
	elseif input.KeyCode == Enum.KeyCode.Up then
		Cameras.MainCameraPart.Position -= Vector3.new(0, 0, 3)
	elseif input.KeyCode == Enum.KeyCode.Left then
		Cameras.MainCameraPart.Position -= Vector3.new(3, 0, 0)
	elseif input.KeyCode == Enum.KeyCode.Right then
		Cameras.MainCameraPart.Position += Vector3.new(3, 0, 0)
	end
end)
-- Zooming
Mouse.WheelForward:Connect(function()
	Cameras.MainCameraPart.Position += Vector3.new(0, 2, 0)
end)

Mouse.WheelBackward:Connect(function()
	Cameras.MainCameraPart.Position -= Vector3.new(0, 2, 0)
end)
