extends Control

@export var animButtons:Array[AnimationPlayer]
@export var buttons:Array[Button]
@export var pics:Array[TextureRect]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var j = 0
	var k = 0
	
	if AudioControl.amb.playing:
		#var tween = get_tree().create_tween()
		#tween.tween_property(AudioControl.amb, "volume_db", linear_to_db(0.0), 0.5)
		#await tween.finished
		
		AudioControl.amb.stop()
		
	#AudioControl.playBgm("intro")
	
	for i in GlobalVariable.level_clear_stat.values():
		if i:
			if j+1 < GlobalVariable.level_clear_stat.values().size():
				buttons[j+1].disabled = false
				pics[j+1].visible = true
				#animButtons[j+1].play("sil_reveal")
			
			k += 1
		j += 1
	
	if k > 0:	
		for i in range(0,k):
			if i-1 >= 0:
				pics[i-1].visible = true
				pics[i-1].modulate = Color.WHITE
			
			if i == k-1:
				animButtons[i].play("reveal")			
	
	animButtons[k].play("sil_reveal")
			

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


func _on_button_pressed5():
	print("Button Pressed5")
	get_tree().change_scene_to_file("res://scenes/level5.tscn")
