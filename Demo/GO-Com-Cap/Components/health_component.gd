extends Node
class_name HealthComponent

var component_name = "Health Component"

@export var max_health : float = 100
var current_health : float

func _ready():
	current_health = max_health

func damage(amount : float):
	print("took " + str(amount) + " damage")
	current_health -= amount

func get_current_health():
	return current_health
