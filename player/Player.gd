extends KinematicBody2D

var speed = 100
var turn_speed = 3
var Bullet = preload("res://player/Bullet.tscn")
var velocity = Vector2()
var direction = "right"
onready var sprite = get_node("Body")

export (String,FILE,"*.tscn") var QuitMenu 

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("Escape"):
		get_tree().change_scene(QuitMenu)
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
	
	if Input.is_action_just_pressed("mouse_click"):
		shoot()
		
	if velocity.x == 0 and velocity.y == 0:
		if sprite.animation == "attack" and sprite.frame == 3:
			sprite.play("idle")
		elif sprite.animation != "attack":
			sprite.play("idle")


	velocity = velocity.normalized().rotated(rotation) * speed 
	#move_and_slide(velocity)

func shoot():
	var b = Bullet.instance()
	var dir = get_local_mouse_position()
	
	b.start(self.global_position, dir.angle())
	get_parent().add_child(b)
	
# warning-ignore:unused_argument
func _physics_process(delta):
	get_input()
	if $HealthBar.current == 0:
		# DEATH MODE
		pass
	
	var collision  = move_and_collide(velocity * delta)
	if collision:
		print($Health.current)
		if "Springer" in collision.collider.name:
			$HealthBar.set_current(2)
		if "Springer" in collision.collider.name:
			$HealthBar.set_current(2)
				
		if "Chest" in collision.collider.name:
			get_parent().get_node("GUI/Score").adjust(100)


	
