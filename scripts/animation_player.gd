extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if has_animation("new_animation"):
		play("new_animation")
		
	if has_animation("new_animation2"):
		play("new_animation2")
		
	if has_animation("new_animation3"):
		play("new_animation3")
		
	if has_animation("new_animation5"):
		play("new_animation5")
		
	if has_animation("new_animation6"):
		play("new_animation6")
		
	if has_animation("new_animation7"):
		play("new_animation7")
	


func _on_next_button_pressed() -> void:
	print("Button Pressed")
