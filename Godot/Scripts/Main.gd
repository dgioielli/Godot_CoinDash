extends Node2D

## Variáveis

export (PackedScene) var Coin
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
	new_game()

func _process(delta):
	if (playing and $CoinContainer.get_child_count() == 0):
		level += 1
		time_left += 5
		spawn_coins()

## Funções da classe

func new_game():
	playing = true
	level = 1
	score = 0
	time_left = play_time
	$Player.show()
	$GameTimer.start()
	spawn_coins()

func spawn_coins():
	for i in range(4 + level):
		var c = Coin.instance()
		$CoinContainer.add_child(c)
		c.screensize = screensize
		c.position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))
		













