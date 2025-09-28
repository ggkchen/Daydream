extends Button

# Called when the node enters the scene tree
func _ready():
	# Connect the pressed signal to the local function
	self.pressed.connect(_on_pressed)

# Function called when the button is pressed
func _on_pressed():
	# Load the slot machine scene
	var new_scene = load("res://casinoScene/slot_machine_ui.tscn")
	# Switch to the new scene
	get_tree().change_scene_to(new_scene)
