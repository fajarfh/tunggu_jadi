extends Area2D

@export var impulse_strength_max:int = 100
@export var impulse_strength_min:int = 50
var impulse_strength = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass 



func _process(delta):
	pass




func _on_body_entered(body):
	if body is RigidBody2D:
		#print("pak eko?")
		impulse_strength = randi_range(impulse_strength_min,impulse_strength_max)
		body.apply_impulse(Vector2.from_angle(self.rotation_degrees)*impulse_strength) 
