local import = require(game.ReplicatedStorage.Shared.Import)
local Messages = import "Shared/Utils/Messages"
local Players = game:GetService("Players")
local TeamData = import "Shared/Data/TeamData"

local Appearance = {}

function Appearance:start()
	Players.PlayerAdded:connect(function(player)
		player.CharacterAdded:connect(function(character)
			local humanoid = character:WaitForChild("Humanoid")
			local description = humanoid:GetAppliedDescription()
			description.ClimbAnimation = "rbxassetid://1090134016"
			description.FallAnimation = "rbxassetid://1090132063"
			description.IdleAnimation = "rbxassetid://1090133099"
			description.JumpAnimation = "rbxassetid://1090132507"
			description.RunAnimation = "rbxassetid://1090130630"
			description.SwimAnimation = "rbxassetid://1090133583"
			description.WalkAnimation = "rbxassetid://1090131576"
			description.WidthScale = .5
			description.HeightScale = 1.2
			print("yeyeet")
			wait()
			for partName, id in pairs(TeamData[player.Team.Name].bodyParts) do
				print("seeting", partName, id)
				description[partName] = id
			end
			print("g")
			humanoid:ApplyDescription(description)
			--humanoid:BuildRigFromAttachments()
			character:WaitForChild("Health"):Destroy()
			local light = Instance.new("PointLight", character.PrimaryPart)
			light.Brightness = 0
			light.Range = 12
			light.Shadows = true
		end)
	end)
end

return Appearance


--[[
	http://www.roblox.com/asset/?id=891621366
	http://www.roblox.com/asset/?id=891639666
]]
