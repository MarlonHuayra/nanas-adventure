extends Control
@onready var playerHUD = $"../../"
# Llamado cuando el nodo entra en el árbol de escenas por primera vez.
func _ready() -> void:
		pass

# Llamado cada frame. 'delta' es el tiempo transcurrido desde el frame anterior.
func _process(delta: float) -> void:
	pass

func _on_restart_level_button_pressed() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_play_level_button_pressed() -> void:
	playerHUD.pauseMenu()
	
	

func _on_main_menu_button_pressed() -> void:
	playerHUD.pauseMenu()
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/ui/mainMenu.tscn")
