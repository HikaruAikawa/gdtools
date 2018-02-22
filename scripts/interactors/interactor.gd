# Base Interactor class

extends Node

var components_dict = {}

func _ready():
	# Stores references to all component nodes
	for property in get_property_list():
		if property.type == TYPE_NODE_PATH:
			# Stores in components_dict a reference to the node pointed by the value of the property
			components_dict[property.name] = get_node(get(property.name))

func get_component(component_name):
	return components_dict[component_name]

# Connects all signals from the given component to methods of the same name with an underscore at the beginning
func connect_component_methods(component_name):
	for sig in get_component(component_name).get_signal_list():
		if self.has_method("_" + sig.name):
			get_component(component_name).connect(sig.name, self, "_" + sig.name)