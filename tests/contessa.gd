extends Node2D

@export var source:Node
@export_file("*.tscn") var instance_path

var timer = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta
	
	var bubble_res = load(instance_path)
	var bubble = bubble_res.instantiate()
	
	if timer <=0:
		source.add_child(bubble)
		bubble.position = Vector2(randf_range(-DisplayServer.screen_get_size().x/2,DisplayServer.screen_get_size().x/2),0)		
		timer = 3.0
