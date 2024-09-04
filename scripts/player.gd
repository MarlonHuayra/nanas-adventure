extends CharacterBody2D


const SPEED = 210.0
const JUMP_VELOCITY = -650

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#get the input direction -1 , 0 , 1
	var direction = Input.get_axis("move_left", "move_right")
	
	
	# Flip the sprite based on direction
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#if direction != 0:
	#animated_sprite_2d.flip_h = direction < 0
	
	# Handle animations if needed
	if is_on_floor():
		if direction != 0:
			animated_sprite.play("nanaRun")  # Assuming you have a "run" animation
		else:
			animated_sprite.play("nanaIdle")  # Assuming you have an "idle" animation
	else:
		animated_sprite.play("nanaJump")  # ssuming you have a "jump" animation

	#apply movement
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
