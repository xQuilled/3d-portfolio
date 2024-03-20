extends VehicleBody

var max_rpm : float = 500
var max_torque : float = 400
onready var audio = $EngineAudio

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("right", "left") * 0.4, 5 * delta)
	var acceleration = Input.get_axis("down", "up")
	
	
	var rpm = abs($RR.get_rpm())
	$RR.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	rpm = abs($RL.get_rpm())
	$RL.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	audio.pitch_scale = lerp(audio.pitch_scale, (rpm / max_rpm) + 0.2, 0.2)
