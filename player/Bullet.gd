extends KinematicBody2D

var speed = 126
var velocity = Vector2()
var off = false

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	
	var collision = move_and_collide(velocity * delta)
	rotation += 0.124
	if collision and not off:
		var timer = get_node("DeathClock")

		if "Springer" in collision.collider.name :
			get_parent().get_node("GUI/Score").adjust(5)
			off = true
			self.hide()
		if "Groot" in collision.collider.name :
			get_parent().get_node("GUI/Score").adjust(5)
			off = true
			self.hide()
		
		else:
			off = true

func _on_Timer_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	print(body)
