extends KinematicBody2D

var speed = 200
var turn_speed = 3

var velocity = Vector2()
var direction = "right"
onready var sprite = get_node("Body")


func get_input():
	velocity = Vector2()

	if Input.is_action_pressed("up"):
		velocity.y -= speed
		sprite.play("walking")
		
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		direction = "left"
		sprite.set_flip_h(true)
		sprite.play("walking")
		
	if Input.is_action_pressed("down"):
		velocity.y += speed
		sprite.play("walking")
		
	if Input.is_action_pressed("right"):
		velocity.x += speed
		direction = "right"
		sprite.set_flip_h(false)
		sprite.play("walking")	
	
	if velocity.x == 0 and velocity.y == 0:
		sprite.play("idle")

	velocity = velocity.normalized().rotated(rotation) * speed 
	#move_and_slide(velocity)


func _physics_process(delta):

	get_input()
	velocity = move_and_slide(velocity)
