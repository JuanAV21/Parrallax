extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = Checkpoints.cameraPos * delta
	#print(get_color())
	color = get_color()
	set_color(Color(color[0], color[1], color[2], float(100 - Checkpoints.time)/100))
	#print(float(100 - Checkpoints.time)/100)
