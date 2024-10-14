# game_manager.gd (autoload)
extends Node

var score = 0
var seeds = 0
var lifes = 3

signal score_changed
signal seeds_changed

func add_point():
	score += 1
	emit_signal("score_changed")  # Emitir señal
	print("you have: ", score, " coins")

func add_seeds():
	seeds += 1
	emit_signal("seeds_changed")  # Emitir señal
	print("you have: ", seeds, " seeds")
