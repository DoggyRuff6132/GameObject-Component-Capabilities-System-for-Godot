extends Resource
class_name BaseCapability

func _setup():
	print("Capability Setup")
	CapabilitySystem.register(self)

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

func on_owner_destroyed():
	if is_active():
		_on_deactivated()
	CapabilitySystem.unregister(self)

func activate():
	_active = true
	_on_activated()

func deactivate():
	_active = false
	_on_deactivated()

func is_active() -> bool:
	return _active

var tags : Array[String]
var tick_group : int = CapabilitySystem.TickGroups.GAMEPLAY
@export var tick_group_order = 100;

var owner : Node
var _active : bool = false
var active_duration : float = 0.0
var deactive_duration : float = 0.0
