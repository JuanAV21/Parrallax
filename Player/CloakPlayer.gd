extends CharacterBody2D


const SPEED = 90.0
const JUMP_VELOCITY = -400.0
var health = 100
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("walk")
		_animated_sprite.set_flip_h(false)
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.play("walk")
		_animated_sprite.set_flip_h(true)
	else: _animated_sprite.play("idle")

var move = false

func _physics_process(delta):
	# Add the gravity.
	if move == true:
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

func _ready():
	global_position = Checkpoints.last_position
	
	
#@onready var start = $Area2D
#@onready var player = $CloackPLayer



func _on_timer_timeout():
	#global_position = Vector2(-490, 40)
	global_position = Checkpoints.last_position
	#$StartLabel.queue_free()
	
func hit():
	print("hit: ", self.health)
	self.health -= 20
	if self.health == 0:
		health = 80
		global_position = Checkpoints.last_position
		get_tree().reload_current_scene()

