extends RigidBody2D

@export var sprite:Sprite2D

var timer = 0.5
var dir = [-1,1]
var tergeser = false

var puzzle = false

signal sendBomb()
signal sendPuzzle()

# Called when the node enters the scene tree for the first time.
func _ready():
	#var random_scale = randf_range(1.5,2.0)
	#var tween = get_tree().create_tween()
	#tween.tween_property(self, "scale", Vector2(random_scale,random_scale), random_scale*1.5)
	#tween.play()# Replace with function body.
	#tween.tween_callback(call_back_tween_scale.bind(Vector2(random_scale,random_scale)))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	add_constant_torque(delta*randf_range(-200,200))
	
	
	
	#scale += Vector2(1.5, 1.5)
	#scale = lerp(scale, Vector2(2.0,2.0), delta*10)
	#timer -= delta
	#lerp_angle(0, deg_to_rad(randf_range(-60,60)), .1)
	##position = position + position.slerp(Vector2(0.0,0.0), 2.0 * delta)
	##self.rotate(1*delta)
	#if timer <=0:
			#
		###await get_tree().create_timer(1.0).timeout
		##
		##print(rotation)
		##self.apply_impulse(Vector2.LEFT*delta*10000)
		##if (transform.x < Vector2(50.0,0)) && (transform.x > Vector2(0,0)):
			##print(get_viewport_rect().size)
			##self.apply_impulse(Vector2.RIGHT*delta*10000)
		##else:
			##
		#apply_impulse(Vector2.LEFT*randi_range(-1,1)*50)
#
		#print(self.linear_velocity)
		#timer = 1.0
		
func _on_body_entered(body):
	match body.name:
		"wall_left":
			#print("kiri")
			apply_impulse(Vector2.RIGHT*50)	
		"wall_right":
			#print("kanan")
			apply_impulse(Vector2.LEFT*50)	
		"wall_up":
			#print("kiri")
			queue_free()
		"conveyor":
			tergeser = true
		

func on_click_mouse():
	self.queue_free()
	if !puzzle:
		sendBomb.emit()
	else:
		sendPuzzle.emit()
		
	


func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("left_click"):
		on_click_mouse()
		
func call_back_tween_scale(newScale:Vector2):
	self.scale = newScale
