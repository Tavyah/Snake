extends Node

var tile_size : int = 8
var grid_size : int = 16

func _ready() -> void:
	_generate_grid()

func _generate_grid() -> void:
	var grid_dict : Dictionary = {}

	for coor_x in range(0, grid_size + 1):
		for coor_y in range(0, grid_size + 1):
			var coordinates : Vector2 = Vector2(coor_x, coor_y)
			grid_dict[coordinates] = true
	
	print(grid_dict)
