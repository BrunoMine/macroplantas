--[[
	Mod MacroPlantas para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Uva
  ]]

-- Cacho de Uva
minetest.register_craftitem("macroplantas:uva", {
	description = "Cacho de Uvas",
	inventory_image = "macroplantas_uva.png",
	stack_max = 25,
	on_use = minetest.item_eat(1),
})

-- Arbusto da Uva
minetest.register_node("macroplantas:arbusto_uva", {
	description = "Arbusto com Uvas",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"macroplantas_arbusto_uva.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=2,flora=1,attached_node=1},
	sounds = default.node_sound_leaves_defaults(),
	drop = "macroplantas:uva",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
})

-- Registrando arbusto na Mapgen v6
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass"},
	sidelen = 5,
	noise_params = {
		offset = -1,
		scale = 1.1,
		spread = {x = 10, y = 10, z = 10},
		seed = 231513,
		octaves = 1,
		persist = 2
	},
	y_min = 10,
	y_max = 31000,
	decoration = "macroplantas:arbusto_uva",
})


