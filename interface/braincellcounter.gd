extends Label
var braincells: int:
	get:
		return Player_Controller.brainSacrificeCounter
func _ready() -> void:
		text = str(braincells)
		update_text()
	#call_deferred("_connect_to_player")  # delay so player is loaded first
#
#func _connect_to_player() -> void:
	#var player = get_tree().get_first_node_in_group("player")
	#if player:
		#player.money_changed.connect(update_text)
		#update_text(Player_Controller.brainSacrificeCounter)
	#else:
		#text = "Brain Cells: N/A"

func update_text() -> void:
	while true:
		text = str(braincells)
		await get_tree().create_timer(0.1).timeout
