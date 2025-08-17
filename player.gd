extends StaticBody2D

var win_height : int
var p_height : int
var top_position_limit : int
var bottom_position_limit : int

var target_y : float   # where the paddle should move to
#var game_started := false   # gate for input

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	top_position_limit = p_height / 2
	bottom_position_limit = win_height - p_height / 2
	position.y = 324
	# start at current position
	target_y = 324

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# only allow paddle input after game starts
	#if not game_started:
	#	return
	
	# keyboard movement overrides
	if Input.is_action_pressed("ui_up"):
		target_y = max(top_position_limit, position.y - get_parent().PADDLE_SPEED * delta)
	elif Input.is_action_pressed("ui_down"):
		target_y = min(bottom_position_limit, position.y + get_parent().PADDLE_SPEED * delta)

	# mouse click sets target_y
	#if Input.is_action_just_pressed("click"):   # bind "click" to left mouse in Input Map
		#target_y = get_viewport().get_mouse_position().y

	# smoothly move toward target_y
	position.y = move_toward(
		position.y, 
		clamp(target_y, top_position_limit, bottom_position_limit), 
		get_parent().PADDLE_SPEED * delta
	)

func start_game() -> void:
	position.y = 324
	target_y = 324
	#game_started = true

func stop_game() -> void:
	#game_started = false
	pass

# using this to move character around because otherwise it moves when you click UI buttons idfk
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		target_y = get_viewport().get_mouse_position().y
