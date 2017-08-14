--[[
	Mod MacroPlantas para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Inicializador de scripts
  ]]


-- Notificador de Inicializador
local notificar = function(msg)
	if minetest.setting_get("log_mods") then
		minetest.debug("[MacroPlantas]"..msg)
	end
end

-- Verifica se mod Farming Redo (TenPlus) está ativo
if not minetest.registered_craftitems["farming:melon_slice"]
	or not minetest.registered_craftitems["farming:grapes"]
then
	minetest.log("error", "[MacroPlantas] Exigido melon e grapes do mod farming Redo (TenPlus)")
	return
end

local modpath = minetest.get_modpath("macroplantas")

-- Carregar scripts
notificar("Carregando...")
dofile(modpath.."/farming.lua")
dofile(modpath.."/compatibilidade.lua")
notificar("OK")
