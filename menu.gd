extends CanvasLayer

signal start_game(difficulty: String, max_score: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#hide()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_start_button_pressed() -> void:
	var selectedDifficulty = $OptionButton.get_selected_id()
	var difficulty = $OptionButton.get_item_text(selectedDifficulty)
	
	var selectedMaxScore = $ScoreButton.get_selected_id()
	var maxScore = $ScoreButton.get_item_text(selectedMaxScore)
	
	$ClickSound.play()
	
	start_game.emit(difficulty, int(maxScore))


func _on_score_button_pressed() -> void:
	$ClickSound.play()

func _on_score_button_item_selected(index: int) -> void:
	$ClickSound.play()

func _on_option_button_pressed() -> void:
	$ClickSound.play()

func _on_option_button_item_selected(index: int) -> void:
	$ClickSound.play()
