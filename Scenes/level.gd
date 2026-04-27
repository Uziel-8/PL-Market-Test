extends Node2D

@onready var label = $Label
@onready var player_gold_label = $GoldLabel

func _ready() -> void:
	player_gold_label.text = str("$", Globals.player_gold)

func _on_timer_timeout() -> void:
	game_tick()
	EventBus.game_tick.emit()

func game_tick():
	for Commodity in Globals.commodities:
		print(Commodity.commodity_name, " current price: ", Commodity.current_price)
	_update_market()
	_update_label()

func _update_label():
	label.text = ""
	for commodity in Globals.commodities:
		label.text += str(commodity.commodity_name, ": ", commodity.current_price) + "\n"


func _update_market():
	for commodity in Globals.commodities:
		var ratio = commodity.demand/commodity.supply
		commodity.updated_price = commodity.current_price * pow(ratio, commodity.elasticity)
		#commodity.updated_price = commodity.current_price * randf_range(commodity.volatility_low, commodity.volatility_high)
		commodity.current_price = commodity.updated_price
		print(commodity.commodity_name, " updated price: ", commodity.current_price, ", quantity: ", commodity.global_quantity)
		$Panel/PriceGraph.record_price(commodity.commodity_name, commodity.current_price)


##
