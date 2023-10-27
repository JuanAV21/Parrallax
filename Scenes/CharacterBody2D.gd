extends CharacterBody2D
var gravity = 10


var speed = 32

func _process(delta):
	move_character()
	
func move_character():
	velocity.x = -speed
	velocity.y += gravity
	
	move_and_slide()
	

	
