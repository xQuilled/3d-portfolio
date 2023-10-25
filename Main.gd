extends Spatial

onready var player = $Player
onready var camera = $Camera
onready var camera_offset = camera.translation

func _enter_tree():
	
	# WEIRD BUG SO I GOTTA DO THIS
	var title = load("res://Text/Title.tscn").instance()
	title.translation.z = 12
	add_child(title)

func _process(delta):
	#camera.translation = lerp(camera.translation, player.translation + Vector3(0,10,8), 5 * delta)
	camera.translation = player.translation + camera_offset
