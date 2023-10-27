extends Node2D



func _enter_tree():
	if Checkpoints.last_position:
		$CloakPlayer.global_position = Checkpoints.last_position
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(has_node("res://Scenes/start_label.tscn"))
	#if has_node("res://Scenes/start_label.tscn"):
	var time = $Timer.get_time_left() as int
	$StartLabel.text = str(time)
	$StartLabel.global_position = $CloakPlayer.global_position
	$StartLabel.global_position.x -= 5
	$StartLabel.global_position.y -= 30
	
	if $StartLabel.text == "0":
		$StartLabel.text = "Start!"
	if $StartLabel.text == "Start!":
		$StartLabel.hide()

	print($StartLabel.text == "Start!")
