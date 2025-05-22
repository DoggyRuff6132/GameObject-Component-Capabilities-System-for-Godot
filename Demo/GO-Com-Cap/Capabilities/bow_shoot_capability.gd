extends BaseCapability
class_name BowShootCapability

var bow_component : BowComponent

func _setup():
	super()
	bow_component = owner.components["Bow Component"]

func _should_activate() -> bool:
	if not Input.is_action_just_released("left_click"):
		return false
	if bow_component.get_bow_charge() < bow_component.get_min_charge():
		return false
	
	return true

func _should_deactivate() -> bool:
	return true

func _on_activated():
	print("bow_shoot_capability.gd: Activated")
	bow_component.shoot()
	bow_component.reset_bow_charge()
