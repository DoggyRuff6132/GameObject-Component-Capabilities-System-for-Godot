extends Object
class_name InstigatorArray
## This node gets around the inability to nest typed collections

var instigators : Array

func get_instigators() -> Array:
	return instigators

func add_instigator(instigator):
	instigators.append(instigator)

func remove_instigator(instigator):
	instigators.erase(instigator)
