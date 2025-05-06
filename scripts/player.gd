extends CharacterBody2D

@export var speed: float = 200
@export var jump_speed: float = 600

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready
var gravity_vector: Vector2 = ProjectSettings.get_setting("physics/2d/default_gravity_vector")


func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * gravity_vector.y * delta

	# Handle horizontal movement
	var direction = Vector2.ZERO
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1

	if direction != Vector2.ZERO:
		velocity.x = direction.x * speed
	else:
		velocity.x = 0

	# Handle jump
	if Input.is_action_just_pressed("accept") and is_on_floor():
		velocity.y = -jump_speed

	move_and_slide()
