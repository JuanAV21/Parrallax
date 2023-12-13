extends Node

var last_position = null
var cameraPos = Vector2(-490, 40)
signal label(label : String)
var time = null

# Called when the node enters the scene tree for the first time.
func _ready():
	last_position = Vector2(-490, 40)
	
