extends Node2D

func _ready() -> void:
	EventBus.game_tick.connect(_on_game_tick)

##This town has an iron + coal mine and a smelter

func _on_game_tick():
	_coal_mine()
	_iron_mine()
	_smelter()

func _coal_mine():
	for item in Globals.commodities:
		if item == Globals.COAL:
			item.global_quantity += 100


func _iron_mine():
	for item in Globals.commodities:
		if item == Globals.IRON_ORE:
			item.global_quantity += 50


func _smelter():
	for item in Globals.commodities:
		if item == Globals.IRON_BAR:
			item.global_quantity += 25
		if item == Globals.IRON_ORE:
			item.global_quantity -= 40
		if item == Globals.COAL:
			item.global_quantity -= 50
