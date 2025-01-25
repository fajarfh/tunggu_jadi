extends RigidBody2D


var timer = 0.5
var dir = [-1,1]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	timer -= delta
	#lerp_angle(0, deg_to_rad(randf_range(-60,60)), .1)
	#position = position + position.slerp(Vector2(0.0,0.0), 2.0 * delta)
	#self.rotate(1*delta)
	if timer <=0:
			
		##await get_tree().create_timer(1.0).timeout
		#
		#print(rotation)
		#self.apply_impulse(Vector2.LEFT*delta*10000)
		#if (transform.x < Vector2(50.0,0)) && (transform.x > Vector2(0,0)):
			#print(get_viewport_rect().size)
			#self.apply_impulse(Vector2.RIGHT*delta*10000)
		#else:
			#
		apply_impulse(Vector2.LEFT*delta*5000)
		#*randi_range(-1,1)*delta*5000)
		
		
		
		print(self.linear_velocity)
		timer = 1.0
		
func _on_body_entered(body):
	if body.name == "Wall":
		print("kena")
		apply_impulse(Vector2.RIGHT*50)
		

func on_click_mouse():
	self.queue_free()


func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		on_click_mouse()
