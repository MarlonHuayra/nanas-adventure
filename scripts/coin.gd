extends Area2D
var coin = 0 
 # Declaración fuera de cualquier función para que sea una variable de instancia
@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer



@warning_ignore("unused_parameter")
func _on_body_entered(body):
	print("Body entered detected")
	game_manager.add_point()
	  # Reproduce el sonido de recogida
	animation_player.play("pickup")
