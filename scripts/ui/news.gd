extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_website_button_pressed() -> void:
	pass # Replace with function body.


func _on_github_button_pressed() -> void:
	var url = "https://github.com/MarlonHuayra/nanas-adventure.git"
	OS.shell_open(url)  # Abre la URL en el navegador predeterminado
 	# Abre la URL en el navegador predeterminado
	


func _on_close_button_pressed() -> void:
	queue_free()
