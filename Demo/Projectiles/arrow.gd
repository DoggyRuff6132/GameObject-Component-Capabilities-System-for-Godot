extends RigidBody2D
class_name Arrow

@export var lifetime : float = 3.0

@export var max_power : float = 3000

var ratio = 0.0
func set_ratio(amount : float):
	ratio = amount

func setup():
	linear_velocity = Vector2.from_angle(global_rotation) * ratio * max_power
	
