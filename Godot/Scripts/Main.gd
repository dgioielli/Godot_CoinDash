extends Node2D

## Variáveis

export (PackedScene) var Coin
export (PackedScene) var Powerup
export (int) var play_time

var level
var score
var time_left
var screensize
var playing = false

## Funções de sistema

func _ready():
	randomize()
	screensize = get_viewport_rect().size
	$Player.screesize = screensize
	$Player.hide()

func _process(delta):
	if (playing and $CoinContainer.get_child_count() == 0):
		level += 1
		time_left += 5
		$HUD.update_timer(time_left)
		$LevelSound.play()
		spawn_coins()
		$PowerupTimer.wait_time = rand_range(5, 10)
		$PowerupTimer.start()

## Funções de eventos

func _on_GameTimer_timeout():
	time_left -= 1
	$HUD.update_timer(time_left)
	if (time_left <= 0):
		game_over()
	pass # Replace with function body.

func _on_Player_pickup(type):
	match (type):
		"coin":
			score += 1
			$HUD.update_score(score)
			$CoinSound.play()
		"powerup":
			time_left += 5
			$PowerSound.play()
			$HUD.update_timer(time_left)
	pass # Replace with function body.

func _on_Player_hurt():
	game_over()
	pass # Replace with function body.

func _on_PowerupTimer_timeout():
	var p = Powerup.instance()
	add_child(p)
	p.screensize = screensize
	p.position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))
	pass # Replace with function body.


## Funções da classe

func new_game():
	playing = true
	level = 1
	score = 0
	time_left = play_time
	$HUD.update_score(score)
	$HUD.update_timer(time_left)
	$Player.show()
	$Player.start($PlayerStart.position)
	$GameTimer.start()
	spawn_coins()

func spawn_coins():
	for i in range(4 + level):
		var c = Coin.instance()
		$CoinContainer.add_child(c)
		c.screensize = screensize
		c.position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))

func game_over():
	playing = false
	$GameTimer.stop()
	$EndSound.play()
	for coin in $CoinContainer.get_children():
		coin.queue_free()
		$HUD.show_game_over()
		$Player.die()
	pass

























