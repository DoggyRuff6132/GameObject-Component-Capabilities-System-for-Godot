extends BaseCapability

func _setup():
	super()

func _should_activate() -> bool:
	return true

func _should_deactivate() -> bool:
	return false

func _on_activated():
	#print("On Activated")
	pass

func _on_deactivated():
	#print("On Deactivated")
	pass

func _tick_active(delta : float):
	#print("Tick Active")
	pass
