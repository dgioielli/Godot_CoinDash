extends Area2D

## Constantes

const GROUP_OBSTACLES = "obstacles"

## Variáveis

var screensize

## Funções do sistema

func _ready():
	$Tween.interpolate_property($AnimatedSprite, "scale", $AnimatedSprite.scale, $AnimatedSprite.scale * 3, 0.3, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($AnimatedSprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.3, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	
	pass

## Funções de Eventos

func _on_Tween_tween_completed(object, key):
	queue_free()
	pass # Replace with function body.


func _on_Lifetime_timeout():
	queue_free()
	pass # Replace with function body.

func _on_Powerup_area_entered(area):
	if (area.is_in_group(GROUP_OBSTACLES)):
		position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))
	pass # Replace with function body.

## Funções da classe

func pickup():
	monitoring = false
	$Tween.start()
	#queue_free()



