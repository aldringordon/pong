extends CharacterBody2D

var win_size : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
var speed : int
var dir : Vector2
const MAX_Y_VECTOR : float = 0.6

func _ready():
	win_size = get_viewport_rect().size

func new_ball():
	# Randomize start position and direction
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	speed = START_SPEED
	dir = random_direction()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(dir * speed * delta)
	
	var collider
	if collision:
		collider = collision.get_collider()
		$"../BeepSound".play()
		# if ball hits paddle
		if collider == $"../Player":
			speed += ACCEL # increase speed
			dir = new_direction(collider)
			#dir = dir.bounce(collision.get_normal())
		elif collider == $"../CPU":
			speed += ACCEL # increase speed
			dir = dir.bounce(collision.get_normal())
		else: #if hits wall
			dir = dir.bounce(collision.get_normal())

func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()

# to make returning ball off paddle less predictable
func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	# flip horizontal direction
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	
	new_dir.y = (dist / (collider.p_height / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()
