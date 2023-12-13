extends Node2D

@onready var _label = $StartLabel
@onready var _sprite = $CloakPlayer
@onready var timer = $CanvasLayer/Counter
@onready var clock = $TimeOut
@onready var campfire1 = $PointLight2D
@onready var campfire2 = $PointLight2D2
@onready var sound = $AudioStreamPlayer2D


var showLabel = true

func _enter_tree():
	pass
	#if Checkpoints.last_position:
		#_sprite.position = Checkpoints.last_position
		
# Called when the node enters the scene tree for the first time.
func _ready():
	timer.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	#print(has_node("res://Scenes/start_label.tscn"))
	#if has_node("res://Scenes/start_label.tscn"):
	if showLabel:
		var time = $Timer.get_time_left() as int
		_label.text = str(time)
		_label.global_position = _sprite.global_position
		_label.global_position.x -= 5
		_label.global_position.y -= 30
		#print(_label.global_position)
		
	if !showLabel:
		timer.global_position = Checkpoints.cameraPos + Vector2(222,222)
		#timer.global_position.x += 222
		#timer.global_position.y += 222
		
		#print(Checkpoints.cameraPos)
		#timer.global_position.y = _sprite.global_position.y - 222
		timer.text = str(clock.get_time_left() as int)
	campfire1.energy
	campfire2.energy


func _on_timer_timeout():
	clock.start()
	timer.show()
	$Start.start()
	_label.text = "Start!"
	_sprite.move = true
	showLabel = false
	sound.play()


func _on_start_timeout():
	_label.hide()


func _on_time_out_timeout():
	_sprite.move = false
	Checkpoints.emit_signal("label", "Game Over")


func _on_exit_body_entered(body):
	_sprite.move = false
	Checkpoints.emit_signal("label", "Game Over")
	Checkpoints.last_position = Vector2(-490, 40)
	_sprite.health = 100
	get_tree().change_scene_to_file("res://Scenes/control.tscn")
	
