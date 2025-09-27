extends Label

func _ready() -> void:
	# Find the player (added to "player" group in PlayerController.gd)
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.money_changed.connect(update_text)
		update_text(player.money)
	else:
		text = "Money: N/A"  # fallback if no player found

func update_text(new_value: int) -> void:
	text = "Money: %d" % new_value
