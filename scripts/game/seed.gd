extends Area2D


@onready var animation_player = $AnimationPlayer


@warning_ignore("unused_parameter")
func _on_body_entered(body):
	print("Body entered detected")
	GameManager.add_seeds()
	  # Reproduce el sonido de recogida
	animation_player.play("pickup")
