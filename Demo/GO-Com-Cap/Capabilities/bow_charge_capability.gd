extends BaseCapability
class_name BowChargeCapability

var bow_component : BowComponent

func _setup():
	super()
	bow_component = owner.components["Bow Component"]

func _should_activate() -> bool:
	if not Input.is_action_pressed("left_click"):
		return false
	
	return true

func _should_deactivate() -> bool:
	if Input.is_action_pressed("left_click"):
		return false
	
	return true

func _tick_active(delta : float):
	bow_component.add_charge(delta)
	print("bow_charge_capability.gd: " + str(bow_component.get_bow_charge()))

func _on_activated():
	print("bow_charge_capability.gd: Charging Bow")
	pass

func _on_deactivated():
	#print("bow_charge_capability.gd: Stop Charging Bow")
	bow_component.reset_bow_charge()
