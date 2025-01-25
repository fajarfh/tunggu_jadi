extends Node

@export var sfx : AudioStreamPlayer
@export var bgm : AudioStreamPlayer

#daftar SFX
var bop = preload("res://assets/audio/SFX/highUp.ogg")
var bop2 = preload("res://assets/audio/SFX/laser3.ogg")
#var bomb = preload(bomb_res)
#var ui1 = preload(ui1_res)
#var ui2 = preload(ui2_res)
#var jingleWin = preload(jingleWin_res)
#var jingleLose = preload(jingleLose_res)

#daftar BGM
var bgm_main = preload("res://assets/audio/BGM/1. Main Theme.ogg")
var bgm_intro = preload("res://assets/audio/BGM/2. Therapy Room.ogg")
var bgm_lv1 = preload("res://assets/audio/BGM/3. Stage 1.ogg")
var bgm_lv2 = preload("res://assets/audio/BGM/4. Stage 2.ogg")
var bgm_lv3 = preload("res://assets/audio/BGM/5. Stage 3.ogg")
var bgm_lv4 = preload("res://assets/audio/BGM/5. Stage 3.ogg")
var bgm_lv5 = preload("res://assets/audio/BGM/5. Stage 3.ogg")
var bgm_end = preload("res://assets/audio/BGM/8. Main Theme~Vocals.ogg")


func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func playOnce(aset):
	sfx.stream = aset
	sfx.play()

func playBgm(level):
	var aset
	match level:
		"main":
			aset = bgm_main
		"intro":
			aset = bgm_intro
		"level1":
			aset = bgm_lv1
		"level2":
			aset = bgm_lv2
		"level3":
			aset = bgm_lv3
		"level4":
			aset = bgm_lv4
		"level5":
			aset = bgm_lv5
		"end":
			aset = bgm_end
	
	if (!bgm.playing) || (bgm.stream != aset):		
		bgm.stream = aset
		bgm.play()
