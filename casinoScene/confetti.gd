extends Node2D

@onready var confetti_particles: GPUParticles2D = $CONFETTII
@onready var confetti_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

func play_confetti(duration: float = 3.0) -> void:
		confetti_particles.emmitt()
		confetti_sound.play()
		await get_tree().create_timer(duration).timeout
		confetti_particles.emitting = false
		push_error("Confetti particles not found!")
		print("wahh")
