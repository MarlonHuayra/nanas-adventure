extends Control

@onready var pause_menu: Control = $PlayerHUDCanvasLayer/PauseMenu
var paused = false
@onready var coins_count_label: Label = $PlayerHUDCanvasLayer/CoinsCountLabel
@onready var seeds_count_label: Label = $PlayerHUDCanvasLayer/SeedsCountLabel

func _ready() -> void:
	# Conecta las señales del autoload GameManager usando Callable
	GameManager.connect("score_changed", Callable(self, "_on_score_changed"))
	GameManager.connect("seeds_changed", Callable(self, "_on_seeds_changed"))

	# Actualiza los valores iniciales en el HUD
	update_hud()

func _process(delta: float) -> void:
	pass

func _on_pause_button_pressed() -> void:
	pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

# Funciones llamadas cuando cambian el score o seeds
func _on_score_changed():
	update_hud()

func _on_seeds_changed():
	update_hud()

# Función para actualizar el HUD con los valores actuales
func update_hud():
	coins_count_label.text = str(GameManager.score) + " coins"
	seeds_count_label.text = str(GameManager.seeds) + " seeds"
