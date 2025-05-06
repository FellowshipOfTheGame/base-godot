extends Control

@onready var restart_button = $Restart
@onready var exit_button = $Exit
@onready var menu_button = $Menu


func _ready():
	# Connect button signals
	restart_button.connect("pressed", _on_restart_button_pressed)
	hide()
	exit_button.connect("pressed", _on_exit_button_pressed)
	menu_button.connect("pressed", _on_menu_button_pressed)


func _process(_delta: float) -> void:
	print("Game Over Menu Process")
	if !visible:
		show()
	set_process(false)


func _on_restart_button_pressed() -> void:
	hide()
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
