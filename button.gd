extends Button

func _ready():
   
	self.visible = false
	
	$Timer.timeout.connect(_on_Timer_timeout)
   
	self.pressed.connect(_on_NextButton_pressed)

func _on_Timer_timeout():
   
	self.visible = true

func _on_NextButton_pressed():
   
	get_tree().change_scene_to_file("res://scene_berikutnya.tscn")
