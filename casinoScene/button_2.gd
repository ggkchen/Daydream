#extends Button
#@onready var my_button = $sacrificebraincellsbutton
## Called when the node enters the scene tree
#func _ready() -> void:
	#pressed.connect(_on_button_pressed)
#
#func _on_button_pressed() -> void:
	#if Player_Controller.brainSacrificeCounter<=1:
		#text = "You don't have any more brain cells!"
		#await get_tree().create_timer(2.0).timeout
		#text = "Sacrifice Brain Cells"
	#else:
		#Player_Controller.brainSacrificeCounter-=1
		#Player_Controller.add_money(100)



extends Button

func _ready() -> void:
	text = "Sacrifice Brain Cells"

func _pressed() -> void:
	if Player_Controller.brainSacrificeCounter <= 1:
		text = "You don't have any more brain cells!"
		await get_tree().create_timer(2.0).timeout
		text = "Sacrifice Brain Cells"
	else:
		Player_Controller.brainSacrificeCounter -= 1
		Player_Controller.add_money(100)
		text = "Sacrificed!"
		#Brain_cell_counter.update_text(str(Player_Controller.brainSacrificeCounter))
		await get_tree().create_timer(1.0).timeout
		text = "Sacrifice Brain Cells"
