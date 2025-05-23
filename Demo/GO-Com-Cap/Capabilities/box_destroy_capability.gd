extends BaseCapability
class_name BoxDestroyCapability

var health_component : HealthComponent

func _setup():
	super()
	health_component = owner.components["Health Component"]

func _should_activate() -> bool:
	if health_component.get_current_health() <= 0:
		return true
	
	return false

func _on_activated():
	print("box died")
	owner.queue_free()
	pass
