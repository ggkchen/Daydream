extends Button

# Called when the node enters the scene tree
func _ready() -> void:
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Areas/casino.tscn")
