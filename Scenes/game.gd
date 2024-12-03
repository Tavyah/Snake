extends Node2D

var score : int = 0
var game_started : bool = false
@onready var grid: TileMapLayer = $Grid

func _ready() -> void:
	new_game()

func new_game() -> void:
	score = 0
	$Hud.get_node("ScoreLabel").text = "Score: " + str(score)

func add_to_score() -> void:
	score += 1
	$Hud.get_node("ScoreLabel").text = "Score: " + str(score) 
