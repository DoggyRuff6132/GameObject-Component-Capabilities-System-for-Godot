extends Object
class_name CapabilitiesArray
## This node gets around the inability to nest typed collections

var capabilities : Array[BaseCapability]

func get_capabilities() -> Array[BaseCapability]:
	return capabilities

func add_capability(capability : BaseCapability):
	var tick_order = capability.tick_group_order
	
	var index = 0
	for c in capabilities:
		if c.tick_group_order < tick_order:
			index += 1
		else:
			break
	
	capabilities.insert(index, capability)

func remove_capability(capability : BaseCapability):
	capabilities.erase(capability)
