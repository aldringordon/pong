extends CanvasLayer

signal pause_resume
signal pause_restart
signal pause_menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	hide()
	$ClickSound.play()


func _on_restart_button_pressed() -> void:
	pause_restart.emit()
	hide()
	$ClickSound.play()


func _on_menu_button_pressed() -> void:
	pause_menu.emit()
	hide()
	$ClickSound.play()
