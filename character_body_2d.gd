
extends CharacterBody2D
@export var speed =280 #TO edit this variable quickly from the Levels
@export var gravity=50
@export var jump=800
var coin = 0
@onready var label_coin =$CanvasLayer/Label
func _physics_process(_delta):
	label_coin.text = str(coin) 
	if not is_on_floor():
		velocity.y+=gravity
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$sprite.flip_h = false
		$sprite.play("run") #Every 'Play' expression represents a movement animation  
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x= -speed
		$sprite.flip_h = true
		$sprite.play("run")
	
	else:
		velocity.x=	move_toward(velocity.x,0,40)
		$sprite.play("default")
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y =-jump
			$sprite.play("jump")
	move_and_slide()
