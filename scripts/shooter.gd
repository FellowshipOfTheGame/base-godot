extends RigidBody2D

@export var bullet_speed: float = 600

# Preload the bullet scene
var bullet_scene = preload("res://scenes/bullet.tscn")
# Timer to handle periodic shooting
var shoot_timer: Timer


func _ready():
	# Initialize the timer
	shoot_timer = Timer.new()
	shoot_timer.wait_time = 1.0  # Adjust the interval as needed
	shoot_timer.one_shot = false
	shoot_timer.connect("timeout", _shoot_bullet)
	add_child(shoot_timer)
	shoot_timer.start()


# Function to shoot a bullet
func _shoot_bullet():
	if bullet_scene:
		var bullet = bullet_scene.instantiate()
		bullet.position = global_position
		bullet.speed = bullet_speed
		bullet.direction = Vector2.UP
		get_parent().add_child(bullet)
