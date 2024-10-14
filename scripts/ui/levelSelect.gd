extends Control

# Llamado cuando el nodo entra en el árbol de la escena
func _ready() -> void:
	pass

# Se llama cada frame (opcional, lo puedes quitar si no lo usas)
func _process(delta: float) -> void:
	pass

# Función que se ejecuta cuando se presiona el icono de cerrar
func _on_close_icon_button_pressed() -> void:
	# Liberar esta escena (levelSelect)
	queue_free()  # Esto elimina la instancia de levelSelect sin recargar mainMenu


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/game.tscn")
