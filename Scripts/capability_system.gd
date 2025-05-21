extends Node

enum TickGroups{
	GAMEPLAY
}

var all_capabilities : Dictionary[TickGroups, CapabilitiesArray]

func _process(delta: float) -> void:
	UpdateCapabilities(delta)

func UpdateCapabilities(delta : float):
	for key in all_capabilities:
		var capabilities = all_capabilities[key].get_capabilities()
		
		for capability in capabilities:
			if not capability.is_active and capability._should_activate():
				capability.activate()
			elif capability.is_active and capability._should_deactivate():
				capability.deactivate()
			
			if capability.is_active:
				capability._tick_is_active(delta)

func register(capability : BaseCapability):
	var tick_group = capability.tick_group
	
	all_capabilities.get(tick_group).add_capability(capability)

func unregister(capability : BaseCapability):
	var tick_group = capability.tick_group
	
	all_capabilities.get(tick_group).remove_capability(capability)
