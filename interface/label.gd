extends Label

func _ready() -> void:
	call_deferred("_connect_to_player")  # delay so player is loaded first

func _connect_to_player() -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.money_changed.connect(update_text)
		update_text(player.money)
	else:
		text = "Money: N/A"

func update_text(new_value: int) -> void:
	text = str(new_value)
