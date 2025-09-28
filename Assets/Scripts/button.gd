extends Button

# Called when the node enters the scene tree
func _ready() -> void:
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	FadeScreen.transition()
	await FadeScreen.transition_finished
	# might have to comment out the last 2 lines please work !!
	get_tree().change_scene_to_file("res://casinoScene/slot_machine_ui.tscn")
