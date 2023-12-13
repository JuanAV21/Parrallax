extends Control
@export var labels = PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	Checkpoints.connect("label", setText)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setText(string : String):
	var label_instance : Label = labels.instantiate()
	node.add_child(label_instance)
	label_instance.text = string

