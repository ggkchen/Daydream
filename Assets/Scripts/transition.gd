extends Area2D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"): 
		FadeScreen.transition()
		await FadeScreen.transition_finished
		# might have to comment out the last 2 lines please work !!
		get_tree().change_scene_to_file("res://casinoScene/slot_machine_ui.tscn")
