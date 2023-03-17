extends Marker3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_meta("carousel")):
		$Camera3D.size = 50;
		set_rotation(Vector3(0.0, Time.get_ticks_msec() * 0.0003, 0.5));
	else:
		$Camera3D.size = 20;
		set_rotation(Vector3(0.0, 0.0, 45));
