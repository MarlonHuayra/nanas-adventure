extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_ok_button_pressed() -> void:
	Firebase.Auth.logout()
	get_tree().change_scene_to_file("res://scenes/ui/authenticationUI.tscn")
	

func _on_cancel_button_pressed() -> void:
	queue_free()
