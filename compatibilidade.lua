--[[
	Mod MacroPlantas para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Compatibilização com versões anteriores
  ]]

-- LBM para remover nodes obsoletos
minetest.register_lbm({
	name = "macroplantas:update",
	nodenames = {
		"macroplantas:node_melancia",
		"macroplantas:melancia_1",
		"macroplantas:melancia_2",
		"macroplantas:melancia_3",
		"macroplantas:melancia_4",
		"macroplantas:arbusto_uva",
	},
	action = function(pos, node)
		minetest.remove_node(pos)
	end,
})

-- Aliases para itens do farming do tenplus
minetest.register_alias("macroplantas:uva", "farming:grapes")
minetest.register_alias("macroplantas:pedaco_melancia", "farming:melon_slice")
minetest.register_alias("macroplantas:melancia", "farming:melon_slice")
minetest.register_alias("macroplantas:seed_melancia", "farming:melon_slice")
