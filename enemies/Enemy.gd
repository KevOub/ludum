extends KinematicBody2D

var speed = 10
var velocity = Vector2.ZERO


var player = null
var target = null

func _ready():
	player = get_node("../Player")
	

#func _physics_process(delta):
#	if player != null:
#		target = player.get_position()
#		velocity = (target - self.position).normalized() * speed
#		velocity = move_and_slide(velocity)
#		print(target)



func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * speed

	velocity = move_and_collide(velocity)


func _on_Area2D_body_entered(body):

	print("FIRE!")
	player = body

func _on_Area2D_body_exited(body):
	player = null
