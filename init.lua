--[[
	Mod MacroPlantas para Minetest
	Copyright (C) 2017 BrunoMine (https://github.com/BrunoMine)
	
	Recebeste uma cópia da GNU Lesser General
	Public License junto com esse software,
	se não, veja em <http://www.gnu.org/licenses/>. 
	
	Inicializador de scripts
  ]]

-- Habilitar Plantas (true = habilitado | false = desabilitado)
local MELANCIA = true
local UVA = true

-- Notificador de Inicializador
local notificar = function(msg)
	if minetest.setting_get("log_mods") then
		minetest.debug("[MacroPlantas]"..msg)
	end
end

local modpath = minetest.get_modpath("macroplantas")

-- Variavel global das funcionalidades
macroplantas = {}

-- Carregar scripts
notificar("Carregando...")
dofile(modpath.."/diretrizes.lua")
if MELANCIA == true then
	dofile(modpath.."/melancia.lua")
end
if UVA == true then
	dofile(modpath.."/uva.lua")
end
notificar("OK")
