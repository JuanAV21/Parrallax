extends PointLight2D
 
var rng = RandomNumberGenerator.new()
var my_random_number = rng.randf_range(2.0, 3.0)
var value = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = value + 0.1
	if int(value) % 2 == 0:
		energy = rng.randf_range(2.0, 3.0)
