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
	var levelSelectScene = load("res://scenes/ui/levelSelect.tscn").instantiate()
	add_child(levelSelectScene)
	
	# No es necesario centrar si ya está definido en la escena
	if levelSelectScene is Window:
		levelSelectScene.window_modal = true  # Hacer modal si es Window


func _on_setting_button_pressed() -> void:
	var settingsMenuScene = load("res://scenes/ui/settingsMenu.tscn").instantiate()
	add_child(settingsMenuScene)
	
	# No es necesario centrar si ya está definido en la escena
	if settingsMenuScene is Window:
		settingsMenuScene.window_modal = true  # Hacer modal si es Window
	


func _on_button_pressed() -> void:
	pass # Replace with function body.


func _on_news_button_pressed() -> void:
	var news_scene = load("res://scenes/ui/news.tscn").instantiate()
	add_child(news_scene)
	
	# No es necesario centrar si ya está definido en la escena
	if news_scene is Window:
		news_scene.window_modal = true  # Hacer modal si es Window


func _on_shop_button_pressed() -> void:
	var shoppingMenuScene = load("res://scenes/ui/shoppingMenu.tscn").instantiate()
	add_child(shoppingMenuScene)
	
	# No es necesario centrar si ya está definido en la escena
	if shoppingMenuScene is Window:
		shoppingMenuScene.window_modal = true  # Hacer modal si es Window
