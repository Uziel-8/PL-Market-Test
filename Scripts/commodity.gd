extends Resource

class_name Commodity

@export var commodity_name: String
@export var commodity_sprite: Texture2D

@export var base_price: float
@export var current_price: float

@export var volatility: float = 5.0

@export var global_quantity: int
@export var target_quantity: int = 100

@export var production_rate: float = 10.0
@export var consumption_rate: float = 10.0

@export var elasticity : float = 1.0
