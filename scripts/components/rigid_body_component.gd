# Wrapper component for the standard RigidBody class

extends RigidBody

var total_force
var unit_transform

func _ready():
	total_force = Vector3(0, 0, 0)
	unit_transform = Transform(Vector3(1, 0, 0), Vector3(0, 1, 0), Vector3(0, 0, 1), Vector3(0, 0, 0))

func _integrate_forces(state):
	state.add_force(total_force, state.center_of_mass)
	# Swap the parent transform with its own
	get_parent().transform *= self.transform
	self.transform = unit_transform

func add_force(force):
	total_force += force

func remove_force(force):
	total_force -= force