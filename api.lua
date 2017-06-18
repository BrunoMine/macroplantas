--[[
	Mod MacroPlantas para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	API
  ]]

-- Adiciona itens para serem dropados no mato comum
macroplantas.registrar_drop_comum = function(item, raridade)
	
	for i = 1, 5 do	
		
		local drop = minetest.registered_items["default:grass_"..i].drop
		
		table.insert(drop.items, {items = {item},rarity = raridade})
		
		minetest.override_item("default:grass_"..i, {drop = drop})
	end
end


