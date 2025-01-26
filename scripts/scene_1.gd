extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	print("Button Pressed1")
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_button_pressed2() -> void:
	print("Button Pressed2")
	get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_button_pressed3() -> void:
	print("Button Pressed3")
	get_tree().change_scene_to_file("res://scenes/level3.tscn")


func _on_button_pressed4() -> void:
	print("Button Pressed4")
	get_tree().change_scene_to_file("res://scenes/level4.tscn")
