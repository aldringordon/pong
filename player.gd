extends StaticBody2D

var win_height : int
var p_height : int
var top_position_limit : int
var bottom_position_limit : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	top_position_limit = p_height / 2
	bottom_position_limit = win_height - p_height / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += get_parent().PADDLE_SPEED * delta

	# limit paddle movement to window
	position.y = clamp(position.y, top_position_limit, bottom_position_limit)
