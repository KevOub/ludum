extends KinematicBody2D

var speed = 0
export var steps = 30
export var seeing_distance = 80

var velocity = Vector2.ZERO


var player = null
var target = null
onready var label = get_node("Label")

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
	var collision = move_and_collide(velocity * delta)
	if collision:
		if "Bullet" in collision.collider.name:
			queue_free()
			
	if player:
		var dist = position.distance_to(player.position)
		if dist < seeing_distance:
			velocity += (position.direction_to(player.position) / steps) * speed
	velocity = move_and_collide(velocity)
	



func _on_Timer_timeout():
	speed = 35
	
