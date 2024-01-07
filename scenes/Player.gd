extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -650.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
@export var is_in_goal:bool = false:
	get:
		return is_in_goal

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var init_position
var ray_cast

func _ready():
	init_position = position
	is_in_goal = false
	pass

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func _process(delta):
	if $GoalCollider.is_colliding():
		is_in_goal = true
	if $LavaCOllider.is_colliding():
		position = init_position
	pass
