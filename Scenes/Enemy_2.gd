extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.x > 1000:
		queue_free()

func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit()
	
	queue_free() #or whatever you do to destroy the bullet

