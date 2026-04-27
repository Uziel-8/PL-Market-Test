extends Resource

class_name Commodity

@export var commodity_name: String
@export var commodity_sprite: Texture2D

@export var current_price: float
@export var updated_price: float
@export var min_supply : float = 100.0
@export var supply: float
@export var demand: float
@export var volatility_low: float 
@export var volatility_high: float

@export var global_quantity: int


@export var elasticity : float = 1.0
