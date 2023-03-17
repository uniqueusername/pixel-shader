extends OmniLight3D

var origin;

# Called when the node enters the scene tree for the first time.
func _ready():
	origin = get_position();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_position(origin + Vector3(0.0, 10 + 2 * sin(0.001 * Time.get_ticks_msec()), 0));
