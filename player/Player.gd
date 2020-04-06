extends KinematicBody2D

var speed = 200
var turn_speed = 3

const ACCELERATION = Vector2(12,8)
const MAX_VELOCITY = Vector2(800,40)

var velocity = Vector2()
var old_velocity = Vector2()
onready var sprite = get_node("Body")


func get_input():
	old_velocity = velocity
	velocity = Vector2()

	if Input.is_action_pressed("up"):
		velocity.y -= speed
				
	if Input.is_action_pressed("left"):
		rotation_degrees -= turn_speed
		
	if Input.is_action_pressed("down"):
		velocity.y += speed
		
	if Input.is_action_pressed("right"):
		
		rotation_degrees += turn_speed
		
	velocity = velocity.normalized().rotated(rotation) * speed 
	move_and_slide(velocity)


func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
