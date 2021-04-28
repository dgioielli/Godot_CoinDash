extends Area2D

## Sinais

signal pickup
signal hurt

## Constantes

const RUN = "run"
const IDLE = "idle"
const HURT = "hurt"

const GROUP_COINS = "coins"
const GROUP_OBSTACLES = "obstacles"

## Variáveis

# Usar o termo export me permite preencher esse valor no inspetor.
# O tipo entre parenteses serve para o inspetor saber o que deve ser utilizado.
export (int) var speed

var velocity = Vector2()
var screesize = Vector2(720, 480)

## Funções de eventos e padrão do sistema

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	get_input()
	position += velocity * delta
	position.x = clamp(position.x, 0, screesize.x)
	position.y = clamp(position.y, 0, screesize.y)
	if (velocity.length() > 0):
		$AnimatedSprite.animation = RUN
		$AnimatedSprite.flip_h = velocity.x < 0
	else:
		$AnimatedSprite.animation = IDLE

## Funções de sinais

func _on_Player_area_entered(area):
	if (area.is_in_group(GROUP_COINS)):
		area.pickup()
		emit_signal("pickup")
	elif (area.is_in_group(GROUP_OBSTACLES)):
		emit_signal("hurt")
		die()
	pass # Replace with function body.

## Funções internas da classe:

func get_input():
	velocity = Vector2()
	if (Input.is_action_pressed("ui_left")):
		velocity.x -= 1
	if (Input.is_action_pressed("ui_right")):
		velocity.x += 1
	if (Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	if (Input.is_action_pressed("ui_down")):
		velocity.y += 1
	velocity = velocity.normalized() * speed

func start(pos):
	set_process(true)
	position = pos
	$AnimatedSprite.animation = IDLE

func die():
	$AnimatedSprite.animation = HURT
	set_process(false)

















