extends GPUParticles2D


func play_confetti(duration: float = 3.0) -> void:
		emitting = true
		#confetti_sound.play()
		await get_tree().create_timer(duration).timeout
		emitting = false
		#push_error("Confetti particles not found!")
		#print("wahh")
