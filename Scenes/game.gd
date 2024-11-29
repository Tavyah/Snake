extends Node2D

var score : int = 0
var game_started : bool = false

var cells : int = 10
var cell_size : int = 8

func _ready() -> void:
	new_game()

func new_game() -> void:
	score = 0
	$Hud.get_node("ScoreLabel").text = "Score: " + str(score)
