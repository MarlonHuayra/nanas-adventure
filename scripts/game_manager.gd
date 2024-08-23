extends Node

var score = 0
@onready var score_label = $ScoreLabel

func add_point():
	score += 1
	score_label.text = "You colected " + str(score) + " coins!"
	print("you have: ", score, " coins")


func _on_logout_button_pressed():
	Firebase.Auth.logout()
	get_tree().change_scene_to_file("res://scenes/authentication.tscn")
