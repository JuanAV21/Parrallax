extends Area2D



func _on_body_entered(body):
	Checkpoints.last_position = global_position
	print("checkpoint saved")
