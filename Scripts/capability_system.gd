extends Node

enum TickGroups{
	GAMEPLAY = 0,
}

var all_capabilities : Dictionary

func _ready() -> void:
	for i in range(TickGroups.size()):
		all_capabilities[i] = CapabilitiesArray.new()

func _process(delta: float) -> void:
	UpdateCapabilities(delta)

func UpdateCapabilities(delta : float):
	for key in all_capabilities:
		var capabilities = all_capabilities[key].get_capabilities()
		
		for i in range(capabilities.size()):
			var capability = capabilities[i]
			
			if (not capability._active) and capability._should_activate():
				capability.activate()
			elif capability._active:
				if capability._should_deactivate():
					capability.deactivate()
				else:
					capability._tick_active(delta)


func register(capability : BaseCapability):
	var tick_group : int = capability.tick_group
	
	all_capabilities[tick_group].add_capability(capability)

func unregister(capability : BaseCapability):
	var tick_group = capability.tick_group
	
	all_capabilities.get(tick_group).remove_capability(capability)
