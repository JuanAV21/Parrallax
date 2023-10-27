extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var health = 100

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _sprite = $"Player"

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		#_animated_sprite.play("Run")
		_animated_sprite.set_flip_h(false)
	if Input.is_action_just_pressed("ui_left"):
		#_animated_sprite.play("Run")
		_animated_sprite.set_flip_h(true)
	#else:
		#_animated_sprite.stop()
		#get_node("AnimatedSprite2D").set_flip_h(false)
		
		


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)



	move_and_slide()


#func _on_enemy_body_entered(body):
	#hide()
	#print("touch")
	#$CollisionShape2D.set_deferred("disabled", true)
func hit():
	print("hit: ", self.health)
	self.health -= 20
	if self.health == 0:
		queue_free()


func _on_start_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("player is in start")


func _on_end_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("player is at the end")



func _on_enemy_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("player got attacked")
