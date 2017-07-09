--[[
	Mod MacroPlantas para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Melancia
  ]]

-- MELANCIA
farming.register_plant("macroplantas:melancia", {
	description = "Semente de Melancia",
	inventory_image = "macroplantas_melancia_seed.png",
	drop = '',
	steps = 4,
	minlight = 13,
	maxlight = default.LIGHT_MAX,
	fertility = {"grassland"}
})

minetest.register_craftitem("macroplantas:pedaco_melancia", {
	description = "Melancia",
	inventory_image = "macroplantas_melancia.png",
	stack_max = 10,
	on_use = minetest.item_eat(1),
})

-- Colocar sementes nas gramas junto com as outras sementes
do
	local drop = minetest.deserialize(minetest.serialize(minetest.registered_nodes["default:grass_1"].drop))
	table.insert(drop.items, {items={'macroplantas:seed_melancia'}, rarity = 8})
	for i = 1, 5 do
		minetest.override_item("default:grass_"..i, {drop = drop})
	end
end

-- Bloco de Melancia para colheita
minetest.register_node("macroplantas:node_melancia", {
	description = "Node Melancia",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
			"macroplantas_melancia_listrado.png", -- Cima
			"macroplantas_melancia_listrado.png", -- Baixo
			"macroplantas_melancia_tampa.png", -- Lado direito
			"macroplantas_melancia_tampa.png", -- Lado esquerda
			"macroplantas_melancia_listrado.png", -- Fundo
			"macroplantas_melancia_listrado.png", -- Frente
			},
	node_box = {
		type = "fixed",
		fixed = {
					{-0.440625, -0.5, -0.440625, 0.440625, 0.437500, 0.440625}, -- Melancia
				}
	},
	groups = {crumbly=3,attached_node=1},
	drop = '',
})

minetest.override_item("macroplantas:node_melancia", {drop = {
	max_items = 3,
	items = {
		{items = {'macroplantas:seed_melancia'}},
		{items = {'macroplantas:pedaco_melancia'}},
		{items = {'macroplantas:pedaco_melancia'}},
		{items = {'macroplantas:pedaco_melancia'}},
		{items = {'macroplantas:pedaco_melancia'}},
		{items = {'macroplantas:pedaco_melancia'},rarity = 5},
	}
}})

minetest.register_abm({
	nodenames = {"macroplantas:melancia_4"},
	interval = 10,
	chance = 50,
	action = function(pos)
		minetest.set_node(pos, {name = "macroplantas:node_melancia"})
	end
})
