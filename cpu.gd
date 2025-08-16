extends StaticBody2D

var ball_pos : Vector2
var dist : int
var move_by : int
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
	
	# move paddle towards ball
	ball_pos = $"../Ball".position # get ball position
	dist = position.y - ball_pos.y # calc distance from ball
	
	if abs(dist) > get_parent().PADDLE_SPEED * delta:
		move_by = get_parent().PADDLE_SPEED * delta * (dist / abs(dist))
	else:
		move_by = dist
	
	position.y -= move_by
	
	# limit paddle movement to window
	position.y = clamp(position.y, top_position_limit, bottom_position_limit)
