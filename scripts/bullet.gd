class_name Bullet extends Area2D

var speed: float = 600
var direction: Vector2 = Vector2.UP  # Default direction to the right


func _ready() -> void:
	# Connect the body_entered signal to detect collisions
	connect("body_entered", _on_body_entered)


func _process(delta: float) -> void:
	# Move the bullet in the specified direction
	position += direction * speed * delta

	# Check if the bullet is out of bounds and queue for deletion
	if (
		position.x < 0
		or position.x > get_viewport().size.x
		or position.y < 0
		or position.y > get_viewport().size.y
	):
		queue_free()


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		get_tree().paused = true
