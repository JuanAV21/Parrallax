extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Checkpoints.connect("label", setText)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setText(string : String):
	var label = Label.new()
	label.global_position = Checkpoints.cameraPos
	label.text = string
	add_child(label)
	
	
	
