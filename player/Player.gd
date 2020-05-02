extends KinematicBody2D

var speed = 100
var turn_speed = 3

var velocity = Vector2()
var direction = "right"
onready var sprite = get_node("Body")
	
func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("Escape"):
		get_tree().quit()
	if Input.is_action_pressed("up"):
		if Input.is_action_pressed("action_1"):
			velocity.y = 0
			sprite.play("attack")
		else:
			velocity.y -= speed
			sprite.play("walking")
		
	if Input.is_action_pressed("left"):
		if Input.is_action_pressed("action_1"):
			velocity.x = 0
			sprite.play("attack")
		else:
			velocity.x -= speed
			direction = "right"
			sprite.set_flip_h(true)
			sprite.play("walking")
		
	if Input.is_action_pressed("down"):
		if Input.is_action_pressed("action_1"):
			velocity.y = 0
			sprite.play("attack")
		else:
			velocity.y += speed
			sprite.play("walking")
		
	if Input.is_action_pressed("right"):
		if Input.is_action_pressed("action_1"):
			velocity.x = 0
			sprite.play("attack")
		else:
			velocity.x += speed
			direction = "right"
			sprite.set_flip_h(false)
			sprite.play("walking")	
	
	
	if Input.is_action_pressed("action_1"):
		sprite.play("attack")
		
	if velocity.x == 0 and velocity.y == 0:
		if sprite.animation == "attack" and sprite.frame == 3:
			sprite.play("idle")
		elif sprite.animation != "attack":
			sprite.play("idle")


	velocity = velocity.normalized().rotated(rotation) * speed 
	#move_and_slide(velocity)


# warning-ignore:unused_argument
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	
	
		

