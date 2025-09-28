extends Node
@export var playercontroller : PlayerController
@export var animationplayer : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	if playercontroller.direction == 1:
		sprite.flip_h = false
	elif playercontroller.direction == -1:
		sprite.flip_h = true
	if abs(playercontroller.velocity.x) > 0.0:
		animationplayer.play("walk")
	else:
		animationplayer.play("idle")
