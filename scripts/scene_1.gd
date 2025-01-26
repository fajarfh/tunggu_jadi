extends Control

@export var animButtons:Array[AnimationPlayer]

@export var buttons:Array[Button]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var j = 0
	for i in GlobalVariable.level_clear_stat.values():
		if i:
			animButtons[j].play("reveal")
			
			if j+1 < GlobalVariable.level_clear_stat.values().size():
				buttons[j+1].disabled = false
		j+=1


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
