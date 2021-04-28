extends CanvasLayer

## Sinais

signal start_game

## Funções de Sistema

func _ready():
	pass

## Funções de eventos

func _on_MessageTimer_timeout():
	$MessageLabel.hide()
	pass # Replace with function body.

func _on_StartButton_pressed():
	$StartButton.hide()
	$MessageLabel.hide()
	emit_signal("start_game")
	pass # Replace with function body.

## Funções da classe

func update_score(value):
	$MarginContainer/ScoreLabel.text = str(value)

func update_timer(value):
	$MarginContainer/TimeLabel.text = str(value)

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "Coin Dash!"
	$MessageLabel.show()


















