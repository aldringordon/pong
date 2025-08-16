extends Sprite2D

var score := [0, 0] # [0: Player, 1: CPU]
const PADDLE_SPEED : int = 500
var MAX_SCORE : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_main_menu()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_main_menu():
	$Hud.hide()
	$GameOver.hide()
	$Menu.show()

func start_new_game(difficulty: String, maxScore: int):
	set_paddle_speed(difficulty)
	MAX_SCORE = maxScore
	score = [0, 0]
	$Hud/CPUScore.text = "0"
	$Hud/PlayerScore.text = "0"
	$Player.position = Vector2(50, 324)
	$CPU.position = Vector2(1082, 324)
	$Menu.hide()
	$Hud.show()
	$BallTimer.start()

func set_paddle_speed(difficulty: String):
	if difficulty == "Easy":
		$Ball.START_SPEED = 350
		$CPU.p_speed = 200
		MAX_SCORE = 3
	if difficulty == "Normal":
		$Ball.START_SPEED = 500
		$CPU.p_speed = 500
		MAX_SCORE = 5
	if difficulty == "Hard":
		$Ball.START_SPEED = 800
		$CPU.p_speed = 800
		MAX_SCORE = 8

func end_game():
	if score[0] == MAX_SCORE:
		$GameOver.show_game_over_screen("You Won")
	else:
		$GameOver.show_game_over_screen("You Lost")

# Called when somebody scores
# When max score reach end game and open menu
func scored():
	
	$Ball.reset_ball()
	$Ball.stop_ball()	
	if score[0] >= MAX_SCORE or score[1] >= MAX_SCORE:
		end_game()
	else:
		await get_tree().create_timer(1.0).timeout
		$BallTimer.start()

func _on_ball_timer_timeout() -> void:
	$Ball.new_ball()

func _on_score_left_body_entered(body: Node2D) -> void:
	$ExplodeSound.play()
	score[1] += 1
	$Hud/CPUScore.text = str(score[1])
	scored()

func _on_score_right_body_entered(body: Node2D) -> void:
	$CoinSound.play()
	score[0] += 1
	$Hud/PlayerScore.text = str(score[0])
	scored()
