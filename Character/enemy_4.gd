extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
var movement = 3


func _process(delta):
	if position.x < 1744 or position.x > 1904:
		movement = -1 * movement
	position.x = position.x + movement
	print(movement)
	print(position.x)

#func _on_body_entered(body):
#	print("entered")
#	if body.has_method("hit"):
#		body.hit()
#	
#	queue_free() #or whatever you do to destroy the bullet


#func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
#	print("entered")
#	if body.has_method("hit"):
#		body.hit()
	
#	queue_free() #or whatever you do to destroy the bullet



func _on_body_entered(body):
	print("entered")
	if body.has_method("hit"):
		body.hit()
	
