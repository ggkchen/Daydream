extends Node2D

@export var mute: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#if not mute:
		#play_music()

func play_music() -> void:
	if not mute:
		$slotMachineRollingSFX.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
 
