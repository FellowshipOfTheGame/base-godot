extends Control

@onready var play_button = $Play
@onready var exit_button = $Exit


func _ready():
	# Connect button signals
	hide()
	play_button.connect("pressed", _on_play_button_pressed)
	exit_button.connect("pressed", _on_exit_button_pressed)


func _process(_delta: float) -> void:
	print("Main Menu Process")
	if !visible:
		show()
	set_process(false)


func _on_play_button_pressed() -> void:
	hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/base.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
