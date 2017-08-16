--[[
	Mod MacroPlantas para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Mudanças nas plantas de farming
  ]]


-- Mudança no potencial alimenticio
local tb_alimenticios = {
	["farming:bread"] = {3},
	["farming:carrot"] = {2},
	["farming:carrot_gold"] = {6},
	["farming:potato"] = {2},
	["farming:baked_potato"] = {2},
	["farming:pumpkin_slice"] = {1},
	["farming:pumpkin_bread"] = {3},
	["farming:raspberries"] = {1},
	["farming:smoothie_raspberry"] = {2, "vessels:drinking_glass"},
	["farming:beans"] = {1},
	["farming:blueberries"] = {1},
	["farming:muffin_blueberry"] = {3},
	["farming:corn"] = {1},
	["farming:corn_cob"] = {2},
	["farming:cookie"] = {1},
	["farming:chocolate_dark"] = {3},
	["farming:coffee_cup"] = {1, "farming:drinking_cup"},
	["farming:coffee_cup_hot"] = {2, "farming:drinking_cup"},
	["farming:cucumber"] = {2},
	["farming:donut"] = {3},
	["farming:donut_chocolate"] = {6},
	["farming:donut_apple"] = {4},
	["farming:grapes"] = {2},
	["farming:melon_slice"] = {1},
	["farming:rhubarb"] = {1},
	["farming:rhubarb_pie"] = {6},
	["farming:sugar"] = {1},
}

for nome,valor in pairs(tb_alimenticios) do
	minetest.override_item(nome, {on_use = minetest.item_eat(valor[1], valor[2])})
end

-- Remoção de algumas receitas para desativar
minetest.clear_craft({output = 'farming:carrot_gold'}) -- Cenoura Dourada

-- Alteração de algumas receitas

-- Cookie (Biscoito)
minetest.clear_craft({output = 'farming:cookie'})
minetest.register_craft( {
	output = "farming:cookie 3",
	recipe = {
		{ "farming:wheat", "farming:cocoa_beans", "farming:wheat" },
	}
})

-- Muffin de Mirtilo
minetest.clear_craft({output = 'farming:muffin_blueberry'})
minetest.register_craft({
	output = "farming:muffin_blueberry 2",
	recipe = {
		{"", "farming:blueberries", ""},
		{"farming:blueberries", "farming:bread", "farming:blueberries"},
	}
})

-- Açucar
minetest.clear_craft({output = 'farming:sugar'})
minetest.register_craft({
	type = "cooking",
	cooktime = 3,
	output = "farming:sugar",
	recipe = "default:papyrus",
})

