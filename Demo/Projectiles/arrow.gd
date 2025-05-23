extends RigidBody2D
class_name Arrow

@export var lifetime : float = 3.0

@export var max_power : float = 3000
@export var damage : float = 10

var ratio = 0.0
func set_ratio(amount : float):
	ratio = amount

func setup():
	linear_velocity = Vector2.from_angle(global_rotation) * ratio * max_power
	

func _on_body_entered(body : Node):
	var children = body.get_children()
	for child in children:
		if child is HealthComponent:
			child.damage(damage)
			break
