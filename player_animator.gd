extends Node
@export var playercontroller : PlayerController
@export var animationplayer : AnimationPlayer
@export var sprite : Sprite2D

func _process(_delta):
	if playercontroller.direction == 1 and playercontroller.controls_inverted:
		sprite.flip_h = true
	elif playercontroller.direction == -1 and playercontroller.controls_inverted:
		sprite.flip_h = false
	elif playercontroller.direction == 1:
		sprite.flip_h = false
	elif playercontroller.direction == -1:
		sprite.flip_h = true
	if Input.is_action_pressed("space"):
		animationplayer.play("jump")
	if abs(playercontroller.velocity.x) > 0.0 and Input.is_action_pressed("shift"):
		animationplayer.play("run")
	elif abs(playercontroller.velocity.x) > 0.0:
		animationplayer.play("walk")
	elif playercontroller.velocity.y>0:
		animationplayer.play("falling")
	else:
		animationplayer.play("idle")
	
