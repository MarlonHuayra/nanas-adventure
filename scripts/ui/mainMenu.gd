extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_exit_button_pressed() -> void:
	var exit_scene = load("res://scenes/ui/exit.tscn").instantiate()
	add_child(exit_scene)
	
	# No es necesario centrar si ya está definido en la escena
	if exit_scene is Window:
		exit_scene.window_modal = true  # Hacer modal si es Window



func _on_play_button_pressed() -> void:
	# Cargar la escena exit.tscn
	var level_Select_scene = load("res://scenes/ui/levelSelect.tscn").instantiate()
	
	# Crear un CanvasLayer para asegurarse de que la nueva escena esté en la capa superior
	var canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)
	
	# Añadir la escena como hija del CanvasLayer para que esté encima de todo
	canvas_layer.add_child(level_Select_scene)
	
	# Asegurarse de que sea un Popup o Window para mostrarla correctamente
	if level_Select_scene is Popup:
		level_Select_scene.popup_centered()  # Mostrar la escena centrada en la pantalla
	elif level_Select_scene is Window:
		level_Select_scene.window_modal = true  # Configurar como modal si es Window
		level_Select_scene.popup_centered()  # Centrar la ventana también
	


func _on_setting_button_pressed() -> void:
	# Cargar la escena exit.tscn
	var settingsMenuScene = load("res://scenes/ui/settingsMenu.tscn").instantiate()
	
	# Crear un CanvasLayer para asegurarse de que la nueva escena esté en la capa superior
	var canvas_layer = CanvasLayer.new()
	add_child(canvas_layer)
	
	# Añadir la escena como hija del CanvasLayer para que esté encima de todo
	canvas_layer.add_child(settingsMenuScene)
	
	# Asegurarse de que sea un Popup o Window para mostrarla correctamente
	if settingsMenuScene is Popup:
		settingsMenuScene.popup_centered()  # Mostrar la escena centrada en la pantalla
	elif settingsMenuScene is Window:
		settingsMenuScene.window_modal = true  # Configurar como modal si es Window
		settingsMenuScene.popup_centered()  # Centrar la ventana también
	
