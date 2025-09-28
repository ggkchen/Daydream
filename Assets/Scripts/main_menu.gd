extends Control

func _ready():
	pass

func _on_play_pressed() -> void:
	print("hello world!")
	FadeScreen.transition()
	await FadeScreen.transition_finished
	# might have to comment out the last 2 lines please work !!
	get_tree().change_scene_to_file("res://Assets/Scenes/Areas/casino.tscn")


func _on_instructions_pressed() -> void:
	print("bye world!")
	get_tree().change_scene_to_file("res://Assets/Scenes/Areas/instructions.tscn")
