extends BaseComponent
class_name CapabilityComponent

var tag_blockers : Dictionary[StringName, InstigatorArray]

@export var default_sheets : Array[CapabilitySheet]
@export var default_capabilities : Array[BaseCapability]
var components = {}

func _ready():
	for sheet in default_sheets:
		for component in sheet.default_components:
			var instance = component.instantiate()
			add_child(instance)
			
			components[instance.component_name] = instance
		
		for capability in sheet.default_capabilities:
			capability.owner = self
			capability._setup()
	
	for capability in default_capabilities:
			capability._setup()
