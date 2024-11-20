extends Area2D
signal hit

@export var speed = 400
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	check_movement(delta)

func check_movement(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_just_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_just_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_just_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_just_pressed("move_left"):
		velocity.x -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos: Vector2) -> void:
	position = pos
	show()
	$CollisionShape2D.disabled = false
