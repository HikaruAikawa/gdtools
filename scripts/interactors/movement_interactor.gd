# Interactor that adds forces to the rigid body depending on the player's inputs

extends "res://scripts/interactors/interactor.gd"

export(NodePath) var controller_component
export(NodePath) var rigid_body_component

func _ready():
	connect_component_methods("controller_component")

func _gm_up_pressed():
	get_component("rigid_body_component").add_force(Vector3(0, 12, 0))

func _gm_up_released():
	get_component("rigid_body_component").remove_force(Vector3(0, 12, 0))

func _gm_down_pressed():
	get_component("rigid_body_component").add_force(Vector3(0, -12, 0))

func _gm_down_released():
	get_component("rigid_body_component").remove_force(Vector3(0, -12, 0))