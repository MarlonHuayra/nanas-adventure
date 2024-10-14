extends CharacterBody2D

var boomerangAnimation = preload("res://scenes/characters/boomerang.tscn")
@onready var boomerang_marker_2d: Marker2D = $boomerangMarker2D
var boomerang_position

const SPEED = 210.0
const JUMP_VELOCITY = -600
const TERMINAL_VELOCITY = 1000  # Velocidad máxima en la caída
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var jump_count = 0  # Contador para el número de saltos
const MAX_JUMPS = 2  # Permitir dos saltos (uno en el suelo, uno en el aire)

@onready var animated_sprite = $AnimatedSprite2D

enum State {Idle, Run, Jump, Shoot}
var current_state = State.Idle

func _ready() -> void:
	current_state = State.Idle
	boomerang_position = boomerang_marker_2d.position

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	handle_input(delta)
	player_boomerang_position()
	player_shooting(delta)
	
	move_and_slide()
	handle_animations()

# Aplicar gravedad
func apply_gravity(delta: float) -> void:
	if !is_on_floor():
		velocity.y = clamp(velocity.y + gravity * delta, -INF, TERMINAL_VELOCITY)

# Manejo de la entrada del jugador
func handle_input(delta: float) -> void:
	var direction = imput_movement()
	
	# Si está en el suelo, restablecer el contador de saltos
	if is_on_floor():
		jump_count = 0  # Resetea el salto al tocar el suelo
		handle_ground_movement(direction)
	else:
		handle_air_movement(direction, delta)  # Pasa delta aquí
	
	# Manejar el salto y el doble salto
	handle_jump()

	# Cambiar la dirección del sprite
	if direction != 0:
		animated_sprite.flip_h = direction < 0

# Manejo del movimiento en el suelo
func handle_ground_movement(direction: float) -> void:
	if direction != 0:
		current_state = State.Run
		velocity.x = direction * SPEED
	else:
		current_state = State.Idle
		velocity.x = move_toward(velocity.x, 0, SPEED)

# Manejo del movimiento en el aire (con delta)
func handle_air_movement(direction: float, delta: float) -> void:
	if direction != 0:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED * delta)

# Manejo del salto y doble salto
func handle_jump() -> void:
	# Si se presiona la tecla de salto y aún quedan saltos disponibles
	if Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS:
		velocity.y = JUMP_VELOCITY
		current_state = State.Jump
		jump_count += 1  # Incrementar el contador de saltos

#Ataque boomerang
func player_shooting(delta: float):
	var direction = imput_movement()
	
	if direction != 0 and Input.is_action_just_pressed("shoot"):
		var boomerang_intance = boomerangAnimation.instantiate() as Node2D
		boomerang_intance.direction = direction
		boomerang_intance.global_position = boomerang_marker_2d.global_position
		get_parent().add_child(boomerang_intance)
		
		
		current_state = State.Shoot
		#print("shooting")
	
func player_boomerang_position():
	var direction =imput_movement()
	if direction > 0:
		boomerang_marker_2d.position.x = boomerang_position.x
	elif  direction < 0:
		boomerang_marker_2d.position.x = -boomerang_position.x
# Manejo de animaciones
func handle_animations() -> void:
	if current_state == State.Idle:
		animated_sprite.play("nanaIdleB")
	elif current_state == State.Run and animated_sprite.animation != ("nanaShootB"):
		animated_sprite.play("nanaRunB")
	elif current_state == State.Jump:
		animated_sprite.play("nanaJumpB")
	elif current_state == State.Shoot:
		animated_sprite.play("nanaShootB")
		
func imput_movement():
	var direction : float = Input.get_axis("move_left", "move_right")
	return direction
