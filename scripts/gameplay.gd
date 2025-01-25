extends Node2D

@export var source:Node
@export var curtain:Node
@export var secondcurtain:Node
@export var time:float

var detik : int

@export_file("*.tscn") var instance_path

@export_file("*.tscn") var puzzle_path_1
@export_file("*.tscn") var puzzle_path_2
@export_file("*.tscn") var puzzle_path_3
@export_file("*.tscn") var puzzle_path_4

@export var icon_1:TextureRect
@export var icon_2:TextureRect
@export var icon_3:TextureRect
@export var icon_4:TextureRect

var timer = 1.0
var puzzle_paths = []
var puzzle_icons = []
var puzzle_answered = []

var game_state = true

# Called when the node enters the scene tree for the first time.
func _ready():
	puzzle_paths = [puzzle_path_1, puzzle_path_2, puzzle_path_3, puzzle_path_4]
	puzzle_icons = [icon_1, icon_2, icon_3, icon_4]
	detik = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta
	
	
	tickTock(delta)
	
	if (timer <=0) && (game_state):
		detik += 1
		print(detik)
		var bubble_res = load(instance_path)
		var bubble = bubble_res.instantiate()
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
		timer = 1.0

func bombActivated():
	for i in source.get_children():
		i.queue_free()

func puzzleSelected(index:int):
	if index not in puzzle_answered:
		puzzle_icons[index].modulate.a = 0
		puzzle_answered.append(index)
		if puzzle_answered.size() == puzzle_icons.size():
			winDawg()
	



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
	
