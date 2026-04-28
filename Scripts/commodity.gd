extends Resource

class_name Commodity

@export var commodity_name: String
@export var commodity_sprite: Texture2D

@export var base_price: float
@export var current_price: float
#@export var updated_price: float

@export var min_supply : float = 100.0
@export var supply: float
@export var supply_next: float = 1.0 ##supply in the next tick
@export var demand: float
@export var demand_next: float = 1.0

@export var volatility_low: float 
@export var volatility_high: float

@export var global_quantity: int
@export var target_quantity: int

@export var production_rate: float = 10.0
@export var consumption_rate: float = 10.0

@export var elasticity : float = 1.0
