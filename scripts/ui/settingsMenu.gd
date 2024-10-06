extends Control

@onready var music_button: Button = $SettingsMenuCanvasLayer/SettingsPanelContainer/SettingsVBoxContainer/MarginContainer/HBoxContainer/MusicButton
@onready var sound_button: Button = $SettingsMenuCanvasLayer/SettingsPanelContainer/SettingsVBoxContainer/MarginContainer/HBoxContainer/SoundButton
@onready var notifications_button: Button = $SettingsMenuCanvasLayer/SettingsPanelContainer/SettingsVBoxContainer/NotificationsButton

# Referencia al autoload global llamado "Music"
var music = Music

# Texturas para el botón Music, Sound. Notifications
var icon_music_on: Texture
var icon_music_off: Texture
var icon_sound_on: Texture
var icon_sound_off: Texture
var icon_notification_on: Texture
var icon_notification_off: Texture

func _ready() -> void:
	# Modo toggle para el botón
	music_button.toggle_mode = true
	sound_button.toggle_mode = true
	notifications_button.toggle_mode = true
	
	# Carga las texturas
	icon_music_on = music_button.icon
	icon_sound_on = sound_button.icon
	icon_notification_on = notifications_button.icon
	
	icon_music_off = preload("res://assets/images/2D Platformer Tileset/Simple UI Pack/Sprites/Icons/icon_small_music_off.png")
	icon_sound_off = preload("res://assets/images/2D Platformer Tileset/Simple UI Pack/Sprites/Icons/icon_small_sound_off.png")
	icon_notification_off = preload("res://assets/images/2D Platformer Tileset/Simple UI Pack/Sprites/Icons/icon_small_notificationoff.png")
	# Inicialmente, ícono de música encendida
	music_button.icon = icon_music_on
	

# Controla el cambio de icono en el botón de música
func _on_music_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		music_button.icon = icon_music_off
		if music:
			music.stop()  # Detiene la música global
			# print("Música apagada")
	else:
		music_button.icon = icon_music_on
		if music:
			music.play()  # Reproduce la música global
			# print("Música encendida")


func _on_close_icon_button_pressed() -> void:
	queue_free()


func _on_sound_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		sound_button.icon = icon_sound_off
		
	else:
		sound_button.icon = icon_sound_on
		



func _on_notifications_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		notifications_button.icon = icon_notification_off
		
	else:
		notifications_button.icon = icon_notification_on
		
