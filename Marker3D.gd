extends Marker3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_meta("carousel")):
		$Camera3D.size = 50;
		set_rotation(get_rotation() + 
			Vector3(0.0, 0.001, 0.0));
	else:
		$Camera3D.size = 20;
