extends CharacterBody2D

class_name PlayerController

const SPEED = 500.0
const JUMP_VELOCITY = -2000
const GRAVITY = 6000
const MAX_FALLING_VELOCITY = 2000
var direction := 0
var start_pos = Vector2()
static var brainSacrificeCounter = 10
signal money_changed(new_value: int)
var controls_inverted: bool = false

var money: int = 0   # simple variable

func _ready() -> void:
	add_to_group("player")  # make this node findable by the label
	emit_signal("money_changed", money)  # update UI on start
	start_pos = position
	
	var timer := Timer.new()
	timer.wait_time = 0.5
	timer.autostart = true
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	
	
func _on_timer_timeout() -> void:
# Every 5s, check your var
	if randi_range(0, brainSacrificeCounter) == 0:
		controls_inverted = not controls_inverted
		print("dumby!"+str(brainSacrificeCounter))

	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and velocity.y < MAX_FALLING_VELOCITY:
		# velocity += get_gravity() * delta
		velocity.y += GRAVITY * delta
	#elif not is_on_floor():

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
		#add_money(2)
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction!=0:
		if Input.is_action_pressed("shift") and is_on_floor() and controls_inverted:
			velocity.x = -direction * SPEED * 2
		elif Input.is_action_pressed("shift") and is_on_floor() and not controls_inverted:
			velocity.x = direction * SPEED * 2
		elif controls_inverted:
			velocity.x = -direction * SPEED
		elif Input.is_action_pressed("shift"):
			velocity.x = direction * SPEED *1.5
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#resets character
	if position.y > 1000:
		position = start_pos
		velocity = Vector2.ZERO

	move_and_slide()



# --- Money helpers ---
func add_money(amount: int) -> void:
	money += amount
	emit_signal("money_changed", money)

func spend_money(amount: int) -> bool:
	if money >= amount:
		money -= amount
		emit_signal("money_changed", money)
		return true
	return false
	
	
func minus_money(amount: int) -> void:
	money -= abs(amount)
	emit_signal("money_changed", money)
