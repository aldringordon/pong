extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	layer = 1025 # because ui only lets set layer to 128 and GODOT ui elements get drawn on 1024


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
