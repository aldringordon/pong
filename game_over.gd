extends CanvasLayer

signal open_menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#hide()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func show_game_over_screen(message: String, score: Array):
	$WinnerMessage.text = message
	$ScoreMessage.text = str(score[0]) + " - " + str(score[1])
	show()


func _on_menu_button_pressed() -> void:
	$ClickSound.play()
	open_menu.emit()
