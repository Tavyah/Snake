extends Area2D

@export var speed = 0.1
#var screen_size
var velocity = Vector2.ZERO
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var grid: TileMapLayer = $"../Grid"
@onready var game: Node2D = $".."
var direction : Vector2 = Vector2.ZERO
var is_moving : bool = false

func _ready() -> void:
	#screen_size = get_viewport_rect().size
	position = position.snapped(Vector2.ONE * grid.grid_size)
	position.x += grid.tile_size / 2
	print(position)

func _process(delta: float) -> void:
	check_movement(delta)
"""
func check_movement(delta: float) -> void:
	# Checking if velocity is 0 or not, if not 0, then a direction is already set on same index (x,y). If not a direction set in same index, then u can set a direction
	# Don't want the snake to be able to move towards it's own body.
	if Input.is_action_just_pressed("up") and velocity.y == 0:
		sprite_2d.set_rotation_degrees(0)
		velocity = Vector2.ZERO
		velocity.y -= 1
	if Input.is_action_just_pressed("down") and velocity.y == 0:
		sprite_2d.set_rotation_degrees(180)
		velocity = Vector2.ZERO
		velocity.y += 1
	if Input.is_action_just_pressed("right") and velocity.x == 0:
		sprite_2d.set_rotation_degrees(90)
		velocity = Vector2.ZERO
		velocity.x += 1
	if Input.is_action_just_pressed("left") and velocity.x == 0:
		sprite_2d.set_rotation_degrees(-90)
		velocity = Vector2.ZERO
		velocity.x -= 1
		
	velocity = velocity.normalized() * speed
	
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
"""

func check_movement(delta) -> void:
	if (Input.is_action_just_pressed("up") and direction != Vector2.DOWN):
		position += Vector2.UP * grid.tile_size
		direction = Vector2.UP
		is_moving = true
	if Input.is_action_just_pressed("down") and direction != Vector2.UP:
		position += Vector2.DOWN * grid.tile_size
		direction = Vector2.DOWN
		is_moving = true
	if Input.is_action_just_pressed("left") and direction != Vector2.RIGHT:
		position += Vector2.LEFT * grid.tile_size
		direction = Vector2.LEFT
		is_moving = true
	if Input.is_action_just_pressed("right") and direction != Vector2.LEFT:
		position += Vector2.RIGHT * grid.tile_size
		direction = Vector2.RIGHT
		is_moving = true
	
	#print(position)
	
	var new_position : Vector2 = grid.move_to_grid_tile(position, direction)
	position = new_position
	
func _on_body_entered(body: Node2D) -> void:
	#$CollisionShape2D.set_deferred("disabled", true)
	game.add_to_score()
	body.queue_free()
	
func start(pos: Vector2) -> void:
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	#TODO Add restart game
	print("Im dead")
