extends BaseComponent
class_name BowComponent

@export var max_charge = 1.0
@export var minimum_charge_proportion = 0.05
@export var projectile : PackedScene
var bow_charge = 0.0

func get_bow_charge():
	return bow_charge

func get_min_charge():
	return minimum_charge_proportion * max_charge

func get_max_charge():
	return max_charge

func get_bow_charge_ratio():
	return bow_charge / max_charge

func add_charge(amount : float):
	bow_charge = clamp(bow_charge + amount, 0.0, 1.0)

func reset_bow_charge():
	bow_charge = 0.0

func shoot():
	print("bow_component.gd: Shot Projectile")
	
	var proj : Node2D = projectile.instantiate()
	get_parent().add_child(proj)
	
	proj.set_ratio(get_bow_charge_ratio())
	proj.look_at(proj.get_global_mouse_position())
	proj.setup()
