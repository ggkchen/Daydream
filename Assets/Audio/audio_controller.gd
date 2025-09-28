extends Node2D

@export var mute: bool = false

func _ready() -> void:
	if not mute:
		play_music()

func play_music() -> void:
	if not mute:
		$bgSFX.play()

func play_jump() -> void:
	if not mute:
		$jumpSFX.play()
