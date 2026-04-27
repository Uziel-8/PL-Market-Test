extends Node

##ITEM LIST
const COAL = preload("res://Resources/coal.tres")
const GOLD = preload("res://Resources/gold.tres")
const WOOD = preload("res://Resources/wood.tres")
const IRON_ORE = preload("res://Resources/iron_ore.tres")
const IRON_BAR = preload("res://Resources/iron_bar.tres")
##

var player_gold := 1000.00

var commodities: Array[Commodity] = [
	COAL,
	GOLD,
	WOOD,
	IRON_ORE,
	IRON_BAR,
	
]
