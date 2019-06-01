local import = require(game.ReplicatedStorage.Shared.Import)
local LightingData = import "Shared/Data/LightingData"
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LightingSystem = {}

local modifier = 1

function LightingSystem:start()
	local lightData = LightingData[8].Data
	for propertyName, propertyValue in pairs(lightData) do
		if propertyName ~= "EggMeshColor" and propertyName ~= "WaterColor" then
			Lighting[propertyName] = propertyValue
		end
	end
	game.Lighting.ClockTime = 6
	local skybox = game:GetService("CollectionService"):GetTagged("EggMesh")[1]
	spawn(function()
		while true do
			for phaseNumber = 1, #(LightingData) do
				local phaseInfo = LightingData[phaseNumber]
				local lightData = phaseInfo.Data
				local tweenInfo = TweenInfo.new(
					phaseInfo.Length*modifier,
					Enum.EasingStyle.Linear,
					Enum.EasingDirection.Out)

				local lightingProperties = {}
				for propertyName, propertyValue in pairs(lightData) do
					if propertyName ~= "EggMeshColor" and propertyName ~= "WaterColor" then
						lightingProperties[propertyName] = propertyValue
					else
						if propertyName == "EggMeshColor" then
							local tween = TweenService:Create(skybox, tweenInfo, {["Color"] = propertyValue})
							tween:Play()
						else
							local tween = TweenService:Create(workspace.Terrain, tweenInfo, {["WaterColor"] = propertyValue})
							tween:Play()
						end
					end
				end

				local tween = TweenService:Create(Lighting, tweenInfo, lightingProperties)
				tween:Play()

				wait((phaseInfo.Length+1)*modifier)

				if phaseNumber == 6 then
					wait(5)
					game.Lighting.ClockTime = 0
				end
			end
		end
	end)
end

return LightingSystem