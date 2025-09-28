extends CharacterBody2D

class_name PlayerController

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = 0

#sets start position
var start_pos = Vector2()
func _ready():
	start_pos = position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#resets character
	if position.y > 300:
		position = start_pos
		velocity = Vector2.ZERO
	
	move_and_slide()
