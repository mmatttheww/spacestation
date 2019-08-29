local import = require(game.ReplicatedStorage.Shared.Import)

local loadOrder = {
	"Shared/PlayerData",
	"Shared/Systems/Sounds",
	"../Systems/Animations",
	"../Systems/Commands",
	"Shared/Systems/Chat",
	"Shared/Systems/Ragdoll",
	"../Systems/ClickDetectors",
	"../Systems/Particles",
	"../Systems/Oxygen",
	"../Systems/Appearance",
	"../Systems/Doors",
	"../Systems/MovementPreparation",
	"../Systems/Stats",
	"../Systems/LightSwitches",
	"../Systems/Tools",
	"../Systems/Drawers",
	"../Systems/Teams",
	"../Systems/Damage",
	"../Systems/Projectiles",
	"../Systems/Knockback",
	"../Systems/Machines",
	"../Systems/Carrying",
	"../Systems/Alien",
	"../Systems/Animals",
	"../Systems/Crates",
	"../Systems/HeatAreas",
	"../Systems/Explosions",
	"../Systems/CargoOrdering",
	"../Systems/Ships",
	"../Systems/Paychecks",
	"../Systems/Clocks",
	"../Systems/Storage",
	"../Systems/Water",
	"../Systems/Plants",
	"../Systems/MonsterSpawning",
	"../Systems/Fire",
	"../Systems/GreenGoo",
	"../Systems/Station",
	"../Systems/Arrests",
	"../Systems/Checkpoints",
	"../Systems/Fuel",
	"../Systems/Engine",
	"../Systems/Votes",
	"../Systems/Invisibility",
	"../Systems/Science",
	"../Systems/Lives",
	"../Systems/Vehicles",
	"../Systems/Kicks",
	"../Systems/Quests",
	"../Systems/VendingMachines",
}

for _, path in ipairs(loadOrder) do
	local system = import(path)
	system:start()
end
