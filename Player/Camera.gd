extends Camera

export(NodePath) var player
onready var camera_offset = translation

func _ready():
	player = get_node(player)

func _process(delta):
	translation = player.translation + camera_offset
