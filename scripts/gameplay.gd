extends Control

@export var source:Node
@export var curtain:Node
@export var secondcurtain:Node
@export var estear:Node
@export var contButton:Node
@export_file("*.tscn") var path_scene

@export_file("*.tscn") var bubble_path

@export_file("*.tscn") var puzzle_paths:Array[String]

@export var puzzle_icons: Array[TextureRect]

@export var time:float


@export var level_name:String

@export var jeda_min = 1.0
@export var jeda_max = 3.0
var jeda = 0.0

@export var speedup_min = -0.005
@export var speedup_max = -0.01
var speedup = -0.01

var puzzle_answered = []
var game_state = true

# Called when the node enters the scene tree for the first time.
func _ready():
		
	
	AudioControl.playBgm(level_name)
	AudioControl.playAmbience(level_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jeda -= delta

	tickTock(delta)
	
	if (jeda <=0) && (game_state):
		
		var bubble_res = load(bubble_path)
		var bubble = bubble_res.instantiate()
		
		speedup = randf_range(speedup_min, speedup_max)
		bubble.gravity_scale = speedup
		source.add_child(bubble)

		if randi_range(0,1) == 0:
			var index = randi_range(0,3)
			var puzzle_res = load(puzzle_paths[index])
			var puzzle = puzzle_res.instantiate()
			puzzle.scale = 0.5 * (bubble.sprite.texture.get_size() * bubble.sprite.scale)/ (puzzle.find_children("Sprite2D", "Sprite2D")[0].texture.get_size()*puzzle.scale)
			
			bubble.add_child(puzzle)
			bubble.puzzle = true
			
			bubble.sendPuzzle.connect(puzzleSelected.bind(index))
			
		else:
			
			bubble.sendBomb.connect(bombActivated)
		
		var random_scale = randf_range(1.0,2.0)
		bubble.scale = Vector2(random_scale,random_scale)
		bubble.position = Vector2(randf_range(-DisplayServer.screen_get_size().x/2,DisplayServer.screen_get_size().x/2),0)		
		jeda = randf_range(jeda_min, jeda_max)

func bombActivated():
	for i in source.get_children():
		i.bubble_death()

func puzzleSelected(index:int):
	if index not in puzzle_answered:
		puzzle_icons[index].modulate.a = 0
		puzzle_answered.append(index)
		AudioControl.playOnce(AudioControl.pop1)
		if puzzle_answered.size() == puzzle_icons.size():
			winDawg()
	else:
		AudioControl.playOnce(AudioControl.pop4)
		
func tickTock(countdown:float):

	if (game_state):
		if curtain.modulate.a < 0.8 :
			curtain.modulate.a += (countdown *0.8)/time		
		else:
			losing()


func _on_timer_timeout():
	game_state = false
	curtain.mouse_filter = Control.MOUSE_FILTER_STOP
	

func losing():
	game_state = false
	curtain.mouse_filter = Control.MOUSE_FILTER_STOP
	
	await get_tree().create_timer(1.0).timeout
	curtain.find_child("AnimationPlayer").play("losing")
	print(curtain.find_child("AnimationPlayer").is_playing())

func winDawg():
	game_state = false
	secondcurtain.mouse_filter = Control.MOUSE_FILTER_STOP
	#await get_tree().create_timer(3.0).timeout
	secondcurtain.find_child("AnimationPlayer").play("winning")
	GlobalVariable.level_clear_stat[level_name] = true
	
	
func winPanel():
	estear.visible = true
	estear.find_child("AnimationPlayer").play("estear")
	await get_tree().create_timer(1.0).timeout
	contButton.visible = true
	contButton.find_child("AnimationPlayer").play("slidein")
	
func pindahScene(path):
	get_tree().change_scene_to_file(path)


func _on_continue_button_pressed():
	pindahScene(path_scene) # Replace with function body.
