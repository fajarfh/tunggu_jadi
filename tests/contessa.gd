extends Node2D

@export var source:Node
@export var instance_path:String

var timer = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta
	
	var bubble_res = load("res://rigid_body_2d.tscn")
	var bubble = bubble_res.instantiate()
	
	if timer <=0:
		source.add_child(bubble)
		bubble.position = Vector2(random,0)		
		timer = 3.0
