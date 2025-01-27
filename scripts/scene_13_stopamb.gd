extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if AudioControl.amb.playing:
		var tween = get_tree().create_tween()
		tween.tween_property(AudioControl.amb, "volume_db", linear_to_db(0.0), 0.5)
		await tween.finished
		
		AudioControl.amb.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
