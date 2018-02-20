# Component that reads user inputs and sends signals accordingly
# Can emit the signals direction_[dir]_pressed and direction_[dir]_released for each of the directions

extends Node

var input_stack = []
var directions = ["up", "right", "down", "left"]
# This map of actions should be changed according to the project's input map
var actions_map = {
	"gm_up": "direction_up",
	"gm_right": "direction_right",
	"gm_down": "direction_down",
	"gm_left": "direction_left"
}

func _ready():
	set_process_input(true)
	
	# Add direction signals
	for direction in directions:
		add_user_signal("direction_" + direction + "_pressed")
		add_user_signal("direction_" + direction + "_released")

func _input(event):
	if event is InputEventAction:
		# Check if the action is "pressed" or "released"
		var pressed_string
		if event.is_pressed():
			pressed_string = "_pressed"
		else:
			pressed_string = "_released"
		
		# Check which action it is
		var action_string = actions_map[event.action]
		
		emit_signal(action_string + pressed_string)
