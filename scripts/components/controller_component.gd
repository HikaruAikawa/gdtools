# Component that reads user inputs and sends signals accordingly
# Can emit the signals [action]_pressed, [action]_held and [action]_released for each action

extends Node

var action_stack = []

func _init():
	# Add action signals
	for action in InputMap.get_actions():
		add_user_signal(action + "_pressed")
		add_user_signal(action + "_held")
		add_user_signal(action + "_released")

func _ready():
	set_process(true)
	set_process_input(true)

func _input(event):
	# If the input event is an action, emit the corresponding signal
	for action in InputMap.get_actions():
		if event.is_action_pressed(action):
			emit_signal(action + "_pressed")
			action_stack.append(action)
		elif event.is_action_released(action):
			if action_stack.has(action):
				emit_signal(action + "_released")
				action_stack.remove(action)
