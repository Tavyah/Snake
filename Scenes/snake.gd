extends Area2D
signal hit

@export var speed = 50
var screen_size
var velocity = Vector2.ZERO
var current_input

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	check_movement(delta)

func check_movement(delta: float) -> void:
	# Checking if velocity is 0 or not, if not 0, then a direction is already set on same index (x,y). If not a direction set in same index, then u can set a direction
	# Don't want the snake to be able to move towards it's own body.
	if Input.is_action_just_pressed("move_up") and velocity.y == 0:
		velocity = Vector2.ZERO
		velocity.y -= 1
	if Input.is_action_just_pressed("move_down") and velocity.y == 0:
		velocity = Vector2.ZERO
		velocity.y += 1
	if Input.is_action_just_pressed("move_right") and velocity.x == 0:
		velocity = Vector2.ZERO
		velocity.x += 1
	if Input.is_action_just_pressed("move_left") and velocity.x == 0:
		velocity = Vector2.ZERO
		velocity.x -= 1
		
	velocity = velocity.normalized() * speed
	
	position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)

func _on_body_entered(body: Node2D) -> void:
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos: Vector2) -> void:
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	#TODO Add restart game
	print("Im dead")
