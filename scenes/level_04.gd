extends Node2D

@export var next_escene: String = "res://scenes/level_00.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if $Player.get("is_in_goal"):
		get_tree().change_scene_to_file(next_escene)
	pass
