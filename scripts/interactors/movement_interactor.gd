# Interactor that adds forces to the rigid body depending on the player's inputs

extends Node

export(NodePath) var controller_component
export(NodePath) var rigid_body_component

func _ready():
	controller_component.connect("direction_up_pressed", rigid_body_component, "")
	pass

